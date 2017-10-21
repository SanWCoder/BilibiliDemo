//
//  SWProgressHUB.h
//  BilibiliDemo
//
//  Created by SanW on 16/8/17.
//  Copyright © 2016年 SanW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SVProgressHUD.h"
@interface SWProgressHUB : NSObject
/**
 *  显示不带提示语的提示框
 */
+ (void)show;
/**
 *  隐藏提示框
 */
+ (void)dismiss;
/**
 *  隐藏提示框
 *
 *  @param timeInterval 多少时间后隐藏
 *  @param completion   隐藏完成后的回调
 */
+ (void)dismissWithDelay:(double)timeInterval completion:(void(^)())completion;
/**
 *  显示文字提示框
 *
 *  @param status 提示文字
 */
+ (void)showWithStatus:(NSString *)status;
/**
 *  显示警告信息提示框
 *
 *  @param infoStatus 警告提示文字
 */
+ (void)showWithInfoStatus:(NSString *)infoStatus;
/**
 *  显示进度
 *
 *  @param progress 进度
 */
+ (void)showWithProgress:(float)progress;
/**
 *  成功的提示框
 *
 *  @param successStatus 成功提示语
 */
+ (void)showSuccessWithStatus:(NSString *)successStatus;
/**
 *  失败的提示框
 *
 *  @param errorStatus 失败提示语
 */
+ (void)showErrorWithStatus:(NSString *)errorStatus;
/**
 *  展示图片显示框
 *
 *  @param image  图片
 *  @param status 提示语
 */
+ (void)showImage:(UIImage *)image status:(NSString *)status;
@end
