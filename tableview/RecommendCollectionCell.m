
#import "RecommendCollectionCell.h"

@interface RecommendCollectionCell ()
@property (weak, nonatomic) IBOutlet UIImageView *recommendImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UILabel *onlineNumberLabel;
@end

@implementation RecommendCollectionCell

- (void)awakeFromNib
{
    
    [super awakeFromNib];
    
    self.backgroundColor = [UIColor whiteColor];
}

- (void)setRoom:(DYRoom *)room
{
    _room = room;
    
//    NSURL *imgURL = [NSURL URLWithString:[room.room_src stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
//    [self.recommendImageView sd_setImageWithURL:imgURL placeholderImage:[UIImage imageNamed:@"Img_default.png"] options:SDWebImageRetryFailed | SDWebImageLowPriority];
    self.nameLabel.text = @"name";
    self.onlineNumberLabel.text = @"在线人数";
    self.detailLabel.text =@"详情";
}

@end
