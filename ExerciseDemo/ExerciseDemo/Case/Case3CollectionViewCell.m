//
//  Case3CollectionViewCell.m
//  ExerciseDemo
//
//  Created by 谷琪 on 2020/4/16.
//  Copyright © 2020 谷琪. All rights reserved.
//

#import "Case3CollectionViewCell.h"
#import "Masonry.h"

@interface Case3CollectionViewCell()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation Case3CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubviews];
    }
    return self;
}

#pragma mark - Private Methods

- (void)initSubviews
{
    [self.contentView addSubview:self.imageView];
    [self.contentView addSubview:self.titleLabel];
    self.contentView.backgroundColor = [UIColor grayColor];
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.centerX.equalTo(@0);
        make.left.and.top.greaterThanOrEqualTo(@0);
        make.right.lessThanOrEqualTo(@0);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageView.mas_bottom);
        make.bottom.equalTo(@0);
        make.centerX.equalTo(@0);
        make.left.and.top.greaterThanOrEqualTo(@0);
        make.right.and.bottom.lessThanOrEqualTo(@0);
    }];
}

#pragma mark - Getters & Setters

- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.backgroundColor = [UIColor orangeColor];
    }
    return _titleLabel;
}

- (void)setModel:(Case3Model *)model
{
    _model = model;
    if (_model) {
        self.imageView.image = [UIImage imageNamed:_model.imageName];
        self.titleLabel.text = _model.title;
    }
}

@end
