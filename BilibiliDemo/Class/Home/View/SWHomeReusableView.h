//
//  SWHomeReusableView.h
//  BilibiliDemo
//
//  Created by SanW on 16/8/19.
//  Copyright © 2016年 SanW. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWPartitionsModel.h"
@interface SWHomeReusableView : UICollectionReusableView
/**
 *  快速创建headerView
 *
 *  @param collectionView collectionView
 *  @param indexPath      indexPath
 *
 *  @return <#return value description#>
 */
+ (instancetype)headerReView:(UICollectionView *)collectionView supplementaryElementOfKind:(NSString *)kind indexPath:(NSIndexPath *)indexPath;
/**
 *  数据模型
 */
@property (nonatomic,strong) SWPartitionsModel *partitionsModel;
/**
 * 头和尾
 */
@property (nonatomic,copy) NSString *kind;
@end
