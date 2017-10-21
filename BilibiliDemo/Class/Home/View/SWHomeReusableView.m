//
//  SWHomeReusableView.m
//  BilibiliDemo
//
//  Created by SanW on 16/8/19.
//  Copyright © 2016年 SanW. All rights reserved.
//

#import "SWHomeReusableView.h"
#import "Header.h"

@interface SWHomeReusableView ()
/**
 *  区域分类按钮
 */
@property (nonatomic,weak) UIButton *areaBtn;
/**
 *  当前直播人数标签
 */
@property (nonatomic,weak) UILabel *liveCountLabel;
/**
 *  点击进入button
 */
@property (nonatomic,weak) UIButton *clickToBtn;
@end

@implementation SWHomeReusableView
/**
 *  快速创建headerView
 *
 *  @param collectionView collectionView
 *  @param indexPath      indexPath
 *
 *  @return <#return value description#>
 */
+ (instancetype)headerReView:(UICollectionView *)collectionView supplementaryElementOfKind:(NSString *)kind indexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = NSStringFromClass([self class]);
    SWHomeReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:identifier forIndexPath:indexPath];
    return header;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        // 创建子控件
        [self createSubView];
        // 设置背景图
        self.backgroundColor = [UIColor colorWithHexString:@"f0f0f0"];
    }
    return self;
}
// 创建子控件
- (void)createSubView{
    UIButton *areaBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.areaBtn = areaBtn;
    [self addSubview:areaBtn];
    [areaBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    areaBtn.titleLabel.font = kFont(14);
    
    UILabel *liveCountLabel = [[UILabel alloc]init];
    self.liveCountLabel = liveCountLabel;
    [self addSubview:liveCountLabel];
    liveCountLabel.textAlignment = NSTextAlignmentRight;
    liveCountLabel.font = kFont(14);
    
    UIButton *clickToBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.clickToBtn = clickToBtn;
    [self addSubview:clickToBtn];
    
    
}
- (void)setPartitionsModel:(SWPartitionsModel *)partitionsModel
{
    _partitionsModel = partitionsModel;
    // 赋值
    [self addData];
    //  布局
    [self addLayout];
    
}
// 赋值
- (void)addData{
    if ([self.kind isEqualToString:UICollectionElementKindSectionHeader]) {
        [self.areaBtn sd_setImageWithURL:[NSURL URLWithString:self.partitionsModel.sub_icon[@"src"]] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"default_img"]];
        [self.areaBtn setTitle:self.partitionsModel.name forState:UIControlStateNormal];
        self.liveCountLabel.text = [NSString stringWithFormat:@"当前%d个直播，进去看看",self.partitionsModel.count];
        
        [self.clickToBtn setImage:[UIImage imageNamed:@"更多"] forState:UIControlStateNormal];
    }
    else
    {
        
        [self.areaBtn setTitle:@"查看更多"forState:UIControlStateNormal];
        self.areaBtn.layer.cornerRadius = 5;
        self.areaBtn.layer.masksToBounds = YES;
        self.areaBtn.layer.borderColor = [UIColor grayColor].CGColor;
        self.areaBtn.layer.borderWidth = 1;
        self.liveCountLabel.text = [NSString stringWithFormat:@"%d个动态，点击刷新",self.partitionsModel.count];
        
        [self.clickToBtn setImage:[UIImage imageNamed:@"home_refresh"] forState:UIControlStateNormal];
    }
    
}
// 布局
- (void)addLayout{

    self.areaBtn.sd_layout
    .leftSpaceToView(self,kMargin)
    .topSpaceToView(self,kMargin)
    .widthIs(100)
    .heightIs(30);
    
    self.areaBtn.imageView.sd_layout
    .leftSpaceToView(self.areaBtn,0)
    .centerYEqualToView(self.areaBtn)
    .widthIs(20)
    .heightEqualToWidth();
    
    self.areaBtn.titleLabel.sd_layout
    .leftSpaceToView(self.areaBtn.imageView,kMargin)
    .rightSpaceToView(self.areaBtn, 0)
    .centerYEqualToView(self.areaBtn)
    .heightIs(20);
    
    self.clickToBtn.sd_layout
    .rightSpaceToView(self,kMargin)
    .widthIs(30)
    .heightIs(30)
    .topEqualToView(self.areaBtn);
    
    self.liveCountLabel.sd_layout
    .leftSpaceToView(self.areaBtn,kMargin)
    .rightSpaceToView(self.clickToBtn,kMargin)
    .topEqualToView(self.areaBtn)
    .bottomEqualToView(self.areaBtn);
}

@end
