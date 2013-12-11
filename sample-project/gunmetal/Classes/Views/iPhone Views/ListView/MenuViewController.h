//
//  VenuesDetailViewController.h
//  QSUser
//
//  Created by Hunter Houston on 7/28/13.
//
//

#import <UIKit/UIKit.h>
@class Venue;
@interface MenuViewController : UITableViewController

@property (nonatomic, strong) IBOutlet UILabel *venueLabel;
@property (nonatomic, strong) Venue *venue;
@property (nonatomic) NSMutableArray *order;

@end

