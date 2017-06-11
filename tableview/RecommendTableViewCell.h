
#import <UIKit/UIKit.h>
@class DYData;
@class RecommendTableViewCell;

@protocol RecommendTableViewCellDelegate <NSObject>

@optional
- (void)recommendTableViewCell:(RecommendTableViewCell *)cell didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface RecommendTableViewCell : UITableViewCell
@property (nonatomic, strong) DYData *dyData;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@property (nonatomic, weak) id<RecommendTableViewCellDelegate> delegate;
@end
