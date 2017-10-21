//
//  SWReachability.m
//  BilibiliDemo
//
//  Created by SanW on 16/8/18.
//  Copyright © 2016年 SanW. All rights reserved.
//

#import "SWReachability.h"
@implementation SWReachability
/**
 *  网络是否连接
 *
 *  @return
 */
+ (BOOL)connetIsReacha
{
    // 创建实例
    AFNetworkReachabilityManager *manage = [AFNetworkReachabilityManager manager];
    return manage.isReachable;
}
/**
 *  判断当前网络状态
 *
 *  @return 网络状态
 */

+ (NSString *)reachabilityStatus
{
    // 创建实例
    AFNetworkReachabilityManager *manage = [AFNetworkReachabilityManager manager];
    // 获取网络状态
    AFNetworkReachabilityStatus status = [manage networkReachabilityStatus];
    switch (status) {
        case AFNetworkReachabilityStatusReachableViaWiFi:
            return @"WiFi";
            break;
        case AFNetworkReachabilityStatusReachableViaWWAN:
            return @"WWAN";
            break;
        case AFNetworkReachabilityStatusNotReachable:
            return @"NotReachable";
            break;
        case AFNetworkReachabilityStatusUnknown:
            return @"Unknown";
            break;
        default:
            return @"Unknown";
            break;
    }
}
/**
 * 开始网络监控
 *
 *  @param netStatus 网络状态
 */
+ (void)startMonitoring:(void(^)(AFNetworkReachabilityStatus status))netStatus{
    // 创建实例
    AFNetworkReachabilityManager *manage = [AFNetworkReachabilityManager manager];
    // 网络改变时的回调
    [manage setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if (status) {
            netStatus(status);
        }
    }];
    // 开始监控
    [manage startMonitoring];
}
/**
 *  取消网络监听
 */
+ (void)stopMonitoring
{
    // 创建实例
    AFNetworkReachabilityManager *manage = [AFNetworkReachabilityManager manager];
    // 取消网络监听
    [manage stopMonitoring];
}
@end
