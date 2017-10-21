//
//  SWTabbarController.m
//  BilibiliDemo
//
//  Created by SanW on 16/8/12.
//  Copyright © 2016年 SanW. All rights reserved.
//
#define kTitle @"title"
#define kController @"controller"
#define kSelImage @"selImage"
#define kImage @"image"

#import "SWTabbarController.h"
#import "Header.h"
#import "SWNavigationController.h"
@interface SWTabbarController ()

@end

@implementation SWTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSArray *childArray = @[
                            @{
                                kTitle:@"首页",
                                kController:@"SWHomeController",
                                kSelImage:@"home_home_tab_s",
                                kImage:@"home_home_tab"
                                },
                            @{
                                kTitle:@"分区",
                                kController:@"WESubRegionController",
                                kSelImage:@"home_category_tab_s",
                                kImage:@"home_category_tab"
                                },
                            @{
                                kTitle:@"关注",
                                kController:@"WEAttentionController",
                                kSelImage:@"hd_home_attention_tab_s",
                                kImage:@"hd_home_attention_tab"
                                },
                            @{
                                kTitle:@"发现",
                                kController:@"WEFoundController",
                                kSelImage:@"home_discovery_tab_s",
                                kImage:@"home_discovery_tab"
                                },
                            @{
                                kTitle:@"我的",
                                kController:@"WEMineController",
                                kSelImage:@"home_mine_tab_s",
                                kImage:@"home_mine_tab"
                                },
                            ];
    [childArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        {
            UIViewController *controller = [NSClassFromString(obj[kController]) new];
//            controller.title = obj[kTitle];
            SWNavigationController *nav = [[SWNavigationController alloc]initWithRootViewController:controller];
//            nav.title = obj[kTitle];
            UITabBarItem *item = nav.tabBarItem;
            // 调整图片的位置
            [item setImageInsets:UIEdgeInsetsMake(5, 0, -5, 0)];
            // UIImageRenderingModeAlwaysOriginal 设置显示图片原始颜色
            item.selectedImage = [[UIImage imageNamed:obj[kSelImage]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            item.image = [[UIImage imageNamed:obj[kImage]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            
            [self addChildViewController:nav];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
