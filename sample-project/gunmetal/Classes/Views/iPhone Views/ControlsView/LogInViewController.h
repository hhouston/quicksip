//
//  iPhoneControlsController.h
//  gunmetal
//
//  Created by Valentin on 5/13/12.
//  Copyright (c) 2012 AppDesignVault. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADVPopoverProgressBar.h"

@interface LogInViewController : UIViewController <UITextFieldDelegate,PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate, NSURLConnectionDelegate> {
    UIButton *logInButton;
}

@property (nonatomic, strong) UISlider* slider;

@property (nonatomic, strong) IBOutlet UIScrollView* scrollView;

@property (nonatomic, strong) ADVPopoverProgressBar *progressBar;

@property (nonatomic, strong) IBOutlet UITextField *textInput;
@property (strong, nonatomic) IBOutlet UIProgressView *nativePB;


-(IBAction)logInButtonTouchHandler:(id)sender;
-(IBAction)setButtonTitle:(id)sender;
-(IBAction)sendObject:(id)sender;

@property (nonatomic, strong) IBOutlet UILabel *welcomeLabel;
@property (nonatomic, retain)IBOutlet UIButton *logInButton;
@property (nonatomic, strong) IBOutlet UIActivityIndicatorView *activityIndicator;

-(CALayer *)createShadowWithFrame:(CGRect)frame;







// UITableView header view properties
@property (nonatomic, strong) IBOutlet UIView *headerView;
@property (nonatomic, strong) IBOutlet UILabel *headerNameLabel;
@property (nonatomic, strong) IBOutlet UIImageView *headerImageView;

// UITableView row data properties
@property (nonatomic, strong) NSArray *rowTitleArray;
@property (nonatomic, strong) NSMutableArray *rowDataArray;
@property (nonatomic, strong) NSMutableData *imageData;

// UINavigationBar button touch handler
- (void)logoutButtonTouchHandler:(id)sender;

@end
