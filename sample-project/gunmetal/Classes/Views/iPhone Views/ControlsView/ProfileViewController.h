//
//  ProfileViewController.h
//  QSUser
//
//  Created by Hunter Houston on 7/30/13.
//
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UITableViewController <NSURLConnectionDelegate>


// UITableView header view properties
@property (nonatomic, strong) IBOutlet UIView *headerView;
@property (nonatomic, strong) IBOutlet UILabel *headerNameLabel;
@property (nonatomic, strong) IBOutlet UIImageView *headerImageView;

// UITableView row data properties
@property (nonatomic, strong) NSArray *rowTitleArray;
@property (nonatomic, strong) NSMutableArray *rowDataArray;
@property (nonatomic, strong) NSMutableData *imageData;

// UINavigationBar button touch handler
- (void)logoutButtonTouchHandler:(id)sender;

@end
