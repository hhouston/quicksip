//
//  PlaceOrderViewController.h
//  gunmetal
//
//  Created by Hunter Houston on 7/28/13.
//
//

#import <UIKit/UIKit.h>

@class PlaceOrderDataController;
@class Order;

@interface PlaceOrderViewController : UITableViewController

@property (strong, nonatomic) PlaceOrderDataController *dataController;

@property (strong, nonatomic) Order *order;
@property (weak, nonatomic) IBOutlet UILabel *beerLabel;
@property (weak, nonatomic) IBOutlet UILabel *shotLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@property (nonatomic, strong) IBOutlet UILabel *venueLabel;


@end
