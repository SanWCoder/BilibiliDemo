//
//  SWClassifyLiveModel.h
//  BilibiliDemo
//
//  Created by SanW on 16/8/16.
//  Copyright © 2016年 SanW. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWClassifyLiveModel : NSObject
/**
 * 分类Id
 */
@property (nonatomic,assign)int classifyId;
/**
 * 分类名
 */
@property (nonatomic,copy)NSString *name;
/**
 *  分类图标 height = 132 width src
 */
@property (nonatomic,strong)NSDictionary *entrance_icon;

@end
