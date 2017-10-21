//
//  SWNetRequest.m
//  BilibiliDemo
//
//  Created by SanW on 16/8/16.
//  Copyright © 2016年 SanW. All rights reserved.
//

#import "SWNetRequest.h"
#import "AFNetworking.h"
/**
 *  请求超时时间
 *
 *  @param void <#void description#>
 *
 *  @return <#return value description#>
 */
#define kTimeoutInterval 60

@implementation SWNetRequest
/**
 *  get请求
 *
 *  @param URLString 请求地址
 *  @param params    请求参数
 *  @param success   成功的回调
 *  @param progress  请求进度的回调
 *  @param failure   失败的回调
 */
+ (void)getURLString:(NSString *)URLString params:(NSMutableDictionary *)params success:(void(^)(id responseObject))success progress:(void(^)(NSProgress *downloadProgress))progress failure:(void(^)(NSError *error))failure;
{
    // 创建SessionManager
    AFHTTPSessionManager *manager = [self createSessionManager];
    [manager GET:URLString parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        // 返回进度
        if (progress) {
            progress(downloadProgress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 成功的返回
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 失败返回
        if (failure) {
            failure(error);
        }
    }];
    
}
/**
 *  post请求
 *
 *  @param URLString 请求地址
 *  @param params    请求参数
 *  @param success   成功的回调
 *  @param progress  请求进度的回调
 *  @param failure   失败的回调
 */
+ (void)postURLString:(NSString *)URLString params:(NSMutableDictionary *)params success:(void(^)(id  responseObject))success progress:(void(^)(NSProgress *downloadProgress))progress failure:(void(^)(NSError *error))failure
{
    // 创建SessionManager
    AFHTTPSessionManager *manager = [self createSessionManager];
    [manager POST:URLString parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        // 进度
        if (progress) {
            progress(uploadProgress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 成功的回调
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 失败的回调
        if (failure) {
            failure (error);
        }
    }];
}
/**
 *  put请求
 *
 *  @param URLString 请求地址
 *  @param params    请求参数
 *  @param success   成功的回调
 *  @param failure   失败的回调
 */
+ (void)putURLString:(NSString *)URLString params:(NSMutableDictionary *)params success:(void(^)(id  responseObject))success failure:(void(^)(NSError *error))failure
{
    // 创建SessionManager
    AFHTTPSessionManager *manager = [self createSessionManager];
    [manager PUT:URLString parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 成功的回调
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 失败的回调
        if(failure){
            failure(error);
        }
    }];
}
/**
 *  delete请求
 *
 *  @param URLString 请求地址
 *  @param params    请求参数
 *  @param success   成功的回调
 *  @param failure   失败的回调
 */
+ (void)deleteURLString:(NSString *)URLString params:(NSMutableDictionary *)params success:(void(^)(id  responseObject))success failure:(void(^)(NSError *error))failure{
    // 创建SessionManager
    AFHTTPSessionManager *manager = [self createSessionManager];
    [manager DELETE:URLString parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 成功的回调
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 失败的回调
        if (failure) {
            failure(error);
        }
    }];
}
/**
 *  创建SessionManager
 *
 *  @return AFHTTPSessionManager
 */
+ (AFHTTPSessionManager *)createSessionManager{
    // 创建sessionManager
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 请求HTTP序列化
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    // 响应JSON序列化
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    // 设置响应时间(必须是这这三句才生效)
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = kTimeoutInterval;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    return manager;
}
@end
