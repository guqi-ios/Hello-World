//
//  PlayingCardView.h
//  SuperCard
//
//  Created by 谷琪 on 2020/4/6.
//  Copyright © 2020 谷琪. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PlayingCardView : UIView

@property (nonatomic) NSUInteger rank;
@property (strong, nonatomic) NSString *suit;
@property (nonatomic) BOOL faceUp;

- (void)pinch:(UIPinchGestureRecognizer *)gesture;

@end

NS_ASSUME_NONNULL_END
