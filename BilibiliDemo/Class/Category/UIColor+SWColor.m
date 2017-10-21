//
//  UIColor+SWColor.m
//  BilibiliDemo
//
//  Created by SanW on 16/8/18.
//  Copyright © 2016年 SanW. All rights reserved.
//

#import "UIColor+SWColor.h"

@implementation UIColor (SWColor)
// 16进制颜色
+ (UIColor *)colorWithHexString:(NSString *)hexString{
    unsigned int red = 0, green = 0, blue = 0;
    NSRange range = NSMakeRange(0, 2);
    if([hexString hasPrefix:@"#"]){
        range = NSMakeRange(1, 2);
    }
    else if([hexString hasPrefix:@"0x"] || [hexString hasPrefix:@"0X"]){
        range = NSMakeRange(2, 2);
    }
    
    [[NSScanner scannerWithString:[hexString substringWithRange:range]] scanHexInt:&red];
    range.location = range.location + range.length;
    [[NSScanner scannerWithString:[hexString substringWithRange:range]] scanHexInt:&green];
    range.location = range.location + range.length;
    [[NSScanner scannerWithString:[hexString substringWithRange:range]] scanHexInt:&blue];
    
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1.0];
}

@end
