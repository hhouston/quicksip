//
//  Venue.m
//  QSUser
//
//  Created by Hunter Houston on 8/13/13.
//
//

#import "Venue.h"

@implementation Venue

- (id) initWithName:(NSString*)venueName venueId:(NSString*)venueId drinkTypes:(NSMutableArray *)drinkTypes drinkIds:(NSMutableArray *)drinkIds {
    self = [super init];
    if (self) {
        _venueName = venueName;
        _venueId = venueId;
        _drinkTypes = drinkTypes;
        _drinkIds = drinkIds;
        return self;
    }
    return nil;
}

@end

