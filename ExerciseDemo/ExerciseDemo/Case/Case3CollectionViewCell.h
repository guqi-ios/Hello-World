//
//  Case3CollectionViewCell.h
//  ExerciseDemo
//
//  Created by 谷琪 on 2020/4/16.
//  Copyright © 2020 谷琪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Case3Model.h"

static NSString * _Nonnull const Case3CollectionCellID = @"Case3CollectionCell";
static const int WIDTH_CELL = 120;
static const int HEIGHT_CELL = 180;

NS_ASSUME_NONNULL_BEGIN

@interface Case3CollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) Case3Model *model;

@end

NS_ASSUME_NONNULL_END
