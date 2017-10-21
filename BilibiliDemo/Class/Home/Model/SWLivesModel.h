//
//  SWLivesModel.h
//  BilibiliDemo
//
//  Created by SanW on 16/8/16.
//  Copyright © 2016年 SanW. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWLivesModel : NSObject
/**
 * 标题
 */
@property (nonatomic,copy)NSString *accept_quality;
/**
 * 区域标题
 */
@property (nonatomic,copy)NSString *area;
/**
 * 区域ID
 */
@property (nonatomic,assign)int area_id;
/**
 *
 */
@property (nonatomic,assign)int broadcast_type;
/**
 * 检查版本
 */
@property (nonatomic,assign)int check_version;
/**
 * 图标信息 height src width
 */
@property (nonatomic,strong)NSDictionary *cover;
/**
 *  是否正在直播
 */
@property (nonatomic,assign)int is_tv;
/**
 *  在线人数
 */
@property (nonatomic,assign)int online;
/**
 * 用户信息 face（头像） mid（直播ID) name(用户名）
 */
@property (nonatomic,strong)NSDictionary *owner;
/**
 * 直播背景图
 */
@property (nonatomic,copy)NSString *playurl;
/**
 * 房间号
 */
@property (nonatomic,copy)NSString *room_id;
/**
 * 标题
 */
@property (nonatomic,copy)NSString *title;

@end
