
#import "RecommendTableViewCell.h"
#import "Common.h"
//#import "DYData.h"
#import "RecommendCollectionCell.h"
//#import "UIImageView+WebCache.h"
#import "RecommendCollectionFlowLayout.h"
//#import "DYRoom.h"

// 判断改cell是否被重用
static BOOL isReused = NO;

@interface RecommendTableViewCell () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, weak) UICollectionView *collectionView;
@end

@implementation RecommendTableViewCell

- (void)setDyData:(NSArray *)dyData
{
    _dyData = dyData;
    
    // 未重用cell在init方法中会自动刷新collectionView，重复刷新会导致画面卡顿，需在此进行判断
    if (isReused) {
        // 重用cell不会自动调用collectionView数据源方法自动刷新，会导致显示图片为重用cell之前的图片，需在此手动刷新
        [self.collectionView reloadData];
    }
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
    }
    return self;
}

-(void)layoutSubviews{

    [super layoutSubviews];
    
    [self setupCollectionView];
}

- (void)setupCollectionView
{
//    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, RECOMMEND_CELL_HEIGHT) collectionViewLayout:[[RecommendCollectionFlowLayout alloc] init]];
    
      UICollectionView *collectionView ;

    
    if ([self.dyData count]%2==0) {
        
//       collectionView= [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, RECOMMEND_ITEM_HEIGHT*[self.dyData count]/2+ITEM_PADDING) collectionViewLayout:[[RecommendCollectionFlowLayout alloc] init]];
        
        
     collectionView=   [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.frame.size.height) collectionViewLayout:[[RecommendCollectionFlowLayout alloc] init]];
        
    }else{
        
//        collectionView= [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, RECOMMEND_ITEM_HEIGHT*([self.dyData count]/2+1)+ITEM_PADDING) collectionViewLayout:[[RecommendCollectionFlowLayout alloc] init]];
        collectionView=   [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.frame.size.height+RECOMMEND_ITEM_HEIGHT+ITEM_PADDING) collectionViewLayout:[[RecommendCollectionFlowLayout alloc] init]];

        
    }

    
//    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.frame.size.height) collectionViewLayout:[[RecommendCollectionFlowLayout alloc] init]];

    self.collectionView = collectionView;
    [self.contentView addSubview:collectionView];
    [collectionView registerNib:[UINib nibWithNibName:@"RecommendCollectionCell" bundle:nil] forCellWithReuseIdentifier:COLLECTION_IDENTIFIER];
    collectionView.backgroundColor = [UIColor clearColor];
    collectionView.dataSource = self;
    collectionView.delegate = self;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    NSString *const identifier = @"collection";
    RecommendTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    isReused = YES;
    if (cell == nil) {
        cell = [[RecommendTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        isReused = NO;
    }
    return cell;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

#pragma mark - collectionView 数据源

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.dyData count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    RecommendCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:COLLECTION_IDENTIFIER forIndexPath:indexPath];
    // 设置cell显示内容
//    DYRoom *room = self.dyData.roomlist[indexPath.item];
//    cell.room = room;
    
    return cell;
}

#pragma mark - collectionView 代理

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.delegate respondsToSelector:@selector(recommendTableViewCell:didSelectItemAtIndexPath:)]) {
        [self.delegate recommendTableViewCell:self didSelectItemAtIndexPath:indexPath];
    }
}

@end
