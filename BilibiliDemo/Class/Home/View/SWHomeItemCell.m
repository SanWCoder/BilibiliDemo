//
//  SWHomeItemCell.m
//  BilibiliDemo
//
//  Created by SanW on 16/8/16.
//  Copyright © 2016年 SanW. All rights reserved.
//

#import "SWHomeItemCell.h"
#import "Header.h"

@interface SWHomeItemCell ()
/**
 *  直播背景图
 */
@property (nonatomic,strong) UIImageView *playBg;
/**
 *  用户按钮
 */
@property (nonatomic,weak)UIButton *userBtn;
/**
 *  用户名
 */
@property (nonatomic,weak)UILabel *userNameLabel;
/**
 *  直播数
 */
@property (nonatomic,weak)UILabel *liveCountLabel;
/**
 *  直播内容
 */
@property (nonatomic,weak)UILabel *liveContentLabel;
@end

@implementation SWHomeItemCell

+ (instancetype)itemCellWithcollectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *identifier = NSStringFromClass([self class]);
    SWHomeItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    return cell;
}
/**
 *  在initWithFrame中创建子控件
 *
 *  @param frame frame
 *
 *  @return return value
 */
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
     // 创建子控件
        self.backgroundColor = [UIColor colorWithHexString:@"f0f0f0"];
        [self createSubView];
    }
    return self;
}
/**
 *  创建子控件
 */
- (void)createSubView{
    UIImageView *playBg = [[UIImageView alloc]init];
    self.playBg = playBg;
    playBg.userInteractionEnabled = NO;
    [self.contentView addSubview:playBg];
    
    UIButton *userBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.userBtn = userBtn;
    [self.contentView addSubview:userBtn];
    
    UILabel *userNameLabel = [[UILabel alloc]init];
    self.userNameLabel = userNameLabel;
    [self.contentView addSubview:userNameLabel];
    userNameLabel.font = kFont(12);
    
    UILabel *liveCountLabel = [[UILabel alloc]init];
    self.liveCountLabel = liveCountLabel;
    [self.contentView addSubview:liveCountLabel];
    liveCountLabel.font = kFont(12);
    liveCountLabel.textAlignment = NSTextAlignmentCenter;
    liveCountLabel.backgroundColor = [UIColor colorWithWhite:0.800 alpha:1.000];
    liveCountLabel.layer.cornerRadius = 5;
    liveCountLabel.layer.masksToBounds = YES;
    
    UILabel *liveContentLabel = [[UILabel alloc]init];
    self.liveContentLabel = liveContentLabel;
    liveContentLabel.textColor = [UIColor colorWithHexString:@"a09f9f"];
    [self.contentView addSubview:liveContentLabel];
    liveContentLabel.font = kFont(12);
   
}
- (void)setLivesModel:(SWLivesModel *)livesModel
{
    _livesModel = livesModel;
    
    // 赋值
    [self addData];
    // 布局
    [self addLayout];
}
// 赋值
- (void)addData{
    [self.playBg sd_setImageWithURL:[NSURL URLWithString:self.livesModel.cover[@"src"]] placeholderImage:[UIImage imageNamed:@"default_img"]];
    [self.userBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:self.livesModel.owner[@"face"]] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"default_img"]];
    self.userNameLabel.text = self.livesModel.owner[@"name"];
    self.liveCountLabel.text = [NSString stringWithFormat:@"%d",self.livesModel.online];
    self.liveContentLabel.text = self.livesModel.title;
}
// 布局
- (void)addLayout{
    self.playBg.sd_layout
    .leftSpaceToView(self.contentView,kMargin)
    .topSpaceToView(self.contentView,kMargin)
    .widthIs(145)
    .heightIs(100);
    self.playBg.layer.cornerRadius = 5;
    self.playBg.layer.masksToBounds = YES;
    
    self.userBtn.sd_layout
    .leftEqualToView(self.playBg)
    .topSpaceToView(self.playBg,-20)
    .widthIs(40)
    .heightIs(40);
    
    self.userBtn.layer.cornerRadius = self.userBtn.width/2;
    self.userBtn.layer.masksToBounds = YES;
    
    
    self.userNameLabel.sd_layout
    .leftSpaceToView(self.userBtn,kMargin)
    .bottomEqualToView(self.userBtn)
    .heightIs(20)
    .rightEqualToView(self.playBg);
    
    self.liveCountLabel.sd_layout
    .leftEqualToView(self.userBtn)
    .rightEqualToView(self.userBtn)
    .topSpaceToView(self.userBtn,kMargin)
    .heightIs(20);
    
    self.liveContentLabel.sd_layout
    .leftEqualToView(self.userNameLabel)
    .rightEqualToView(self.userNameLabel)
    .bottomEqualToView(self.liveCountLabel)
    .topEqualToView(self.liveCountLabel);
    
    [self setupAutoHeightWithBottomView:self.liveCountLabel bottomMargin:kMargin];
}
@end
