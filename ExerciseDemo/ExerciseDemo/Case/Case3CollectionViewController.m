//
//  Case3CollectionViewController.m
//  ExerciseDemo
//
//  Created by 谷琪 on 2020/4/16.
//  Copyright © 2020 谷琪. All rights reserved.
//

#import "Case3CollectionViewController.h"
#import "Case3CollectionModel.h"
#import "Case3CollectionHeaderView.h"
#import "Case3CollectionViewCell.h"
#import "Case3CollectionFooterView.h"
#import "Masonry.h"

@interface Case3CollectionViewController () <UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSArray<Case3CollectionModel *> *models;

@end

@implementation Case3CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Case 3: UICollectionView";
    [self setupUserInterface];
}

#pragma mark - Private Methods

- (void)setupUserInterface
{
    self.collectionView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
    
    [self.collectionView registerClass:[Case3CollectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:Case3CollectionHeaderID];
    [self.collectionView registerClass:[Case3CollectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:Case3CollectionFooterID];
    [self.collectionView registerClass:[Case3CollectionViewCell class] forCellWithReuseIdentifier:Case3CollectionCellID];
}

#pragma mark - <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.models.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    Case3CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:Case3CollectionCellID forIndexPath:indexPath];
    if (indexPath.row >= self.models.count) {
        return cell;
    }
    cell.model = [self.models objectAtIndex:indexPath.row];;
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqual:UICollectionElementKindSectionHeader]) {
        Case3CollectionHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:Case3CollectionHeaderID forIndexPath:indexPath];
        headerView.label.text = @"Header";
        return headerView;
    } else if ([kind isEqual:UICollectionElementKindSectionFooter]) {
        Case3CollectionFooterView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:Case3CollectionFooterID forIndexPath:indexPath];
        footerView.label.text = @"Footer";
        return footerView;
    }
    return nil;
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(widthCollectionCell, heightCollectionCell);
}

// 定义每个UICollectionViewCell的margin
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0);
}

// 设定页眉的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(100, 10);
}
 
// 设定页脚的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(100, 10);
}

#pragma mark - Getters & Setters

- (NSArray<Case3CollectionModel *> *)models
{
    if (!_models) {
//        NSInteger count = arc4random() % 20 + 1;
        NSInteger count = 3;
        NSMutableArray *tmpModels = [[NSMutableArray alloc] initWithCapacity:count];
        for (int i = 0; i < count; i++) {
            Case3CollectionModel *model = [[Case3CollectionModel alloc] init];
            model.imageName = @"cardback";
            model.title = @"cardback";
            [tmpModels addObject:model];
        }
        _models = [[NSArray alloc] initWithArray:tmpModels];
    }
    return _models;
}

@end
