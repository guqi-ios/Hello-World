//
//  Case2TableViewCell.h
//  ExerciseDemo
//
//  Created by 谷琪 on 2020/4/16.
//  Copyright © 2020 谷琪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Case2Model.h"

static NSString * _Nonnull const Case2CellID = @"Case2Cell";

NS_ASSUME_NONNULL_BEGIN

@interface Case2TableViewCell : UITableViewCell

@property (nonatomic, strong) Case2Model *model;
@property (nonatomic, strong) UIImageView *modelImageView;
@property (nonatomic, strong) UILabel *titleLabel;

@end

NS_ASSUME_NONNULL_END
