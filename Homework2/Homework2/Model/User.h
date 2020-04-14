//
//  User.h
//  Homework2
//
//  Created by 谷琪 on 2020/4/13.
//  Copyright © 2020 谷琪. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTLModel.h"
#import "MTLJSONAdapter.h"

NS_ASSUME_NONNULL_BEGIN

@interface User : MTLModel<MTLJSONSerializing>
@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSURL *proflieImageURL;
@end

NS_ASSUME_NONNULL_END
