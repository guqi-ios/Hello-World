//
//  BezierPathView.m
//  Dropit
//
//  Created by 谷琪 on 2020/4/7.
//  Copyright © 2020 谷琪. All rights reserved.
//

#import "BezierPathView.h"

@implementation BezierPathView

- (void)setPath:(UIBezierPath *)path
{
    _path = path;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [self.path stroke];
}

@end
