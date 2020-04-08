//
//  ViewController.m
//  Homework1
//
//  Created by 谷琪 on 2020/4/8.
//  Copyright © 2020 谷琪. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

static const CGFloat HEIGHT = 100;
static const CGFloat WIDTH = 100;

@interface ViewController ()
@property(nonatomic) NSInteger number;
@property(strong, nonatomic) UILabel *label;
@property(strong, nonatomic) UIButton *button;
@property(strong, nonatomic) UIView *containerView;
@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initContainerView];
    [self initViews];
}


#pragma mark - Actions
- (void)buttonTouched
{
    self.number++;
    self.label.text = [NSString stringWithFormat:@"%ld", self.number];
}


#pragma mark - Private methods

- (void)initContainerView
{
    _containerView = [[UIView alloc] init];
    _containerView.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:_containerView];

    [_containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(HEIGHT));
        make.width.equalTo(@(WIDTH));
        make.center.equalTo(self.view);
    }];
}

- (void)initViews
{
    // _label
    
    _label = [[UILabel alloc] init];
    _label.text = @"0";
    _label.backgroundColor = [UIColor redColor];
    [_containerView addSubview:_label];
    
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(HEIGHT/2));
        make.centerX.equalTo(_label.superview.mas_centerX);
        make.top.equalTo(_label.superview.mas_top);
    }];
    
    // _button
    
    _button = [[UIButton alloc] init];
    [_button setTitle:@"+1" forState:UIControlStateNormal];
    _button.backgroundColor = [UIColor purpleColor];
    [_button addTarget:self action:@selector(buttonTouched) forControlEvents:UIControlEventTouchDown];
    [_containerView addSubview:_button];
    
    [_button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(HEIGHT/2));
        make.centerX.equalTo(_button.superview.mas_centerX);
        make.right.equalTo(_button.superview.mas_right);
        make.left.equalTo(_button.superview.mas_left);
        make.bottom.equalTo(_button.superview.mas_bottom);
    }];
    
}

@end
