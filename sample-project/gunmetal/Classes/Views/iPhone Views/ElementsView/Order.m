//
//  orderViewController.m
//  gunmetal
//
//  Created by Hunter Houston on 7/28/13.
//
// 

#import "Order.h"

@interface Order()

@end

@implementation Order

- (id)initWithName:(NSString *)name date:(NSDate *)date beer:(NSNumber *)beer wine:(NSNumber *)wine shot:(NSNumber *)shot total:(NSNumber *)total venue:(NSString *)venue orderNumber:(NSNumber *)orderNumber{
    self = [super init];
    if (self) {
        _name = name;
        _date = date;
        _total = total;
        _orderNumber = orderNumber;
        
        return self;
    }
    return nil;
}


@end
