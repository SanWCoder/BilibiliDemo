//
//  SWHomeViewModel.h
//  BilibiliDemo
//
//  Created by SanW on 16/8/16.
//  Copyright © 2016年 SanW. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^videoLoadStateDidChangeBlock)(NSNotification *notification);
typedef void(^videoPlaybackDidFinishBlock)(NSNotification *notification);
typedef void(^videoBackIsPreparedToPlayDidChangeBlock)(NSNotification *notification);
typedef void(^videoPlaybackStateDidChange)(NSNotification *notification);
/**
 * 1.ViewModel用来封装一些控制器里的逻辑操作
 * 2.不允许出现视图和Push等方法
 */
@interface SWHomeViewModel : NSObject
/**
 *  请求直播数据
 *
 *  @param success  成功的回调
 *  @param progress 进度回调
 *  @param failure  失败的回调
 */
+ (void)getHomeData:(void(^)(NSMutableArray *liveData,NSMutableArray *classfyData))success progress:(void(^)(NSProgress *downloadProgress))progress failure:(void(^)(NSError *error))failure;
/**
 *  注册通知
 */
+ (void)addPlayerNotification;

@property (nonatomic,copy)videoLoadStateDidChangeBlock videoLoadStateDidChangeBlock;
/**
 * 标题
 */
@property (nonatomic,copy)videoPlaybackDidFinishBlock videoPlaybackDidFinishBlock;
/**
 * 标题
 */
@property (nonatomic,copy)videoBackIsPreparedToPlayDidChangeBlock videoBackIsPreparedToPlayDidChangeBlock;
/**
 * 标题
 */
@property (nonatomic,copy)videoPlaybackStateDidChange videoPlaybackStateDidChange;


@end
