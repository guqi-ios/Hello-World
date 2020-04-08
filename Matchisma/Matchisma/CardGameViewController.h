//
//  ViewController.h
//  Matchisma
//
//  Created by 谷琪 on 2020/4/3.
//  Copyright © 2020 谷琪. All rights reserved.
//
// Abstract class.

#import <UIKit/UIKit.h>
#import "Deck.h"

@interface CardGameViewController : UIViewController

// protected
// for subclasses
- (Deck *)createDeck; // abstract

@end

