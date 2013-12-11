//
//  PlaceOrderDataController.h
//  QSUser
//
//  Created by Hunter Houston on 7/28/13.
//
//

#import <Foundation/Foundation.h>
#import "Order.h"

@class Order;
@class LogInViewController;

@interface PlaceOrderDataController : NSObject

@property (nonatomic, copy) NSMutableArray *masterOrderArray;

- (NSUInteger) countOfList;
- (Order *)objectInListAtIndex:(NSUInteger)theIndex;
- (void)addDrinksToOrder:(Order *)order;


@end
