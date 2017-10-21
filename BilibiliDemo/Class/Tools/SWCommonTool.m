//
//  SWCommonTool.m
//  BilibiliDemo
//
//  Created by SanW on 16/8/18.
//  Copyright © 2016年 SanW. All rights reserved.
//

#import "SWCommonTool.h"

@implementation SWCommonTool
/**
 * 通过传进来label的字符串，返回一个size
 */
+ (CGSize)sizeOfLabelWithMaxWidth:(CGFloat)maxWith systemFontSize:(CGFloat)fontSize andFillefTextString:(NSString *)title
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, maxWith, 0)];
    label.font = [UIFont systemFontOfSize:fontSize];
    label.numberOfLines = 0;
    label.text = title;
    [label sizeToFit];
    CGSize size = label.bounds.size;
    return size;
}
+ (NSInteger)lineOfLabelWithMaxWidth:(CGFloat)maxWith systemFontSize:(CGFloat)fontSize andFillefTextString:(NSString *)title
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, maxWith, 0)];
    label.font = [UIFont systemFontOfSize:fontSize];
    label.numberOfLines = 0;
    label.text = title;
    [label sizeToFit];
    return label.numberOfLines;
}
/**
 *  求高度
 */
+ (CGFloat)getHeightWithContent:(NSString *)content width:(CGFloat)width font:(CGFloat)font{
    
    CGRect rect = [content boundingRectWithSize:CGSizeMake(width, 999)
                                        options:NSStringDrawingUsesLineFragmentOrigin
                                     attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]}
                                        context:nil];
    return rect.size.height;
}
/**
 *  求宽度
 */
+ (CGFloat)getWidthWithContent:(NSString *)content height:(CGFloat)height font:(CGFloat)font{
    
    CGRect rect = [content boundingRectWithSize:CGSizeMake(999, height)
                                        options:NSStringDrawingUsesLineFragmentOrigin
                                     attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]}
                                        context:nil];
    return rect.size.width;
}

@end
