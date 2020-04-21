//
//  Case0ViewController.m
//  CoreAnimationDemo
//
//  Created by 谷琪 on 2020/4/21.
//  Copyright © 2020 谷琪. All rights reserved.
//

#import "Case0ViewController.h"
#import "Masonry.h"

@interface Case0ViewController () <CALayerDelegate>

@property (nonatomic, strong) UIView *leftView;
@property (nonatomic, strong) UIView *rightView;
@property (nonatomic, strong) UIView *layerView;

@end

@implementation Case0ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupUserInterface];
}

#pragma mark - Private Methods

- (void)setupUserInterface
{
    self.leftView.backgroundColor = [UIColor grayColor];
    self.rightView.backgroundColor = [UIColor systemPinkColor];
    self.layerView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.leftView];
    [self.view addSubview:self.rightView];
    [self.view addSubview:self.layerView];
    [self.leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.and.bottom.equalTo(@0);
        make.width.lessThanOrEqualTo(@150);
        make.left.and.top.greaterThanOrEqualTo(@0);
        make.right.and.bottom.lessThanOrEqualTo(@0);
    }];
    [self.rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.leftView.mas_right);
        make.width.lessThanOrEqualTo(@150);
        make.left.and.top.greaterThanOrEqualTo(@0);
        make.right.and.bottom.lessThanOrEqualTo(@0);
    }];
    [self.layerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.rightView.mas_right);
        make.left.and.top.greaterThanOrEqualTo(@0);
        make.right.and.bottom.lessThanOrEqualTo(@0);
    }];
    
    // Using an Image for the Layer’s Content
    UIImage *image = [UIImage imageNamed:@"Q"];
    [self addImage:image withContentRect:CGRectMake(0, 0, 0.5, 0.5) ￼toLayer:self.leftView.layer];
    [self addImage:image withContentRect:CGRectMake(0.5, 0, 0.5, 0.5) ￼toLayer:self.rightView.layer];
    
    // Using a Delegate to Provide the Layer’s Content
    CALayer *blueLayer = [CALayer layer];
    blueLayer.delegate = self;
    blueLayer.contentsGravity = kCAGravityResize;
    blueLayer.frame = CGRectMake(0.0f, 100.0f, 100.0f, 100.0f);
    
    // Adjusting a Layer’s Visual Style
    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    blueLayer. borderWidth = 10;
    blueLayer.borderColor = [UIColor grayColor].CGColor;
    blueLayer.cornerRadius = 20;
    blueLayer.shadowOpacity = 1;
    
    [self.layerView.layer addSublayer:blueLayer];
    [blueLayer display];
}

- (void)addImage:(UIImage *)image withContentRect:(CGRect)rect ￼toLayer:(CALayer *)layer
{
  layer.contents = (__bridge id)image.CGImage;
  layer.contentsGravity = kCAGravityResizeAspect;
  layer.contentsRect = rect;
}

#pragma mark - CALayer Delegate

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    //draw a thick red circle
    CGContextSetLineWidth(ctx, 10.0f);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextStrokeEllipseInRect(ctx, layer.bounds);
}

#pragma mark - Getters & Setters

- (UIView *)leftView
{
    if (!_leftView) {
        _leftView = [[UIView alloc] init];
    }
    return _leftView;
}

- (UIView *)rightView
{
    if (!_rightView) {
        _rightView = [[UIView alloc] init];
    }
    return _rightView;
}

- (UIView *)layerView
{
    if (!_layerView) {
        _layerView = [[UIView alloc] init];
    }
    return _layerView;
}

@end
