//
//  Venue.h
//  QSUser
//
//  Created by Hunter Houston on 8/13/13.
//
//

#import <Foundation/Foundation.h>

@interface Venue : NSObject

@property (nonatomic, strong) NSString *venueId, *venueName;
@property (nonatomic, strong) NSMutableArray *drinkTypes, *drinkIds;

- (id) initWithName:(NSString*)venueName venueId:(NSString*)venueId drinkTypes:(NSMutableArray*)drinkTypes drinkIds:(NSMutableArray*)drinkIds;

@end
