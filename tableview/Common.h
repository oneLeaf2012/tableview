#import <Foundation/Foundation.h>

#ifndef Common_h
#define Common_h

// 屏幕宽度
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
// item宽度
#define RECOMMEND_ITEM_WIDTH ((SCREEN_WIDTH - 3 * ITEM_PADDING) * 0.5)
// item高度
#define RECOMMEND_ITEM_HEIGHT (RECOMMEND_ITEM_WIDTH / 3 * 2 + 60)
// tableView行高
#define RECOMMEND_CELL_HEIGHT (RECOMMEND_ITEM_HEIGHT * 2 + ITEM_PADDING)


// 新人推荐tableView行高
extern const int ROOKIE_CELL_HEIGHT;
// 视频推荐cell间距
extern const int ITEM_PADDING;
// 弹幕默认字体大小
extern const double DANMU_FONT_SIZE;
// 弹幕字体最小
extern const double DANMU_FONT_MAXSIZE;
// 弹幕字体最大
extern const double DANMU_FONT_MINISIZE;
// 弹幕默认透明度
extern const double DANMU_ALPHA;

extern NSString * const COLLECTION_IDENTIFIER;

#endif /* Common_h */
