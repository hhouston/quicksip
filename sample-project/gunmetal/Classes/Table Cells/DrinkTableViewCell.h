//
//  DrinkTableViewCell.h
//  QSUser
//
//  Created by Hunter Houston on 8/16/13.
//
//

#import <Parse/Parse.h>
int quantity;

@interface DrinkTableViewCell : PFTableViewCell

@property (nonatomic, strong) IBOutlet UILabel *drinkLabel;
@property (nonatomic, retain) IBOutlet UIButton *minusButton;
@property (nonatomic, retain) IBOutlet UIButton *plusButton;
@property (nonatomic, strong) IBOutlet UILabel *quantityLabel;
@property (nonatomic, retain) IBOutlet UIButton *addToOrderButton;


//-(IBAction)minusButtonAction:(id)sender;
//-(IBAction)plusButtonAction:(id)sender;
//-(IBAction)setQuantityLabel:(UILabel *)quantityLabel;

//-(void)setQuantityLabel:(int)quantity;
@end
