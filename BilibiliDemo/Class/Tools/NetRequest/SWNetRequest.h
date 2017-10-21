//
//  SWNetRequest.h
//  BilibiliDemo
//
//  Created by SanW on 16/8/16.
//  Copyright © 2016年 SanW. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWNetRequest : NSObject
/**
 *  get请求
 *
 *  @param URLString 请求地址
 *  @param params    请求参数
 *  @param success   成功的回调
 *  @param progress  请求进度的回调
 *  @param failure   失败的回调
 */
+ (void)getURLString:(NSString *)URLString params:(NSMutableDictionary *)params success:(void(^)(id  responseObject))success progress:(void(^)(NSProgress *downloadProgress))progress failure:(void(^)(NSError *error))failure;
/**
 *  post请求
 *
 *  @param URLString 请求地址
 *  @param params    请求参数
 *  @param success   成功的回调
 *  @param progress  请求进度的回调
 *  @param failure   失败的回调
 */
+ (void)postURLString:(NSString *)URLString params:(NSMutableDictionary *)params success:(void(^)(id  responseObject))success progress:(void(^)(NSProgress *downloadProgress))progress failure:(void(^)(NSError *error))failure;
/**
 *  put请求
 *
 *  @param URLString 请求地址
 *  @param params    请求参数
 *  @param success   成功的回调
 *  @param failure   失败的回调
 */
+ (void)putURLString:(NSString *)URLString params:(NSMutableDictionary *)params success:(void(^)(id  responseObject))success failure:(void(^)(NSError *error))failure;
/**
 *  delete请求
 *
 *  @param URLString 请求地址
 *  @param params    请求参数
 *  @param success   成功的回调
 *  @param failure   失败的回调
 */
+ (void)deleteURLString:(NSString *)URLString params:(NSMutableDictionary *)params success:(void(^)(id  responseObject))success failure:(void(^)(NSError *error))failure;
@end
