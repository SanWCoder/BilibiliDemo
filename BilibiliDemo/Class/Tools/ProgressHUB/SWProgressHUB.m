//
//  SWProgressHUB.m
//  BilibiliDemo
//
//  Created by SanW on 16/8/17.
//  Copyright © 2016年 SanW. All rights reserved.
//
#import "SWProgressHUB.h"

@implementation SWProgressHUB

/**
 *  显示不带提示语的提示框
 */
+ (void)show
{
    //  设置基本属性
    [self setDefault];
    [SVProgressHUD show];
}
/**
 *  隐藏提示框
 */
+ (void)dismiss
{
    // 设置基本属性
    [self setDefault];
    // 隐藏
    [SVProgressHUD dismiss];
}
/**
 *  隐藏提示框
 *
 *  @param timeInterval 多少时间后隐藏
 *  @param completion   隐藏完成后的回调
 */
+ (void)dismissWithDelay:(double)timeInterval completion:(void(^)())completion
{
    // 设置基本属性
    [self setDefault];
    // 隐藏
    [SVProgressHUD dismissWithDelay:timeInterval completion:^{
        completion();
    }];
}
/**
 *  显示文字提示框
 *
 *  @param status 提示文字
 */
+ (void)showWithStatus:(NSString *)status
{
    // 设置基本属性
    [self setDefault];
    // 显示提示信息
    [SVProgressHUD showWithStatus:status];
}
/**
 *  显示警告信息提示框
 *
 *  @param infoStatus 警告提示文字
 */
+ (void)showWithInfoStatus:(NSString *)infoStatus
{
    // 设置基本属性
    [self setDefault];
    // 显示警告提示信息
    [SVProgressHUD showInfoWithStatus:infoStatus];
}
/**
 *  显示进度
 *
 *  @param progress 进度
 */
+ (void)showWithProgress:(float)progress
{
    // 设置基本属性
    [self setDefault];
    // 显示进度
    [SVProgressHUD showProgress:progress];
}
/**
 *  成功的提示框
 *
 *  @param successStatus 成功提示语
 */
+ (void)showSuccessWithStatus:(NSString *)successStatus
{
    // 设置基本属性
    [self setDefault];
    // 成功提示
    [SVProgressHUD showSuccessWithStatus:successStatus];
}
/**
 *  失败的提示框
 *
 *  @param errorStatus 失败提示语
 */
+ (void)showErrorWithStatus:(NSString *)errorStatus
{
    // 设置基本属性
    [self setDefault];
    // 错误的提示
    [SVProgressHUD showErrorWithStatus:errorStatus];
}
/**
 *  展示图片显示框
 *
 *  @param image  图片
 *  @param status 提示语
 */
+ (void)showImage:(UIImage *)image status:(NSString *)status
{
    // 设置基本属性
    [self setDefault];
    // 提示
    [SVProgressHUD showImage:image status:status];
}
/**
 *  设置基本属性
 */
+ (void)setDefault{
    // 设置默认样式
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    // 设置默认背景颜色类型
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    // 设置默认动画类型
    [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeNative];
}
@end
