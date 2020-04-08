//
//  PlayingCard.h
//  Matchisma
//
//  Created by 谷琪 on 2020/4/3.
//  Copyright © 2020 谷琪. All rights reserved.
//

#import "Card.h"

NS_ASSUME_NONNULL_BEGIN

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSInteger)maxRank;

@end

NS_ASSUME_NONNULL_END
