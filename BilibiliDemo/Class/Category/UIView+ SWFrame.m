//
//  UIView+SWFrame.m
//  BilibiliDemo
//
//  Created by SanW on 16/8/11.
//  Copyright © 2016年 SanW. All rights reserved.
//

#import "UIView+SWFrame.h"

@implementation UIView (SWFrame)
/**
 *  重新给X坐标赋值
 *
 *  @param x <#x description#>
 */
- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}
/**
 *  重新返回X的值
 *
 *  @return <#return value description#>
 */
- (CGFloat)x
{
    return self.frame.origin.x;
}
/**
 *  重新给Y坐标赋值
 *
 *  @param y y description
 */
- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
/**
 *  重新返回y的值
 */
- (CGFloat)y
{
    return self.frame.origin.y;
}
/**
 *  重新给宽赋值
 *
 *  @param width <#width description#>
 */
- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
/**
 *  重新返回宽度
 *
 *  @return <#return value description#>
 */
- (CGFloat)width
{
    return self.frame.size.width;
}
/**
 *  重新给高赋值
 *
 *  @param height <#height description#>
 */
- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
/**
 *  重新返回高度
 *
 *  @return <#return value description#>
 */
- (CGFloat)height
{
    return self.frame.size.height;
}
/**
 *  重新给x中心点赋值
 *
 *  @param centerX <#centerX description#>
 */
- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
    
}
/**
 *  重新返回x中心点
 *
 *  @return <#return value description#>
 */
- (CGFloat)centerX
{
    return self.center.x;
}
/**
 *  重新给y中心点赋值
 *
 *  @param centerY <#centerY description#>
 */
- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
    
}
/**
 *  重新返回y中心点
 *
 *  @return <#return value description#>
 */
- (CGFloat)centerY
{
    return self.center.y;
}
@end
