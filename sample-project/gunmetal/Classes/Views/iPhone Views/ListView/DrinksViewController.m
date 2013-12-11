//
//  DrinksViewController.m
//  QSUser
//
//  Created by Hunter Houston on 8/13/13.
//
//

#import "DrinksViewController.h"
#import "MasterCell.h"
#import "DrinkTableViewCell.h"
#import "Drink.h"

@interface DrinksViewController ()

@end


@implementation DrinksViewController

@synthesize drinkTypeName, barId, drinks, order, drinkIds, drinkId;

/*
- (id) initWithDrinkTypeName:(NSString*)_drinkTypeName drinks:(NSString*)_barId {
    self = [super init];
    if (self) {
        self.drinkTypeName = _drinkTypeName;
        self.barId = _barId;
        //self.drinkName = _drinkName;
        
        NSLog(@"Print initWithDrinkTypeName");
        
        return self;
    }
    return nil;

}
*/

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = drinkTypeName;
    //quantity = 0;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}



/*
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 3;

}

*/
 
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(PFQuery*)queryForTable {
    PFQuery *query = [PFQuery queryWithClassName:@"Drink"];
    [query whereKey:@"drinkType" equalTo:self.drinkTypeName];
    [query whereKey:@"barId" equalTo:self.barId];
    return query;
}


-(PFTableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object {
    
//    PFTableViewCell *CellIdentifier = [self.tableView dequeueReusableCellWithIdentifier:@"DrinkCell"];
//    
//    CellIdentifier.textLabel.text = object[@"name"];
//
//    
    //static NSString *cell1 = @"DrinkCell";
    DrinkTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DrinkCell"];
    //cell2.drinkLabel.text = object[@"name"];

    Drink *drinkObject = [[Drink alloc] initWithName:object[@"name"] drinkId:object.objectId venueName:object[@"venueName"] venueId:object[@"venueId"] drinkTypes:object[@"drinkTypes"] quantity:object[@"quantity"]];
    [drinks insertObject:drinkObject atIndex:indexPath.row];
    NSLog(@"drinks %@",drinkObject.drinkName);
    cell.drinkLabel.text = drinkObject.drinkName;
//    //cell1 = [[MenuTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//
    return cell;

//    
//    Venue *venueObject = [[Venue alloc] initWithName:object[@"name"] venueId:object.objectId drinkTypes:object[@"drinkTypes"] drinkIds:object[@"drinkIds"]];
//    [venues insertObject:venueObject atIndex:indexPath.row];
    

    //return CellIdentifier;
}
- (IBAction)minusButtonAction:(id)sender  {
    if (quantity >= 1)
        quantity = quantity - 1;
    NSLog(@"-");
    

    //tempDrinkObj.quantity;
    
    
    //[_quantityLabel setText:[NSString stringWithFormat:@"%d" , quantity]];
}
- (IBAction)plusButtonAction:(id)sender  {
    NSLog(@"+");
    
    //Drink *selectedDrink= [self.drinks objectAtIndex:[self.tableView indexPathForSelectedRow].row];
    //NSLog(@"SELCECT DRINK %@",selectedDrink.drinkName);
    
    //order = [[NSMutableArray alloc] init];
    //[order addObject:selectedDrink];
    //NSLog(@"selectedDrink: %@",selectedDrink);
    //[_quantityLabel setText:[NSString stringWithFormat:@"%d" , quantity]];
    
    
    CGPoint buttonPosition = [sender convertPoint:CGPointZero toView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:buttonPosition];
    if (indexPath != nil)
    {
        Drink *selectedDrink= [self.drinks objectAtIndex:indexPath.row];
        
        NSNumber *quantity = selectedDrink.quantity;
        int value = [quantity intValue];
        quantity = [NSNumber numberWithInt:value + 1];
        selectedDrink.quantity = quantity;
        
        NSLog(@"Current quantity: %@", quantity);
        NSLog(@"SELCECT DRINK %@",selectedDrink.drinkName);

        //order = [[NSMutableArray alloc] init];
        //[order insertObject:selectedDrink atIndex:indexPath.row];
        NSLog(@"index path@%@",indexPath);
        //NSLog(@"selectedDrink: %@",selectedDrink);

    }
    
}

- (IBAction)addToOrder:(id)sender {
    NSLog(@"Add drinks to order");
//string indexPath = self.ind
    NSLog(@"Add drinks %@",drinks);
    
}

@end
