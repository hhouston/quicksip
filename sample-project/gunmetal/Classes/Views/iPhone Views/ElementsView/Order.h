//
//  orderViewController.h
//  gunmetal
//
//  Created by Hunter Houston on 7/28/13.
//
//

#import <UIKit/UIKit.h>

@interface Order : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSDate *date;



@property (nonatomic, copy) NSNumber *total;
@property (nonatomic, copy) NSNumber *orderNumber;

-(id) initWithName:(NSString *)name
              date:(NSDate *)date
             total:(NSNumber *)total
       orderNumber:(NSNumber *)orderNumber;

@end
