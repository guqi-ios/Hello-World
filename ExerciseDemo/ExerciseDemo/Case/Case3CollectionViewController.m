//
//  Case3CollectionViewController.m
//  ExerciseDemo
//
//  Created by 谷琪 on 2020/4/16.
//  Copyright © 2020 谷琪. All rights reserved.
//

#import "Case3CollectionViewController.h"
#import "Case3Model.h"
#import "Case3CollectionHeaderView.h"
#import "Case3CollectionViewCell.h"
#import "Case3CollectionFooterView.h"
#import "Masonry.h"

@interface Case3CollectionViewController () <UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSArray<Case3Model *> *models;

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
    [self.collectionView registerClass:[Case3CollectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:Case3CollectionHeaderID];
    [self.collectionView registerClass:[Case3CollectionFooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:Case3CollectionFooterID];
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
    } else {
        return nil;
    }
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(WIDTH_CELL, HEIGHT_CELL);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(0, HEIGHT_HEADER);
}
 
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(0, HEIGHT_FOOTER);
}

#pragma mark - Getters & Setters

- (NSArray<Case3Model *> *)models
{
    if (!_models) {
        NSInteger count = 15;
        NSMutableArray *tmpModels = [[NSMutableArray alloc] initWithCapacity:count];
        for (int i = 0; i < count; i++) {
            Case3Model *model = [[Case3Model alloc] init];
            model.imageName = @"cardback";
            model.title = @"cardback";
            [tmpModels addObject:model];
        }
        _models = [[NSArray alloc] initWithArray:tmpModels];
    }
    return _models;
}

@end
