//
//  DrinksViewController.h
//  QSUser
//
//  Created by Hunter Houston on 8/13/13.
//
//

#import <UIKit/UIKit.h>
//@class Drink;
//int quantity2;

@interface DrinksViewController : PFQueryTableViewController

@property (nonatomic, strong) NSString *drinkTypeName, *barId, *drinkId, *drinkName;
//@property (nonatomic, strong) NSNumber *quantity;

@property (nonatomic) NSMutableArray *venues;
@property (nonatomic) NSMutableArray *drinks;
@property (nonatomic) NSMutableArray *drinkIds;
@property (nonatomic) NSMutableArray *order;


//- (id) initWithDrinkTypeName:(NSString*)_drinkTypeName barId:(NSString*)_barId;
-(IBAction)minusButtonAction:(id)sender;
-(IBAction)plusButtonAction:(id)sender;
-(IBAction)addToOrder:(id)sender;


@end
