//
//  DrinkTableViewCell.m
//  QSUser
//
//  Created by Hunter Houston on 8/16/13.
//
//

#import "DrinkTableViewCell.h"

@implementation DrinkTableViewCell


@synthesize drinkLabel = _drinkLabel;
@synthesize minusButton = _minusButton;
@synthesize plusButton = _plusButton;
@synthesize quantityLabel = _quantityLabel;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    quantity = 0;

    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

-(void)setQuantityLabel:quantity{
    [_quantityLabel setText:[NSString stringWithFormat:@"%@" , quantity]];
}

/*
 - (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
 {
 self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
 if (self) {
 // Initialization code
 }
 return self;
 }
 
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
