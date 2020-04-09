//
//  PlayingCardGameViewController.m
//  Matchisma
//
//  Created by 谷琪 on 2020/4/6.
//  Copyright © 2020 谷琪. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCardDeck.h"

@interface PlayingCardGameViewController ()

@end

@implementation PlayingCardGameViewController

- (Deck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
}

@end
