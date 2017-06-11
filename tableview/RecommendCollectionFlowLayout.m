
#import "RecommendCollectionFlowLayout.h"
#import "Common.h"

@implementation RecommendCollectionFlowLayout
- (instancetype)init
{
    if (self = [super init]) {
        self.itemSize = CGSizeMake(RECOMMEND_ITEM_WIDTH, RECOMMEND_ITEM_HEIGHT);
        self.minimumLineSpacing = ITEM_PADDING;
        self.minimumInteritemSpacing = ITEM_PADDING;
        self.sectionInset = UIEdgeInsetsMake(0, ITEM_PADDING, 0, ITEM_PADDING);
    }
    return self;
}
@end
