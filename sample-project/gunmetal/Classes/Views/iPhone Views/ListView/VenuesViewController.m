//
//  ListViewController.m
//  gunmetal
//
//  Created by Valentin Filip on 5/13/12.
//  Copyright (c) 2012 AppDesignVault. All rights reserved.
//

#import "VenuesViewController.h"
#import "PlaceOrderViewController.h"
#import "MasterCell.h"
#import "Order.h"
#import "Venue.h"
#import "MenuViewController.h"

@interface VenuesViewController ()

@end

@implementation VenuesViewController

@synthesize venues;
@synthesize venueName;
@synthesize drinks, drinkIds;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.vname.text = self.venueName;
    self.venues = [[NSMutableArray alloc] init];
    //self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage tallImageNamed:@"bg.png"]];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


#pragma mark - Table view data source


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}
-(PFQuery*)queryForTable {
    PFQuery *query = [PFQuery queryWithClassName:@"Venue"];
    return query;
}

-(PFTableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object {
    PFTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"VenuesCell"];
    
    Venue *venueObject = [[Venue alloc] initWithName:object[@"name"] venueId:object.objectId drinkTypes:object[@"drinkTypes"] drinkIds:object[@"drinkIds"]];
    [venues insertObject:venueObject atIndex:indexPath.row];
    cell.textLabel.text = venueObject.venueName;
    NSLog(@"venues%@",venues);
//    drinkIds = venueObject.drinkIds;
//    NSLog(@"%@",drinkIds);
//    //Drink *drinkIds = [[Drink alloc] initWithName:object[@"drinkTypes"] ];
//    PFQuery *query2 = [PFQuery queryWithClassName:@"Drink"];
//    drinks = [query2 whereKey:@"drinkType" equalTo:drinkIds];

    return cell;
}
/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

#pragma mark - Table view delegate


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MasterCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VenueCell"];
    cell.disclosureImageView.image = [UIImage tallImageNamed:@"list-arrow.png"];
    
    return cell;
}
*/
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
    Venue *selectedVenue = [self.venues objectAtIndex:[self.tableView indexPathForSelectedRow].row];
    
    [[segue destinationViewController] setVenue:selectedVenue];

}


#pragma mark - Table view delegate

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //[tableView deselectRowAtIndexPath:indexPath animated:YES];
    //NSLog(@"Your implementation! :)");
    
    //UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle: nil];
    
    //PlaceOrderViewController *placeController = (PlaceOrderViewController*)[mainStoryboard instantiateViewControllerWithIdentifier: @"ShowMenu"];
    //[self.navigationController pushViewController:placeController animated:YES];
    
    //UIViewController *barViewController = [[PlaceOrderViewController alloc] init];
    //[self.navigationController pushViewController:barViewController animated:YES];
    
    //[self performSegueWithIdentifier:@"ShowMenu" sender:self];
//}

@end
