//
//  SWNavigationController.m
//  BilibiliDemo
//
//  Created by SanW on 16/8/12.
//  Copyright © 2016年 SanW. All rights reserved.
//

#import "SWNavigationController.h"

@interface SWNavigationController ()

@end

@implementation SWNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}
+ (void)initialize
{
    // 设置主题颜色
    UINavigationBar *navBar = [UINavigationBar appearance];
    [navBar setBarTintColor:[UIColor colorWithRed:0.969 green:0.341 blue:0.529 alpha:1.000]];
    navBar.shadowImage = [[UIImage alloc]init];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}

@end
