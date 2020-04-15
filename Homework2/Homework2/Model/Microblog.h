//
//  Microblog.h
//  Homework2
//
//  Created by 谷琪 on 2020/4/13.
//  Copyright © 2020 谷琪. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTLModel.h"
#import "User.h"

NS_ASSUME_NONNULL_BEGIN

@interface Microblog : MTLModel <MTLJSONSerializing>
@property (nonatomic, strong, readonly) User *user;
@property (nonatomic, copy, readonly) NSString *microblogText;
@property (nonatomic, readonly) NSDate *createdAt;
@end

NS_ASSUME_NONNULL_END
