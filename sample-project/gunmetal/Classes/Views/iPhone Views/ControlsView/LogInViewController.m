//
//  iPhoneControlsController.m
//  gunmetal
//
//  Created by Valentin on 5/13/122.
//  Copyright (c) 2012 AppDesignVault. All rights reserved.
//

#import "LogInViewController.h"
#import "ProfileViewController.h"

#import "ProfileViewController.h"
#import "STSegmentedControl.h"
#import "RCSwitchOnOff.h"
#import "PopoverDemoController.h"
#import "CustomPopoverBackgroundView.h"
#import "SampleSegment.h"
#import <QuartzCore/QuartzCore.h>

static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3;
static const CGFloat MINIMUM_SCROLL_FRACTION = 0.2;
static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
static const CGFloat PORTRAIT_KEYBOARD_HEIGHT = 216;
static const CGFloat LANDSCAPE_KEYBOARD_HEIGHT = 140;

CGFloat animatedDistance;

@interface LogInViewController ()
@property (assign) BOOL loggedIn;
@end

@implementation LogInViewController

@synthesize logInButton;

#pragma mark - View lifecycle
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    self.title = @"Facebook Profile";
//    
//    // Check if user is cached and linked to Facebook, if so, bypass login
//    if ([PFUser currentUser] && [PFFacebookUtils isLinkedWithUser:[PFUser currentUser]]) {
//        //[self.navigationController pushViewController:[[ProfileViewController alloc] initWithStyle:UITableViewStyleGrouped] animated:NO];
//        //ProfileViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"PVC"];
//        //[self.navigationController pushViewController:controller animated:YES];
//    }
//}
/* Login to facebook method */
//- (IBAction)loginButtonTouchHandler:(id)sender  {
//    // Set permissions required from the facebook user account
//    NSArray *permissionsArray = @[ @"user_about_me", @"user_relationships", @"user_birthday", @"user_location"];
//    
//    // Login PFUser using facebook
//    [PFFacebookUtils logInWithPermissions:permissionsArray block:^(PFUser *user, NSError *error) {
//        [_activityIndicator stopAnimating]; // Hide loading indicator
//        
//        if (!user) {
//            if (!error) {
//                NSLog(@"Uh oh. The user cancelled the Facebook login.");
//                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Log In Error" message:@"Uh oh. The user cancelled the Facebook login." delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Dismiss", nil];
//                [alert show];
//            } else {
//                NSLog(@"Uh oh. An error occurred: %@", error);
//                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Log In Error" message:[error description] delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Dismiss", nil];
//                [alert show];
//            }
//        } else if (user.isNew) {
//            NSLog(@"User with facebook signed up and logged in!");
//            [self.navigationController pushViewController:[[ProfileViewController alloc] initWithStyle:UITableViewStyleGrouped] animated:YES];
//        } else {
//            NSLog(@"User with facebook logged in!");
//            //[self.navigationController pushViewController:[[ProfileViewController alloc] initWithStyle:UITableViewStyleGrouped] animated:YES];
//        }
//    }];
//    
//    [_activityIndicator startAnimating]; // Show loading indicator until login is finished
//}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if ([PFUser currentUser] && [PFFacebookUtils isLinkedWithUser:[PFUser currentUser]]) {

        NSLog(@"view will appear 1");
        [logInButton setTitle:@"Log Out" forState:UIControlStateNormal];

        self.welcomeLabel.text = [NSString stringWithFormat:NSLocalizedString(@"Welcome %@!", nil), [[PFUser currentUser] username]];
    } else {
        NSLog(@"view will appear 2");
        [logInButton setTitle:@"Log In" forState:UIControlStateNormal];
        self.welcomeLabel.text = NSLocalizedString(@"Not logged in", nil);
    }
}


- (void)viewDidLoad {
    //self.title = @"Facebook Profile";
    
    PFUser *currentUser = [PFUser currentUser];
    if (currentUser) {
        _loggedIn = YES;

        logInButton.titleLabel.text = @"Log Out";
        //[self setButtonTitle:self];
        
        //UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"logged in" message:@"logged in" delegate:nil cancelButtonTitle:@"log out" otherButtonTitles:nil, nil];
        //[alert show];
        //[alert release];
        //[PFUser logOut];
    } else {
        _loggedIn = NO;
        logInButton.titleLabel.text = @"Log In";

        //[self setButtonTitle:self];
    }
    // Check if user is cached and linked to Facebook, if so, bypass login
    //if ([PFUser currentUser] && [PFFacebookUtils isLinkedWithUser:[PFUser currentUser]]) {
        //NSLog(@"already logged in");

        //[self.navigationController pushViewController:[ProfileViewController alloc] animated:NO];
    //}
    
    UIColor* bgColor = [UIColor colorWithPatternImage:[UIImage tallImageNamed:@"bg.png"]];
    [self.view setBackgroundColor:bgColor];
    
    CALayer* shadowLayer = [self createShadowWithFrame:CGRectMake(0, 0, 320, 5)];
    
    [self.view.layer addSublayer:shadowLayer];
    
    [super viewDidLoad];
    

}


- (IBAction)logInButtonTouchHandler:(id)sender  {
    
    if (![PFUser currentUser]) { // No user logged in
        NSLog(@"user is not logged in");
        
        // Create the log in view controller
        PFLogInViewController *logInViewController = [[PFLogInViewController alloc] init];
        [logInViewController setDelegate:self]; // Set ourselves as the delegate
        
        // Create the sign up view controller
        PFSignUpViewController *signUpViewController = [[PFSignUpViewController alloc] init];
        [signUpViewController setDelegate:self]; // Set ourselves as the delegate
        
        // Assign our sign up controller to be displayed from the login controller
        [logInViewController setSignUpController:signUpViewController];
        
        // Present the log in view controller
        [self presentViewController:logInViewController animated:YES completion:NULL];
    
    } else {
        NSLog(@"user trying to log out");
        //logInButton.titleLabel.text = @"Log In";
        [PFUser logOut];
        _loggedIn = NO;
        [self setButtonTitle:self];
    }

}
    /*
     PFUser *currentUser = [PFUser currentUser];
     
     if (_loggedIn && currentUser) {
     [self setButtonTitle:self];
     [PFUser logOut];
     _loggedIn = NO;
     //PFUser *currentUser = [PFUser currentUser];
     PFObject *orderObject = [PFObject objectWithClassName:@"_User"];
     [orderObject setObject:[NSNumber numberWithInt:1337] forKey:@"beer"];
     NSLog(@"user logged out");
     } else {
     PFLogInViewController *login = [[PFLogInViewController alloc] init];
     login.fields = PFLogInFieldsUsernameAndPassword | PFLogInFieldsLogInButton | PFLogInFieldsTwitter |PFLogInFieldsFacebook | PFLogInFieldsSignUpButton | PFLogInFieldsPasswordForgotten;
     login.delegate = self;
     login.signUpController.delegate = self;
     [self presentModalViewController:login animated:YES];
     _loggedIn = YES;
     
     NSLog(@"User logged in");
     PFUser *user = [PFUser currentUser];
     user.username = @"my name";
     user.password = @"my password";
     
     }
     */
    
    
- (IBAction)sendObject:(id)sender {
    PFUser *currentUser = [PFUser currentUser];
    [currentUser setObject:@"415-392-0202" forKey:@"phone"];
    NSLog(@"Welcome %@!", [[PFUser currentUser] username]);
    [currentUser saveInBackground];
}
- (IBAction)setButtonTitle:(id)sender {
    if (![PFUser currentUser]){        
        [self.logInButton setTitle:@"Log In" forState: UIControlStateNormal];
        NSLog(@"set button called:");
    }
}

// Sent to the delegate to determine whether the log in request should be submitted to the server.
- (BOOL)logInViewController:(PFLogInViewController *)logInController shouldBeginLogInWithUsername:(NSString *)username password:(NSString *)password {
    // Check if both fields are completed
    if (username && password && username.length && password.length) {
        return YES; // Begin login process
    }
    
    [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Missing Information", nil) message:NSLocalizedString(@"Make sure you fill out all of the information!", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil] show];
    return NO; // Interrupt login process
}
// Sent to the delegate when a PFUser is logged in.
- (void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

// Sent to the delegate when the log in attempt fails.
- (void)logInViewController:(PFLogInViewController *)logInController didFailToLogInWithError:(NSError *)error {
    NSLog(@"Failed to log in...");
}

// Sent to the delegate when the log in screen is dismissed.
- (void)logInViewControllerDidCancelLogIn:(PFLogInViewController *)logInController {
    [self.navigationController popViewControllerAnimated:YES];
    _loggedIn = YES;
    logInButton.titleLabel.text = @"Log Out";
}
// Sent to the delegate to determine whether the sign up request should be submitted to the server.
- (BOOL)signUpViewController:(PFSignUpViewController *)signUpController shouldBeginSignUp:(NSDictionary *)info {
    BOOL informationComplete = YES;
    
    // loop through all of the submitted data
    for (id key in info) {
        NSString *field = [info objectForKey:key];
        if (!field || field.length == 0) { // check completion
            informationComplete = NO;
            break;
        }
    }
    
    // Display an alert if a field wasn't completed
    if (!informationComplete) {
        [[[UIAlertView alloc] initWithTitle:@"Missing Information"
                                    message:@"Make sure you fill out all of the information!"
                                   delegate:nil
                          cancelButtonTitle:@"ok"
                          otherButtonTitles:nil] show];
    }
    
    return informationComplete;
}

// Sent to the delegate when a PFUser is signed up.
- (void)signUpViewController:(PFSignUpViewController *)signUpController didSignUpUser:(PFUser *)user {
    [self dismissModalViewControllerAnimated:YES]; // Dismiss the PFSignUpViewController
}

// Sent to the delegate when the sign up attempt fails.
- (void)signUpViewController:(PFSignUpViewController *)signUpController didFailToSignUpWithError:(NSError *)error {
    NSLog(@"Failed to sign up...");
}

// Sent to the delegate when the sign up screen is dismissed.
- (void)signUpViewControllerDidCancelSignUp:(PFSignUpViewController *)signUpController {
    NSLog(@"User dismissed the signUpViewController");
    _loggedIn = YES;
    logInButton.titleLabel.text = @"Log Out";
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    CGRect textFieldRect = [self.scrollView.window convertRect:textField.bounds fromView:textField];
    CGRect viewRect = [self.scrollView.window convertRect:self.scrollView.bounds fromView:self.scrollView];
    CGFloat midline = textFieldRect.origin.y + 0.5 * textFieldRect.size.height;
    CGFloat numerator =
    midline - viewRect.origin.y - MINIMUM_SCROLL_FRACTION * viewRect.size.height;
    CGFloat denominator =
    (MAXIMUM_SCROLL_FRACTION - MINIMUM_SCROLL_FRACTION) * viewRect.size.height;
    CGFloat heightFraction = numerator / denominator;
    
    if (heightFraction < 0.0)
    {
        heightFraction = 0.0;
    }
    else if (heightFraction > 1.0)
    {
        heightFraction = 1.0;
    }
    
    UIInterfaceOrientation orientation = 
    [[UIApplication sharedApplication] statusBarOrientation];
    if (orientation == UIInterfaceOrientationPortrait ||
        orientation == UIInterfaceOrientationPortraitUpsideDown)
    {
        animatedDistance = floor(PORTRAIT_KEYBOARD_HEIGHT * heightFraction);
    }
    else
    {
        animatedDistance = floor(LANDSCAPE_KEYBOARD_HEIGHT * heightFraction);
    }
    
    CGRect viewFrame = self.scrollView.frame;
    viewFrame.origin.y -= animatedDistance;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    
    [self.scrollView setFrame:viewFrame];
    
    [UIView commitAnimations];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    CGRect viewFrame = self.scrollView.frame;
    viewFrame.origin.y += animatedDistance;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    
    [self.scrollView setFrame:viewFrame];
    
    [UIView commitAnimations];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}


-(CALayer *)createShadowWithFrame:(CGRect)frame {
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = frame;
    
    
    UIColor* lightColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
    UIColor* darkColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    
    gradient.colors = @[(id)darkColor.CGColor, (id)lightColor.CGColor];
    
    return gradient;
}

- (void)viewDidUnload {
    [self setNativePB:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}
/*
- (void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user {
    [self dismissModalViewControllerAnimated:YES];
}
- (void)logInViewControllerDidCancelLogIn:(PFLogInViewController *)logInController {
    [self dismissModalViewControllerAnimated:YES];
}

- (void)signUpViewController:(PFSignUpViewController *)signUpController didSignUpUser:(PFUser *)user {
    [self dismissModalViewControllerAnimated:YES];
}

- (void)signUpViewControllerDidCancelSignUp:(PFSignUpViewController *)signUpController {
    [self dismissModalViewControllerAnimated:YES];
}
  */






















//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    
//        PFUser *currentUser = [PFUser currentUser];
//        if (currentUser) {
//            _loggedIn = YES;
//    
//            logInButton.titleLabel.text = @"Log Out";
//            //[self setButtonTitle:self];
//    
//            //UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"logged in" message:@"logged in" delegate:nil cancelButtonTitle:@"log out" otherButtonTitles:nil, nil];
//            //[alert show];
//            //[alert release];
//            //[PFUser logOut];
//        } else {
//            _loggedIn = NO;
//            logInButton.titleLabel.text = @"Log In";
//    
//            //[self setButtonTitle:self];
//        }
//        // Check if user is cached and linked to Facebook, if so, bypass login
//        //if ([PFUser currentUser] && [PFFacebookUtils isLinkedWithUser:[PFUser currentUser]]) {
//            //NSLog(@"already logged in");
//    
//            //[self.navigationController pushViewController:[ProfileViewController alloc] animated:NO];
//        //}
//    
//    
//    
//    
//    
//    
//    
//    self.title = @"Facebook Profile";
//    //self.tableView.backgroundColor = [UIColor colorWithRed:230.0f/255.0f green:230.0f/255.0f blue:230.0f/255.0f alpha:1.0f];
//    
//    // Add logout navigation bar button
//    //UIBarButtonItem *logoutButton = [[UIBarButtonItem alloc] initWithTitle:@"Log Out" style:UIBarButtonItemStyleBordered target:self action:@selector(logoutButtonTouchHandler:)];
//    //self.navigationItem.leftBarButtonItem = logoutButton;
//    
//    // Load table header view from nib
//    //[[NSBundle mainBundle] loadNibNamed:@"TableHeaderView" owner:self options:nil];
//    //self.tableView.tableHeaderView = self.headerView;
//    
//    // Create array for table row titles
//    self.rowTitleArray = @[@"Location", @"Gender", @"Date of Birth", @"Relationship"];
//    
//    // Set default values for the table row data
//    self.rowDataArray = [NSMutableArray arrayWithObjects:@"N/A", @"N/A", @"N/A", @"N/A", nil];
//    
//    // If the user is already logged in, display any previously cached values before we get the latest from Facebook.
//    if ([PFUser currentUser]) {
//        [self updateProfile];
//    }
//    
//    // Send request to Facebook
//    FBRequest *request = [FBRequest requestForMe];
//    [request startWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
//        // handle response
//        if (!error) {
//            // Parse the data received
//            NSDictionary *userData = (NSDictionary *)result;
//            
//            NSString *facebookID = userData[@"id"];
//            
//            NSURL *pictureURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large&return_ssl_resources=1", facebookID]];
//            
//            
//            NSMutableDictionary *userProfile = [NSMutableDictionary dictionaryWithCapacity:7];
//            
//            if (facebookID) {
//                userProfile[@"facebookId"] = facebookID;
//            }
//            
//            if (userData[@"name"]) {
//                userProfile[@"name"] = userData[@"name"];
//            }
//            
//            if (userData[@"location"][@"name"]) {
//                userProfile[@"location"] = userData[@"location"][@"name"];
//            }
//            
//            if (userData[@"gender"]) {
//                userProfile[@"gender"] = userData[@"gender"];
//            }
//            
//            if (userData[@"birthday"]) {
//                userProfile[@"birthday"] = userData[@"birthday"];
//            }
//            
//            if (userData[@"relationship_status"]) {
//                userProfile[@"relationship"] = userData[@"relationship_status"];
//            }
//            
//            if ([pictureURL absoluteString]) {
//                userProfile[@"pictureURL"] = [pictureURL absoluteString];
//            }
//            
//            [[PFUser currentUser] setObject:userProfile forKey:@"profile"];
//            [[PFUser currentUser] saveInBackground];
//            
//            [self updateProfile];
//        } else if ([[[[error userInfo] objectForKey:@"error"] objectForKey:@"type"]
//                    isEqualToString: @"OAuthException"]) { // Since the request failed, we can check if it was due to an invalid session
//            NSLog(@"The facebook session was invalidated");
//            [self logoutButtonTouchHandler:nil];
//        } else {
//            NSLog(@"Some other error: %@", error);
//        }
//    }];
//    
//}


#pragma mark - NSURLConnectionDataDelegate

/* Callback delegate methods used for downloading the user's profile picture */

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    // As chuncks of the image are received, we build our data file
    [self.imageData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    // All data has been downloaded, now we can set the image in the header image view
    self.headerImageView.image = [UIImage imageWithData:self.imageData];
    
    // Add a nice corner radius to the image
    //self.headerImageView.layer.cornerRadius = 8.0f;
    //self.headerImageView.layer.masksToBounds = YES;
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.rowTitleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        // Create the cell and add the labels
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake( 0.0f, 0.0f, 120.0f, 44.0f)];
        titleLabel.tag = 1; // We use the tag to set it later
        titleLabel.textAlignment = UITextAlignmentRight;
        titleLabel.font = [UIFont boldSystemFontOfSize:13.0f];
        titleLabel.backgroundColor = [UIColor clearColor];
        
        UILabel *dataLabel = [[UILabel alloc] initWithFrame:CGRectMake( 130.0f, 0.0f, 165.0f, 44.0f)];
        dataLabel.tag = 2; // We use the tag to set it later
        dataLabel.font = [UIFont systemFontOfSize:15.0f];
        dataLabel.backgroundColor = [UIColor clearColor];
        
        [cell.contentView addSubview:titleLabel];
        [cell.contentView addSubview:dataLabel];
    }
    
    // Cannot select these cells
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    // Access labels in the cell using the tag #
    UILabel *titleLabel = (UILabel *)[cell viewWithTag:1];
    UILabel *dataLabel = (UILabel *)[cell viewWithTag:2];
    
    // Display the data in the table
    titleLabel.text = [self.rowTitleArray objectAtIndex:indexPath.row];
    dataLabel.text = [self.rowDataArray objectAtIndex:indexPath.row];
    
    return cell;
}


#pragma mark - ()

- (void)logoutButtonTouchHandler:(id)sender {
    // Logout user, this automatically clears the cache
    [PFUser logOut];
    
    // Return to login view controller
    [self.navigationController popToRootViewControllerAnimated:YES];
}

// Set received values if they are not nil and reload the table
- (void)updateProfile {
    if ([[PFUser currentUser] objectForKey:@"profile"][@"location"]) {
        [self.rowDataArray replaceObjectAtIndex:0 withObject:[[PFUser currentUser] objectForKey:@"profile"][@"location"]];
    }
    
    if ([[PFUser currentUser] objectForKey:@"profile"][@"gender"]) {
        [self.rowDataArray replaceObjectAtIndex:1 withObject:[[PFUser currentUser] objectForKey:@"profile"][@"gender"]];
    }
    
    if ([[PFUser currentUser] objectForKey:@"profile"][@"birthday"]) {
        [self.rowDataArray replaceObjectAtIndex:2 withObject:[[PFUser currentUser] objectForKey:@"profile"][@"birthday"]];
    }
    
    if ([[PFUser currentUser] objectForKey:@"profile"][@"relationship"]) {
        [self.rowDataArray replaceObjectAtIndex:3 withObject:[[PFUser currentUser] objectForKey:@"profile"][@"relationship"]];
    }
    
    //[self.tableView reloadData];
    
    // Set the name in the header view label
    if ([[PFUser currentUser] objectForKey:@"profile"][@"name"]) {
        self.headerNameLabel.text = [[PFUser currentUser] objectForKey:@"profile"][@"name"];
    }
    
    // Download the user's facebook profile picture
    self.imageData = [[NSMutableData alloc] init]; // the data will be loaded in here
    
    if ([[PFUser currentUser] objectForKey:@"profile"][@"pictureURL"]) {
        NSURL *pictureURL = [NSURL URLWithString:[[PFUser currentUser] objectForKey:@"profile"][@"pictureURL"]];
        
        NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:pictureURL
                                                                  cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                              timeoutInterval:2.0f];
        // Run network request asynchronously
        NSURLConnection *urlConnection = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self];
        if (!urlConnection) {
            NSLog(@"Failed to download picture");
        }
    }
}


@end
