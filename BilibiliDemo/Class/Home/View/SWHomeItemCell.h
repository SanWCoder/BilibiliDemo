//
//  SWHomeItemCell.h
//  BilibiliDemo
//
//  Created by SanW on 16/8/16.
//  Copyright © 2016年 SanW. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWLivesModel.h"
@interface SWHomeItemCell : UICollectionViewCell
/**
 *  快速创建cell
 *
 *  @param collectionView collectionView
 *  @param indexPath      indexPath
 *
 *  @return cell
 */
+ (instancetype)itemCellWithcollectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
/**
 *  直播模型
 */
@property (nonatomic,strong) SWLivesModel *livesModel;



@end
