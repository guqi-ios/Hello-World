//
//  Case1ViewController.m
//  CoreAnimationDemo
//
//  Created by 谷琪 on 2020/4/21.
//  Copyright © 2020 谷琪. All rights reserved.
//

#import "Case1ViewController.h"
#import "Masonry.h"

@interface Case1ViewController ()

@property (nonatomic, strong) UIView* targetView;
@property (nonatomic, strong) UIButton* button0;
@property (nonatomic, strong) UIButton* button1;
@property (nonatomic, strong) UIButton* button2;

@end

@implementation Case1ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupUserInterface];
}

#pragma mark - Private methods

- (void)setupUserInterface
{
    self.view.backgroundColor = [UIColor grayColor];
    self.targetView.backgroundColor = [UIColor systemPinkColor];
    [self.view addSubview:self.targetView];
    [self.view addSubview:self.button0];
    [self.view addSubview:self.button1];
    [self.view addSubview:self.button2];
    [self.targetView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@100);
        make.centerX.equalTo(@0);
        make.width.equalTo(@200);
        make.height.equalTo(@300);
    }];
    [self.button0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.targetView.mas_bottom).with.offset(10);
        make.centerX.equalTo(@0);
    }];
    [self.button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.button0.mas_bottom).with.offset(10);
        make.centerX.equalTo(@0);
    }];
    [self.button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.button1.mas_bottom).with.offset(10);
        make.centerX.equalTo(@0);
    }];
    
    self.targetView.layer.contents = (__bridge id)[UIImage imageNamed:@"Q"].CGImage;
    self.targetView.layer.cornerRadius = 20.0;
    self.targetView.layer.masksToBounds = YES;
    self.targetView.layer.borderColor = [UIColor blackColor].CGColor;
    self.targetView.layer.borderWidth = 10.0;
}

#pragma mark - Actions

// Animating Simple Changes to a Layer’s Properties
- (void)button0Touched
{
    CABasicAnimation * fadeAnim = [CABasicAnimation animationWithKeyPath:@"opacity"];
    fadeAnim.fromValue = [NSNumber numberWithFloat:1.0];
    fadeAnim.toValue = [NSNumber numberWithFloat:0.0];
    fadeAnim.duration = 1.0;
    [self.targetView.layer addAnimation:fadeAnim forKey:@"opacity"];
    self.targetView.layer.opacity = 0;
    self.targetView.layer.opacity = 1;
}

// Using a Keyframe Animation to Change Layer Properties
- (void)button1Touched
{
    CGMutablePathRef thePath = CGPathCreateMutable();
    CGPathMoveToPoint(thePath,NULL,0.0,0.0);
    CGPathAddCurveToPoint(thePath,NULL,0.0,250.0,
                          100.0,250.0,
                          100.0,0.0);
    CGPathAddCurveToPoint(thePath,NULL,100.0,500.0,
                          500.0,250.0,
                          500.0,0.0);
     
    CAKeyframeAnimation * theAnimation;
    theAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    theAnimation.path = thePath;
    theAnimation.duration = 5.0;
     
    [self.targetView.layer addAnimation:theAnimation forKey:@"position"];
}

// Animating Multiple Changes Together
- (void)button2Touched
{
    // Animation 1
    CAKeyframeAnimation* widthAnim = [CAKeyframeAnimation animationWithKeyPath:@"borderWidth"];
    NSArray* widthValues = [NSArray arrayWithObjects:@1.0, @10.0, @5.0, @30.0, @0.5, @15.0, @2.0, @50.0, @0.0, nil];
    widthAnim.values = widthValues;
    widthAnim.calculationMode = kCAAnimationPaced;
     
    // Animation 2
    CAKeyframeAnimation* colorAnim = [CAKeyframeAnimation animationWithKeyPath:@"borderColor"];
    NSArray* colorValues = [NSArray arrayWithObjects:(id)[UIColor greenColor].CGColor,
                (id)[UIColor redColor].CGColor, (id)[UIColor blueColor].CGColor,  nil];
    colorAnim.values = colorValues;
    colorAnim.calculationMode = kCAAnimationPaced;
     
    // Animation group
    CAAnimationGroup* group = [CAAnimationGroup animation];
    group.animations = [NSArray arrayWithObjects:colorAnim, widthAnim, nil];
    group.duration = 5.0;
     
    [self.targetView.layer addAnimation:group forKey:@"BorderChanges"];
}


#pragma mark - Getters & Setters

- (UIView *)targetView
{
    if (!_targetView) {
        _targetView = [[UIView alloc] init];
    }
    return _targetView;
}

- (UIView *)button0
{
    if (!_button0) {
        _button0 = [[UIButton alloc] init];
        _button0.backgroundColor = [UIColor blueColor];
        [_button0 setTitle:@"CABasicAnimation" forState:UIControlStateNormal];
        [_button0 addTarget:self action:@selector(button0Touched) forControlEvents:UIControlEventTouchDown];
    }
    return _button0;
}

- (UIView *)button1
{
    if (!_button1) {
        _button1 = [[UIButton alloc] init];
        _button1.backgroundColor = [UIColor blueColor];
        [_button1 setTitle:@"CAKeyframeAnimation" forState:UIControlStateNormal];
        [_button1 addTarget:self action:@selector(button1Touched) forControlEvents:UIControlEventTouchDown];
    }
    return _button1;
}

- (UIView *)button2
{
    if (!_button2) {
        _button2 = [[UIButton alloc] init];
        _button2.backgroundColor = [UIColor blueColor];
        [_button2 setTitle:@"Multiple CAKeyframeAnimation" forState:UIControlStateNormal];
        [_button2 addTarget:self action:@selector(button2Touched) forControlEvents:UIControlEventTouchDown];
    }
    return _button2;
}

@end
