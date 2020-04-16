//
//  Case3CollectionFooterView.m
//  ExerciseDemo
//
//  Created by 谷琪 on 2020/4/16.
//  Copyright © 2020 谷琪. All rights reserved.
//

#import "Case3CollectionFooterView.h"
#import "Masonry.h"

@implementation Case3CollectionFooterView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor systemPinkColor];
        [self initSubviews];
    }
    return self;
}

#pragma mark - Private Methods

- (void)initSubviews
{
    [self addSubview:self.label];
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
}

#pragma mark - Getters & Setters

- (UILabel *)label
{
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.backgroundColor = [UIColor orangeColor];
    }
    return _label;
}

@end
