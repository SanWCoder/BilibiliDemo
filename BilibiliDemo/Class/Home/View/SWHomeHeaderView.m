//
//  SWHomeHeaderView.m
//  BilibiliDemo
//
//  Created by SanW on 16/8/19.
//  Copyright © 2016年 SanW. All rights reserved.
//

#import "SWHomeHeaderView.h"
#import "Header.h"
@interface SWHomeHeaderView ()


@end

@implementation SWHomeHeaderView
/**
 *  初始化时创建子视图
 *
 *  @param frame frame description
 *
 *  @return return value description
 */
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        // 创建子视图
        [self addSubviews];
         self.backgroundColor = [UIColor colorWithWhite:0.800 alpha:1.000];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    // 给子视图布局
    [self addLayout];
}
// 创建子视图
- (void)addSubviews{
    [self addSubview:self.backBtn];
    [self addSubview:self.loadingImge];
    [self addSubview:self.fillScreenBtn];
    [self addSubview:self.messageLabel];
}
// 给子视图布局
- (void)addLayout
{
    self.backBtn.sd_layout
    .leftSpaceToView(self,kMargin)
    .topSpaceToView(self,kMargin *2)
    .widthIs(30)
    .heightIs(30);
    
    self.loadingImge.sd_layout
    .centerXEqualToView(self)
    .centerYEqualToView(self)
    .widthIs(100)
    .heightIs(100);
    
    self.messageLabel.sd_layout
    .rightSpaceToView(self,kMargin)
    .centerYEqualToView(self.backBtn)
    .widthIs(100)
    .heightIs(30);
    
    self.fillScreenBtn.sd_layout
    .rightSpaceToView(self,kMargin)
    .bottomSpaceToView(self,kMargin)
    .widthIs(20)
    .heightIs(20);
}
/****************创建子控制器*****************/
- (UIButton *)backBtn
{
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backBtn setBackgroundImage:[UIImage imageNamed:@"play_back_full"] forState:UIControlStateNormal];
    }
    return _backBtn;
}
- (UIButton *)fillScreenBtn
{
    if (!_fillScreenBtn) {
        _fillScreenBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_fillScreenBtn setBackgroundImage:[UIImage imageNamed:@"kr-video-player-fullscreen"] forState:UIControlStateNormal];
        [_fillScreenBtn setBackgroundImage:[UIImage imageNamed:@"kr-video-player-shrinkscreen"] forState:UIControlStateNormal];
    }
    return _fillScreenBtn;
}
- (UIImageView *)loadingImge
{
    if (!_loadingImge) {
        _loadingImge = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"common_pull_loading_1"]];
    }
    return _loadingImge;
}
- (UILabel *)messageLabel
{
    if (!_messageLabel) {
        _messageLabel = [[UILabel alloc]init];
        _messageLabel.font = kFont(14);
        _messageLabel.textColor = [UIColor blackColor];
        _messageLabel.text = @"复制信息";
    }
    return _messageLabel;
}
@end
