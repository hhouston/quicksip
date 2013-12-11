//
//  ListViewController.h
//  gunmetal
//
//  Created by Valentin Filip on 5/13/12.
//  Copyright (c) 2012 AppDesignVault. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VenuesViewController : PFQueryTableViewController

@property (strong, nonatomic) NSMutableArray *venues;
@property (strong, nonatomic) NSMutableArray *drinks;
@property (strong, nonatomic) NSMutableArray *drinkIds;

@property (strong, nonatomic) NSString *venueName;

@property (strong, nonatomic) IBOutlet UILabel *vname;
@end
