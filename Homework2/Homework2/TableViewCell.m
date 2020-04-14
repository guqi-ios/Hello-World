//
//  TableViewCell.m
//  Homework2
//
//  Created by 谷琪 on 2020/4/13.
//  Copyright © 2020 谷琪. All rights reserved.
//

#import "TableViewCell.h"
#import "Masonry.h"

@implementation TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initView];
    }
    return self;
}

static const int OFFSET = 10;

- (void)initView
{
    [self.contentView addSubview:self.userProfileImageView];
    [self.contentView addSubview:self.userNameLabel];
    [self.contentView addSubview:self.createdAtLabel];
    [self.contentView addSubview:self.microblogTextLabel];
    self.contentView.backgroundColor = [UIColor systemPinkColor];
    
    self.microblogTextLabel.numberOfLines = 0;
    
    [self.userProfileImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.equalTo(@0).with.offset(OFFSET);
        make.left.greaterThanOrEqualTo(@0);
        make.right.and.bottom.lessThanOrEqualTo(@0);
    }];
    [self.userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.userProfileImageView.mas_right).with.offset(OFFSET);
        make.top.equalTo(@0).with.offset(OFFSET);
        make.left.greaterThanOrEqualTo(@0);
        make.right.and.bottom.lessThanOrEqualTo(@0);
    }];
    [self.createdAtLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.userProfileImageView.mas_right).with.offset(OFFSET);
        make.top.equalTo(self.userNameLabel.mas_bottom).with.offset(OFFSET);
        make.left.greaterThanOrEqualTo(@0);
        make.right.and.bottom.lessThanOrEqualTo(@0);
    }];
    [self.microblogTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0).with.offset(OFFSET);
        make.top.equalTo(self.createdAtLabel.mas_bottom).with.offset(OFFSET);
        make.right.equalTo(@0).with.offset(-OFFSET);
        make.left.greaterThanOrEqualTo(@0);
        make.right.and.bottom.lessThanOrEqualTo(@0);
    }];
}

- (UIImageView *)userProfileImageView
{
    if (!_userProfileImageView) {
        _userProfileImageView = [[UIImageView alloc] init];
    }
    return _userProfileImageView;
}

- (UILabel *)userNameLabel
{
    if (!_userNameLabel) {
        _userNameLabel = [[UILabel alloc] init];
        _userNameLabel.backgroundColor = [UIColor orangeColor];
    }
    return _userNameLabel;
}

- (UILabel *)createdAtLabel
{
    if (!_createdAtLabel) {
        _createdAtLabel = [[UILabel alloc] init];
        _createdAtLabel.backgroundColor = [UIColor orangeColor];
    }
    return _createdAtLabel;
}

- (UILabel *)microblogTextLabel
{
    if (!_microblogTextLabel){
        _microblogTextLabel = [[UILabel alloc] init];
        _microblogTextLabel.backgroundColor = [UIColor purpleColor];
    }
    return _microblogTextLabel;
}

@end
