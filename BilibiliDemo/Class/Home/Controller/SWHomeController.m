//
//  SWHomeController.m
//  BilibiliDemo
//
//  Created by SanW on 16/8/15.
//  Copyright © 2016年 SanW. All rights reserved.
//

#import "SWHomeController.h"
#import "Header.h"
#import "SWClassifyLiveModel.h"
#import "SWPartitionsModel.h"
#import "SWHomeViewModel.h"
#import "SWHomeItemCell.h"
#import "SWLivesModel.h"
#import "SWHomeReusableView.h"
#import "SWHomeDetailController.h"
@interface SWHomeController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

/**
 *  滚动视图
 */
@property (nonatomic,weak)UIScrollView *scrollerView;
/**
 *  collection图
 */
@property (nonatomic,weak)UICollectionView *collectionView;
/**
 *  分类数据
 */
@property (nonatomic,strong)NSMutableArray *classfyData;
/**
 *  直播
 */
@property (nonatomic,strong)NSMutableArray *liveData;
@end

@implementation SWHomeController
/**
 *  懒加载分类数据源
 *
 *  @return <#return value description#>
 */
- (NSMutableArray *)classfyData
{
    if (!_classfyData) {
        _classfyData = [[NSMutableArray alloc]init];
    }
    return _classfyData;
}
/**
 *  懒加载直播数据源
 *
 *  @return <#return value description#>
 */
- (NSMutableArray *)liveData
{
    if (!_liveData) {
        _liveData = [[NSMutableArray alloc]init];
    }
    return _liveData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.title = @"BilibiliDemo";
    // 设置背景色
    self.view.backgroundColor = kTintColor;
    // 创建collectionView
    [self createCollectionView];
    [SWHomeViewModel getHomeData:^(NSMutableArray *liveData, NSMutableArray *classfyData) {
        self.liveData = liveData;
        self.classfyData = classfyData;
        [self.collectionView reloadData];
    } progress:^(NSProgress *downloadProgress) {
        
    } failure:^(NSError *error) {
        
    }];
    
}
/**
 *  创建collectView
 */
- (void)createCollectionView{
    // 创建layout用于布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    // 布局方向
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    // cell 大小
    //    layout.itemSize = CGSizeMake(100, 100);
    
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    self.collectionView = collectionView;
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.backgroundColor = [UIColor colorWithHexString:@"f0f0f0"];
    
    [self.view addSubview:collectionView];
    
    [collectionView registerClass:[SWHomeItemCell class] forCellWithReuseIdentifier:@"SWHomeItemCell"];
    [collectionView registerClass:[SWHomeReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SWHomeReusableView"];
    [collectionView registerClass:[SWHomeReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"SWHomeReusableView"];
    
}

/**
 *  组数
 *
 *  @param collectionView <#collectionView description#>
 *
 *  @return <#return value description#>
 */
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.liveData.count;
}
/**
 *  每组的cell数
 *
 *  @param collectionView <#collectionView description#>
 *  @param section        <#section description#>
 *
 *  @return <#return value description#>
 */
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    SWPartitionsModel *pattitonModel = self.liveData[section];
    return pattitonModel.lives.count;
}
/**
 *  cell
 *
 *  @param collectionView <#collectionView description#>
 *  @param indexPath      <#indexPath description#>
 *
 *  @return <#return value description#>
 */
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SWHomeItemCell *cell = [SWHomeItemCell itemCellWithcollectionView:collectionView cellForItemAtIndexPath:indexPath];
    SWPartitionsModel *pattitonModel = self.liveData[indexPath.section];
    SWLivesModel *liveModel = pattitonModel.lives[indexPath.row];
    cell.livesModel = liveModel;
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(145, 160);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 20);
    
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return  5;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(collectionView.width, 40);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(collectionView.width, 40);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    SWHomeDetailController *deVC = [[SWHomeDetailController alloc]init];
    [self.navigationController pushViewController:deVC animated:YES];
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    SWHomeReusableView *header = [SWHomeReusableView headerReView:collectionView supplementaryElementOfKind:kind indexPath:indexPath];
    header.kind = kind;
    header.partitionsModel = self.liveData[indexPath.section];
    return header;
}
@end
