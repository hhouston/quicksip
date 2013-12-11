
#import "PlaceOrderViewController.h"
#import "PlaceOrderDataController.h"
#import "VenuesViewController.h"
#import "Order.h"
#import "Venue.h"

@interface PlaceOrderViewController ()
- (void) configureView;

@end

@implementation PlaceOrderViewController

@synthesize venueLabel;
//@synthesize venueName;

- (void)viewWillAppear:(BOOL)animated
{
}
- (void)viewDidLoad

{
    
    [super viewDidLoad];
    //[self configureView];
    //self.venueLabel.text = venueName;
    // Do any additional setup after loading the view, typically from a nib.
    //
    
}

- (void)awakeFromNib

{
    
    [super awakeFromNib];
    
    self.dataController = [[PlaceOrderDataController alloc] init];
    
}


- (void)addOrder:(Order *) newOrder

{
    
    if (_order != newOrder) {
        
        _order = newOrder;
        
        
        // Update the view.
        
        [self configureView];
        
    }
    
}



- (void)configureView

{
    
    // Update the user interface for the detail item.
    
    Order *theOrder = self.order;
    
    
    
    static NSDateFormatter *formatter = nil;
    
    if (formatter == nil) {
        
        formatter = [[NSDateFormatter alloc] init];
        
        [formatter setDateStyle:NSDateFormatterMediumStyle];
        
    }
    
    if (theOrder) {
        
        self.beerLabel.text = @"Beer";
        self.shotLabel.text = @"Shot";

        //self.venueLabel.text = theOrder.venue;
        
        self.dateLabel.text = [formatter stringFromDate:(NSDate *)theOrder.date];
        
    }
    
}



- (void)didReceiveMemoryWarning

{
    
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
    
}



#pragma mark - Table View



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView

{
    
    return 1;
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    //return [self.dataController countOfList];
    return 4;
}


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"OrderCell";
    
    static NSDateFormatter *formatter = nil;
    
    if (formatter == nil) {
        
        formatter = [[NSDateFormatter alloc] init];
        
        [formatter setDateStyle:NSDateFormatterMediumStyle];
        
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    
    Order *sightingAtIndex = [self.dataController objectInListAtIndex:indexPath.row];
    
    [[cell textLabel] setText:sightingAtIndex.name];
    
    [[cell detailTextLabel] setText:[formatter stringFromDate:(NSDate *)sightingAtIndex.date]];
    
    return cell;
    
}


*/
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    // Return NO if you do not want the specified item to be editable.
    
    return NO;
    
}







@end