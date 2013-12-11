//
//  PlaceOrderDataController.m
//  QSUser
//
//  Created by Hunter Houston on 7/28/13.
//
//

#import "PlaceOrderDataController.h"
#import "LogInViewController.h"

@interface PlaceOrderDataController()

- (void)initializeDefaultDataList;

@end

@implementation PlaceOrderDataController








/*
 * assings a new mutable array to the orderArray variable
 * uses default data to create a new Order object and
 * passes it to the addDrinksToOrder method which adds
 * new order to master list
 */

- (void)initializeDefaultDataList {

    PFUser *currentUser = [PFUser currentUser];
    

    [currentUser setObject:[NSNumber numberWithInt:5] forKey:@"beer"];
    //[orderObject setObject:[NSNumber numberWithInt:1337] forKey:@"wine"];
    //[orderObject setObject:[NSNumber numberWithInt:1337] forKey:@"shots"];
    [currentUser saveInBackground];

    
    
    NSMutableArray *orderArray = [[NSMutableArray alloc] init];
    self.masterOrderArray = orderArray;
    Order *order;
    
    NSDate *today = [NSDate date];
    /*
    order = [[Order alloc] initWithName:@"Pigeon"
                                                 date:today
                                                 beer:nil
                                                 wine:nil
                                                 shot:nil
                                                total:nil
                                  venue:nil
                                          orderNumber:nil];
    [self addDrinksToOrder:order];
    */
}

- (void)setMasterOrderArray:(NSMutableArray *)newArray {
    if(_masterOrderArray != newArray) {
        _masterOrderArray = [newArray mutableCopy];
    }
}

/* assigns to self the value teruned from the super class's initializer
 * if [super init] is succesful, the method the calls the initalizeDefaultDataList method that
 * you wrote earlier and returns the newly initialized instance of itself
 */
-(id)init {
    if (self = [super init]) {
        [self initializeDefaultDataList];
        return self;
    }
    return nil;
}

- (NSUInteger) countOfList {
    return [self.masterOrderArray count];
}

- (Order *)objectInListAtIndex:(NSUInteger)theIndex {
    return [self.masterOrderArray objectAtIndex:theIndex];
}
- (void)addDrinksToOrder:(Order *)order {
    [self.masterOrderArray addObject:order];
}
@end
