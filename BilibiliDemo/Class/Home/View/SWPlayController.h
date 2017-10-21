//
//  SWPlayController.h
//  BilibiliDemo
//
//  Created by SanW on 16/8/18.
//  Copyright © 2016年 SanW. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^backBlock)();
typedef void(^playOrPauseBlock)(UIButton *playOrPauseBtn);
typedef void(^hideBlock)(UIView *controllView);
@interface SWPlayController : UIView

/**
 *  返回按钮的回调
 */
@property (nonatomic,copy) backBlock backBlock;

/**
 * 暂停播放按钮的回调
 */
@property (nonatomic,copy) playOrPauseBlock playOrPauseBlock;
/**
 * 隐藏控制视图
 */
@property (nonatomic,copy) hideBlock hideBlock;

@end
