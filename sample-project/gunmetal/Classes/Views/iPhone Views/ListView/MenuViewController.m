//
//  VenuesDetailViewController.m
//  QSUser
//
//  Created by Hunter Houston on 7/28/13.
//
//

#import "MenuViewController.h"
#import "VenuesViewController.h"
#import "DrinksViewController.h"
#import "Venue.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

@synthesize venue;
//@synthesize venueName;

/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.order =  [[NSMutableArray alloc] init];//make sure view did load only happens once, not everytime you go back to this view
    NSLog(@"CHECK____________");
    self.title = venue.venueName;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView

{
    
    return 1;
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    //return [self.dataController countOfList];
    return [self.venue.drinkTypes count];
}




 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     
     UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"DrinkTypeCell"];
     cell.textLabel.text = [venue.drinkTypes objectAtIndex:indexPath.row];
     
     return cell;
 }

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    NSString *selectedDrinkType = [self.venue.drinkTypes objectAtIndex:[self.tableView indexPathForSelectedRow].row];
    //DrinksViewController *dvc = [[DrinksViewController alloc] initWithDrinkTypeName:selectedDrinkType barId:self.venue.venueId];
    //[segue setDestinationViewController:dvc];
    [[segue destinationViewController] setDrinkTypeName:selectedDrinkType];
    [[segue destinationViewController] setBarId:self.venue.venueId];
    [[segue destinationViewController] setDrinks:self.order];
    NSLog(@"... drinktype: %@",selectedDrinkType);
    NSLog(@".. barId: %@",self.venue.venueId);
}

 /*
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    // Return NO if you do not want the specified item to be editable.
    
    return NO;
    
}
*/





@end
