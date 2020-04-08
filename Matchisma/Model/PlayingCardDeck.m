//
//  PlayingCardDeck.m
//  Matchisma
//
//  Created by 谷琪 on 2020/4/3.
//  Copyright © 2020 谷琪. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

- (instancetype)init
{
    self = [super init];
    if (self){
        for (NSString *suit in [PlayingCard validSuits]){
            for (NSInteger rank = 1; rank <= [PlayingCard maxRank]; rank++){
                PlayingCard *card = [[PlayingCard alloc] init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card]; 
            }
        }
        
    }
    return self;
}

@end
