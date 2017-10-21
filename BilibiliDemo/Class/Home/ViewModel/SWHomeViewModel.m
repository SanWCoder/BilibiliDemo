//
//  SWHomeViewModel.m
//  BilibiliDemo
//
//  Created by SanW on 16/8/16.
//  Copyright © 2016年 SanW. All rights reserved.
//

#import "SWHomeViewModel.h"
#import "Header.h"
#import "SWClassifyLiveModel.h"
#import "SWPartitionsModel.h"
#import <IJKMediaFramework/IJKMediaFramework.h>
@implementation SWHomeViewModel
/**
 *  请求直播数据
 *
 *  @param success  成功的回调
 *  @param progress 进度回调
 *  @param failure  失败的回调
 */
+ (void)getHomeData:(void(^)(NSMutableArray *liveData,NSMutableArray *classfyData))success progress:(void(^)(NSProgress *downloadProgress))progress failure:(void(^)(NSError *error))failure
{
    NSMutableArray *classfyData = [[NSMutableArray alloc]init];
    NSMutableArray *liveData = [[NSMutableArray alloc]init];
    [SWNetRequest getURLString:kLiveURL params:nil success:^(id responseObject) {
        NSDictionary *dict = (NSDictionary *) responseObject;
        NSArray *entranceIcons = dict[@"data"][@"entranceIcons"];
        NSArray *partitions = dict[@"data"][@"partitions"];
        for (NSDictionary *dict in entranceIcons) {
            SWClassifyLiveModel *clssify = [SWClassifyLiveModel mj_objectWithKeyValues:dict];
            [classfyData addObject:clssify];
        }
        for (NSDictionary *dict in partitions) {
            SWPartitionsModel *partitions = [SWPartitionsModel mj_objectWithKeyValues:dict];
            [liveData addObject:partitions];
        }
        if (classfyData.count&&liveData.count) {
            if (success) {
                success(liveData,classfyData);
            }
        }
        
    } progress:^(NSProgress *downloadProgress) {
        if (progress) {
            progress(downloadProgress);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];

}
+ (void)addPlayerNotification
{
    [kNotificationCenter addObserver:self
    selector:@selector(loadStateDidChange:)
    name:IJKMPMoviePlayerLoadStateDidChangeNotification
    object:nil];
    [kNotificationCenter addObserver:self
    selector:@selector(moviePlayBackFinish:)
    name:IJKMPMoviePlayerPlaybackDidFinishNotification
    object:nil];
    
    [kNotificationCenter addObserver:self
    selector:@selector(mediaIsPreparedToPlayDidChange:)
    name:IJKMPMediaPlaybackIsPreparedToPlayDidChangeNotification
    object:nil];
    
    [kNotificationCenter addObserver:self
    selector:@selector(moviePlayBackStateDidChange:)
    name:IJKMPMoviePlayerPlaybackStateDidChangeNotification
    object:nil];
}
- (void)loadStateDidChange:(NSNotification *)notification{
    if (_videoLoadStateDidChangeBlock) {
        
        _videoLoadStateDidChangeBlock(notification);
    }
}
- (void)moviePlayBackFinish:(NSNotification *)notification{
    if (_videoPlaybackDidFinishBlock) {
        _videoPlaybackDidFinishBlock(notification);
    }
}
- (void)mediaIsPreparedToPlayDidChange:(NSNotification *)notification{
    if (_videoBackIsPreparedToPlayDidChangeBlock) {
        _videoBackIsPreparedToPlayDidChangeBlock(notification);
    }
}
- (void)moviePlayBackStateDidChange:(NSNotification *)notification{
    if (_videoPlaybackStateDidChange) {
        _videoPlaybackStateDidChange(notification);
    }
}
@end
