//
//  SWHomeHeaderView.h
//  BilibiliDemo
//
//  Created by SanW on 16/8/19.
//  Copyright © 2016年 SanW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SWHomeHeaderView : UIView
/**
 *  复制label
 */
@property (nonatomic,strong) UILabel *messageLabel;
/**
 *  正在加载中的动态图
 */
@property (nonatomic,strong)UIImageView *loadingImge;
/**
 *  返回按钮
 */
@property (nonatomic,strong)UIButton *backBtn;
/**
 *  全屏按钮
 */
@property (nonatomic,strong)UIButton *fillScreenBtn;

@end
