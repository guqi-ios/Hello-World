//
//  CardMatchingGame.h
//  Matchisma
//
//  Created by 谷琪 on 2020/4/3.
//  Copyright © 2020 谷琪. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

NS_ASSUME_NONNULL_BEGIN

@interface CardMatchingGame : NSObject

// designated initializer
- (instancetype)initWithCardCount:(NSInteger)count usingDeck:(Deck *)deck;

-(void)chooseCardAtIndex:(NSUInteger)index;
-(Card *)cardAtIndex:(NSInteger)index;

@property (nonatomic,readonly) NSInteger score;

@end

NS_ASSUME_NONNULL_END
