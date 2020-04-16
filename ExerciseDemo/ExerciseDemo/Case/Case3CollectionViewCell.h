//
//  Case3CollectionViewCell.h
//  ExerciseDemo
//
//  Created by 谷琪 on 2020/4/16.
//  Copyright © 2020 谷琪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Case3CollectionModel.h"

static NSString * _Nonnull const Case3CollectionCellID = @"Case3CollectionCell";
static CGFloat const widthCollectionCell = 40.0;
static CGFloat const heightCollectionCell = 900.0;


NS_ASSUME_NONNULL_BEGIN

@interface Case3CollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) Case3CollectionModel *model;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLabel;

@end

NS_ASSUME_NONNULL_END
