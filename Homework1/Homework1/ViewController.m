//
//  ViewController.m
//  Homework1
//
//  Created by 谷琪 on 2020/4/8.
//  Copyright © 2020 谷琪. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()
@property (nonatomic) NSInteger number;
@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) UIButton *button;
@property (strong, nonatomic) UIView *containerView;
@end

@implementation ViewController

- (UILabel *)label
{
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.text = @"0";
        _label.backgroundColor = [UIColor redColor];
    }
    return _label;
}

- (UIButton *)button
{
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeSystem];
        [_button setTitle:@"+1" forState:UIControlStateNormal];
        _button.backgroundColor = [UIColor purpleColor];
        [_button addTarget:self action:@selector(buttonTouched) forControlEvents:UIControlEventTouchDown];
    
    }
    return _button;
}

- (UIView *)containerView
{
    if (!_containerView) {
        _containerView = [[UIView alloc] init];
        _containerView.backgroundColor = [UIColor greenColor];
    }
    return _containerView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupUserInterface];
}


#pragma mark - Actions
- (void)buttonTouched
{
    self.number++;
    self.label.text = [NSString stringWithFormat:@"%ld", self.number];
}


#pragma mark - Private methods

- (void)setupUserInterface
{
    [self.view addSubview:self.containerView];
    [self.containerView addSubview:self.label];
    [self.containerView addSubview:self.button];
    
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(@0);
    }];
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.left.and.top.greaterThanOrEqualTo(@0);
        make.right.lessThanOrEqualTo(@0);
    }];
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.label.mas_bottom).with.offset(10);
        make.centerX.equalTo(@0);
        make.left.greaterThanOrEqualTo(@0);
        make.right.and.bottom.lessThanOrEqualTo(@0);
    }];
}

@end
