//
//  TableViewCell.h
//  Homework2
//
//  Created by 谷琪 on 2020/4/13.
//  Copyright © 2020 谷琪. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableViewCell : UITableViewCell
@property (strong, nonatomic) UILabel *userNameLabel;
@property (strong, nonatomic) UILabel *createdAtLabel;
@property (strong, nonatomic) UILabel *microblogTextLabel;
@property (strong, nonatomic) UIImageView *userProfileImageView;
@end

NS_ASSUME_NONNULL_END
