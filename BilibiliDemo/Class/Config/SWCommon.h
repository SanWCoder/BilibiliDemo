//
//  SWCommon.h
//  BilibiliDemo
//
//  Created by SanW on 16/8/11.
//  Copyright © 2016年 SanW. All rights reserved.
//

#ifndef SWCommon_h
#define SWCommon_h
// 自定义NSLog
#ifdef DEBUG
#define WELog(fmt, ...) NSLog((@"%s [在第 %d 行] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define WELog(...)
#endif
// 屏幕的宽
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
// 屏幕的高
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

// 颜色值的宏
#define kRGB(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1.0]
// 主题颜色
#define kTintColor [UIColor colorWithRed:0.969 green:0.341 blue:0.529 alpha:1.000]
// 布局间隔
#define kMargin 10
// 常用字体大小
#define kFont(size) [UIFont systemFontOfSize:size]
// 弱指针
#define kWeakSelf(weakSelf) __weak __typeof(&*self)weakSelf = self;
// 通知
#define kNotificationCenter [NSNotificationCenter defaultCenter]
// UserDefaults
#define kUserDefaults [NSUserDefaults standardUserDefaults]
// 主播地址
#define kLiveURL @"http://live.bilibili.com/AppIndex/home?_device=android&_hwid=51e96f5f2f54d5f9&_ulv=10000&access_key=563d6046f06289cbdcb472601ce5a761&appkey=c1b107428d337928&build=410000&platform=android&scale=xxhdpi&sign=fbdcfe141853f7e2c84c4d401f6a8758"
#endif /* SWCommon_h */
