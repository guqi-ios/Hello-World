//
//  DropitBehavior.h
//  Dropit
//
//  Created by 谷琪 on 2020/4/7.
//  Copyright © 2020 谷琪. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DropitBehavior : UIDynamicBehavior

- (void)addItem:(id <UIDynamicItem>)item;
- (void)removeItem:(id <UIDynamicItem>)item;

@end

NS_ASSUME_NONNULL_END
