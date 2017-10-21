//
//  SWPlayController.m
//  BilibiliDemo
//
//  Created by SanW on 16/8/18.
//  Copyright © 2016年 SanW. All rights reserved.
//

#import "SWPlayController.h"
#import "Header.h"
@interface SWPlayController ()
/**
 *  标题
 */
@property (nonatomic,strong) UILabel *titleLabel;
/**
 *  播放过得时间
 */
@property (nonatomic,strong)UILabel *playedTimeLabel;
/**
 *  总共时间
 */
@property (nonatomic,strong)UILabel *totalTimeLabel;
/**
 *  返回按钮
 */
@property (nonatomic,strong)UIButton *backBtn;
/**
 *  播放暂停按钮
 */
@property (nonatomic,strong)UIButton *playOrPauseBtn;

/**
 *  全屏按钮
 */
@property (nonatomic,strong)UIButton *fillScreenBtn;
/**
 *  播放按钮
 */
@property (nonatomic,strong)UIButton *playBtn;
/**
 *  进度条
 */
@property (nonatomic,strong)UISlider *playingSlider;

@end

@implementation SWPlayController



- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        // 创建子视图
        [self addSubviews];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    // 为子视图布局
    [self addLayout];
    
}
// 创建子视图
- (void)addSubviews
{
    [self addSubview:self.backBtn];
    [self addSubview:self.titleLabel];
    [self addSubview:self.playOrPauseBtn];
    [self addSubview:self.playBtn];
    [self addSubview:self.playedTimeLabel];
    [self addSubview:self.playingSlider];
    [self addSubview:self.totalTimeLabel];
    [self addSubview:self.fillScreenBtn];
}
// 为子视图布局
- (void)addLayout
{
    self.backBtn.sd_layout
    .topSpaceToView(self,kMargin *2)
    .leftSpaceToView(self,kMargin)
    .heightIs(30)
    .widthIs(30);

    self.titleLabel.sd_layout
    .leftSpaceToView(self.backBtn,kMargin)
    .rightSpaceToView(self,kMargin)
    .centerYEqualToView(self.backBtn)
    .heightRatioToView(self.backBtn,1);
    
    self.playOrPauseBtn.sd_layout
    .leftEqualToView(self.backBtn)
    .bottomSpaceToView(self,kMargin)
    .heightIs(15)
    .widthIs(15);
    
    self.playedTimeLabel.sd_layout
    .leftSpaceToView(self.playOrPauseBtn,kMargin)
    .centerYEqualToView(self.playOrPauseBtn)
    .widthIs(50)
    .heightRatioToView(self.playOrPauseBtn,1);
    
    self.fillScreenBtn.sd_layout
    .rightSpaceToView(self,kMargin)
    .bottomEqualToView(self.playOrPauseBtn)
    .widthRatioToView(self.playOrPauseBtn,1)
    .heightRatioToView(self.playOrPauseBtn,1);
    
    self.totalTimeLabel.sd_layout
    .rightSpaceToView(self.fillScreenBtn,kMargin)
    .bottomEqualToView(self.playOrPauseBtn)
    .widthIs(50)
    .heightRatioToView(self.playOrPauseBtn,1);
    
    self.playingSlider.sd_layout
    .leftSpaceToView(self.playedTimeLabel,kMargin)
    .rightSpaceToView(self.totalTimeLabel,kMargin)
    .centerYEqualToView(self.playOrPauseBtn)
    .heightRatioToView(self.playOrPauseBtn,1);
    
    self.playBtn.sd_layout
    .rightSpaceToView(self,kMargin)
    .centerYEqualToView(self)
    .widthIs(50)
    .heightIs(50);
}

//      *******懒加载子控件********      //
/**
 *  懒加载标题
 *
 *  @return return value description
 */
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.font = kFont(14);
        _titleLabel.text = @"猴子真都比";
    }
    return _titleLabel;
}
- (UIButton *)playBtn
{
    if (!_playBtn) {
        _playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_playBtn setBackgroundImage:[UIImage imageNamed:@"暂停"] forState:UIControlStateNormal];
        [_playBtn setBackgroundImage:[UIImage imageNamed:@"video_list_cell_big_icon"] forState:UIControlStateSelected];
        [_playBtn addTarget:self action:@selector(playOrPauseClick:) forControlEvents:UIControlEventTouchUpInside];
        }
    return _playBtn;
}
- (UIButton *)playOrPauseBtn
{
    if (!_playOrPauseBtn) {
        _playOrPauseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_playOrPauseBtn setBackgroundImage:[UIImage imageNamed:@"kr-video-player-pause"] forState:UIControlStateNormal];
        [_playOrPauseBtn setBackgroundImage:[UIImage imageNamed:@"kr-video-player-play"] forState:UIControlStateSelected];
        [_playOrPauseBtn addTarget:self action:@selector(playOrPauseClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _playOrPauseBtn;
}
- (UIButton *)backBtn
{
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backBtn setBackgroundImage:[UIImage imageNamed:@"play_back_full"] forState:UIControlStateNormal];
        [_backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
}
- (UIButton *)fillScreenBtn
{
    if (!_fillScreenBtn) {
        _fillScreenBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_fillScreenBtn setBackgroundImage:[UIImage imageNamed:@"kr-video-player-fullscreen"] forState:UIControlStateNormal];
        [_fillScreenBtn setBackgroundImage:[UIImage imageNamed:@"kr-video-player-shrinkscreen"] forState:UIControlStateSelected];
    }
    return _fillScreenBtn;
}
- (UILabel *)playedTimeLabel
{
    if (!_playedTimeLabel) {
        _playedTimeLabel = [[UILabel alloc]init];
        _playedTimeLabel.textColor = [UIColor whiteColor];
        _playedTimeLabel.font = kFont(12);
        _playedTimeLabel.text = @"00:00";
    }
    return _playedTimeLabel;
}
- (UILabel *)totalTimeLabel
{
    if (!_totalTimeLabel) {
        _totalTimeLabel = [[UILabel alloc]init];
        _totalTimeLabel.textColor = [UIColor whiteColor];
        _totalTimeLabel.font = kFont(12);
        _totalTimeLabel.text = @"03:00";
    }
    return _totalTimeLabel;
}
- (UISlider *)playingSlider
{
    if (!_playingSlider) {
        _playingSlider = [[UISlider alloc]init];
        _playingSlider.minimumValueImage = [UIImage imageNamed:@"slider"];
        _playingSlider.minimumTrackTintColor = [UIColor blackColor];
        _playingSlider.maximumTrackTintColor = [UIColor redColor];
    }
    return _playingSlider;
}
//      *******控件执行方法********      //
/**
 *  返回
 */
- (void)back{
    if (_backBlock) {
        _backBlock();
    }
}
/**
 *  暂停或者播放
 */
- (void)playOrPauseClick:(UIButton *)playOrPauseBtn{
    playOrPauseBtn.selected = !playOrPauseBtn.selected;
    self.playOrPauseBtn.selected = playOrPauseBtn.selected;
    self.playBtn.selected = playOrPauseBtn.selected;
    
    if (_playOrPauseBlock) {
        _playOrPauseBlock(playOrPauseBtn);
    }
}
/**
 *  点击空白处执行隐藏视图的方法
 *
 *  @param touches <#touches description#>
 *  @param event   <#event description#>
 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (_hideBlock) {
        _hideBlock(self);
    }
}
@end
