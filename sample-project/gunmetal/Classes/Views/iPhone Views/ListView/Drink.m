//
//  Drink.m
//  QSUser
//
//  Created by Hunter Houston on 8/16/13.
//
//

#import "Drink.h"

@implementation Drink
- (id) initWithName:(NSString*)drinkName drinkId:(NSString*)drinkId venueName:(NSString*)venueName venueId:(NSString*)venueId drinkTypes:(NSMutableArray *)drinkTypes quantity:(NSNumber *)quantity {
    self = [super init];
    if (self) {
        _drinkName = drinkName;
        _drinkId = drinkId;
        _venueName = venueName;
        _venueId = venueId;
        _drinkTypes = drinkTypes;
        _quantity = quantity;
        return self;
    }
    return nil;
}
@end
