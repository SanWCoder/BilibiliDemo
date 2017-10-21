//
//  SWCommonTool.h
//  BilibiliDemo
//
//  Created by SanW on 16/8/18.
//  Copyright © 2016年 SanW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface SWCommonTool : NSObject
/**
 * 通过传进来label的字符串，返回一个size
 */
+ (CGSize)sizeOfLabelWithMaxWidth:(CGFloat)maxWith systemFontSize:(CGFloat)fontSize andFillefTextString:(NSString *)title;
/**
 *  求宽度
 */
+ (CGFloat)getWidthWithContent:(NSString *)content height:(CGFloat)height font:(CGFloat)font;
/**
 *  求高度
 */
+ (CGFloat)getHeightWithContent:(NSString *)content width:(CGFloat)width font:(CGFloat)font;
@end
