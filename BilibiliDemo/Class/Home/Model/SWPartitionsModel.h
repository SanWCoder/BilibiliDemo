//
//  SWPartitionsModel.h
//  BilibiliDemo
//
//  Created by SanW on 16/8/16.
//  Copyright © 2016年 SanW. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWPartitionsModel : NSObject
/**
 * 直播元素模型
 */
@property (nonatomic,strong)NSArray *lives;
/**
 * 分类Id
 */
@property (nonatomic,assign)int area_id;
/**
 * 分类名
 */
@property (nonatomic,copy)NSString *name;
/**
 * 区域名称
 */
@property (nonatomic,copy)NSString *area;
/**
 * 区域图标 height = 63 width src
 */
@property (nonatomic,copy)NSDictionary *sub_icon;
/**
 * 直播数
 */
@property (nonatomic,assign) int count;
@end
