//
//  SWReachability.h
//  BilibiliDemo
//
//  Created by SanW on 16/8/18.
//  Copyright © 2016年 SanW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworkReachabilityManager.h"

@interface SWReachability : NSObject
/**
 *  网络是否连接
 *
 *  @return
 */
+ (BOOL)connetIsReacha;
/**
 *  判断当前网络状态
 *
 *  @return 网络状态
 */
+ (NSString *)reachabilityStatus;
/**
 * 开始网络监控
 *
 *  @param netStatus 网络状态
 */
+ (void)startMonitoring:(void(^)(AFNetworkReachabilityStatus status))netStatus;
/**
 *  取消网络监听
 */
+ (void)stopMonitoring;
@end
