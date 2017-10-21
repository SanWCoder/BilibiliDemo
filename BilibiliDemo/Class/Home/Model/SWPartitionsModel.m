//
//  SWPartitionsModel.m
//  BilibiliDemo
//
//  Created by SanW on 16/8/16.
//  Copyright © 2016年 SanW. All rights reserved.
//

#import "SWPartitionsModel.h"

@implementation SWPartitionsModel

+ (NSDictionary *)objectClassInArray{
    return @{
             @"lives" : @"SWLivesModel",
             };
}
+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{
             @"area":@"partition.area",
             @"count":@"partition.count",
             @"area_id":@"partition.id",
             @"name":@"partition.name",
             @"sub_icon":@"partition.sub_icon",
             };
}
@end
