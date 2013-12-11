//
//  ListViewController.m
//  gunmetal
//
//  Created by Valentin Filip on 5/13/12.
//  Copyright (c) 2012 AppDesignVault. All rights reserved.
//

#import "VenuesViewController.h"
#import "PlaceOrderViewController.h"
#import "MenuViewController.h"
#import "MasterCell.h"
#import "Order.h"

@interface VenuesViewController ()

@end

@implementation VenuesViewController

@synthesize venues;
@synthesize venueName;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.vname.text = self.venueName;
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
    cell.textLabel.text = object[@"name"];
    venues = object[@"name" ];
    NSLog(@"VENUES: %@",venues);
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
    //venueName = @"Bar";
    //VenuesViewController *selectedVenue = [[VenuesViewController alloc] init];
    //NSString *vName = self.venues[[self.tableView indexPathForSelectedRow]];
    //NSLog(@"vname = %@",vName);
   if ([segue.identifier isEqualToString:@"ShowMenu"])
    {
        //PlaceOrderDataController *povc = [segue destinationViewController];
        //Order *order = nil;
        //order.
        //order = self.venues[[self.tableView indexPathForSelectedRow]];
    VenuesViewController *selectedVenue = self.venues[[self.tableView indexPathForSelectedRow]];
    MenuViewController *povc = [segue destinationViewController];
    povc.vname = selectedVenue;
    //[povc setVenueName:selectedVenue];
    //NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    //Order *order = nil;
    //order = [ objectAtIndexPath:indexPath];
    //PlaceOrderDataController *povc = [segue destinationViewController];
    //[[segue destinationViewController] setVenueName:(venueName)];
    }
    //VenuesViewController *vvc = [segue destinationViewController];
    //vvc.venueName = _venueName;
    //NSLog(@"Venue Name: %@",venueName);
    //[self.navigationController pushViewController:destinationViewController animated:YES];
	//povc.venueName = selectedVenue;

    //if ([[segue identifier] isEqualToString:@"ShowMenu"]) {
        //NSLog(@"sup");
        //Order *destinationViewController = [segue destinationViewController];
        //[self.navigationController pushViewController:vvc animated:YES];
    //}
    //destinationViewController.venue = selectedVenue;


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
