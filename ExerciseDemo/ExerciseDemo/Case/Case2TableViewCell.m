//
//  Case2TableViewCell.m
//  ExerciseDemo
//
//  Created by 谷琪 on 2020/4/16.
//  Copyright © 2020 谷琪. All rights reserved.
//

#import "Case2TableViewCell.h"
#import "Masonry.h"

static const int OFFSET = 10;

@implementation Case2TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubviews];
    }
    return self;
}

#pragma mark - Private Method

- (void)initSubviews
{
    [self.contentView addSubview:self.modelImageView];
    [self.contentView addSubview:self.titleLabel];
    self.contentView.backgroundColor = [UIColor systemPinkColor];
    
    [self.modelImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.top.equalTo(@(OFFSET));
        make.left.greaterThanOrEqualTo(@0);
        make.right.and.bottom.lessThanOrEqualTo(@0);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.top.equalTo(self.modelImageView.mas_bottom).with.offset(OFFSET);
        make.left.greaterThanOrEqualTo(@0);
        make.right.and.bottom.lessThanOrEqualTo(@0);
    }];
}

#pragma mark - Getters & Setters

- (UIImageView *)modelImageView
{
    if (!_modelImageView) {
        _modelImageView = [[UIImageView alloc] init];
    }
    return _modelImageView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.backgroundColor = [UIColor orangeColor];
    }
    return _titleLabel;
}

- (void)setModel:(Case2Model *)model
{
    _model = model;
    if (_model) {
        self.modelImageView.image = [UIImage imageNamed:model.imageName];
        self.titleLabel.text = model.title;
    }
}

@end
