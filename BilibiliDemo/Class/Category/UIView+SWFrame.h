//
//  UIView+SWFrame.h.h
//  BilibiliDemo
//
//  Created by SanW on 16/8/11.
//  Copyright © 2016年 SanW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SWFrame)
/**
 *  宽
 */
@property (nonatomic,assign)CGFloat width;
/**
 *  高
 */
@property (nonatomic,assign)CGFloat height;
/**
 *  x坐标
 */
@property (nonatomic,assign)CGFloat x;
/**
 *  y坐标
 */
@property (nonatomic,assign)CGFloat y;
/**
 *  中心点的x
 */
@property (nonatomic,assign)CGFloat centerX;
/**
 *  中心点的y
 */
@property (nonatomic,assign)CGFloat centerY;

@end
