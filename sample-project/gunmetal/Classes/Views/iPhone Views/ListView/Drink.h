//
//  Drink.h
//  QSUser
//
//  Created by Hunter Houston on 8/16/13.
//
//

#import <Parse/Parse.h>

@interface Drink : NSObject

@property (nonatomic, strong) NSString *venueId, *venueName, *drinkId, *drinkName;
@property (nonatomic, strong) NSMutableArray *drinkTypes;
@property (nonatomic, strong) NSNumber *quantity;

- (id) initWithName:(NSString*)drinkName drinkId:(NSString*)drinkId venueName:(NSString*)venueName venueId:(NSString*)venueId drinkTypes:(NSMutableArray*)drinkTypes quantity:(NSNumber*)quantity;
@end
