//
//  MainViewController.m
//  ExerciseDemo
//
//  Created by 谷琪 on 2020/4/15.
//  Copyright © 2020 谷琪. All rights reserved.
//

#import "MainViewController.h"
#import "Masonry.h"
#import "Case1ViewController.h"
#import "Case2ViewController.h"
#import "Case3ViewController.h"

@interface MainViewController ()

@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UIButton *case1Button;
@property (nonatomic, strong) UIButton *case2Button;
@property (nonatomic, strong) UIButton *case3Button;

@end

@implementation MainViewController

static const int OFFSET = 5;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initSubviews];
    
}
#pragma mark - Private methods

- (void) initSubviews
{
    [self.view addSubview:self.containerView];
    [self.containerView addSubview:self.case1Button];
    [self.containerView addSubview:self.case2Button];
    [self.containerView addSubview:self.case3Button];
    
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(@0);
    }];
    [self.case1Button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.left.and.top.greaterThanOrEqualTo(@0);
        make.right.lessThanOrEqualTo(@0);
    }];
    [self.case2Button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.top.equalTo(self.case1Button.mas_bottom).with.offset(OFFSET);
        make.left.greaterThanOrEqualTo(@0);
        make.right.lessThanOrEqualTo(@0);
    }];
    [self.case3Button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.top.equalTo(self.case2Button.mas_bottom).with.offset(OFFSET);
        make.left.greaterThanOrEqualTo(@0);
        make.right.and.bottom.lessThanOrEqualTo(@0);
    }];
}

#pragma mark - Actions

- (void)caseOfUIScrollViewButtonTouched
{
    Case1ViewController *cvc = [[Case1ViewController alloc] init];
    [self.navigationController pushViewController:cvc animated:true];
    
}

- (void)caseOfUITableViewButtonTouched
{
    Case2ViewController *cvc = [[Case2ViewController alloc] init];
    [self.navigationController pushViewController:cvc animated:true];
}

- (void)caseOfUICollectionViewButtonTouched
{
    Case3ViewController *cvc = [[Case3ViewController alloc] init];
    [self.navigationController pushViewController:cvc animated:true];
}

#pragma mark - Getters & Setters

- (UIView *)containerView
{
    if (!_containerView) {
        _containerView = [[UIView alloc] init];
    }
    return _containerView;
}

- (UIButton *)case1Button
{
    if (!_case1Button) {
        _case1Button = [UIButton buttonWithType:UIButtonTypeSystem];
        [_case1Button setTitle:@"Case 1: UIScrollView" forState:UIControlStateNormal];
        [_case1Button addTarget:self action:@selector(caseOfUIScrollViewButtonTouched) forControlEvents:UIControlEventTouchDown];
        
    }
    return _case1Button;
}

- (UIButton *)case2Button
{
    if (!_case2Button) {
        _case2Button = [UIButton buttonWithType:UIButtonTypeSystem];
        [_case2Button setTitle:@"Case 2: UITableView" forState:UIControlStateNormal];
        [_case2Button addTarget:self action:@selector(caseOfUITableViewButtonTouched) forControlEvents:UIControlEventTouchDown];
    }
    return _case2Button;
}

- (UIButton *)case3Button
{
    if (!_case3Button) {
        _case3Button = [UIButton buttonWithType:UIButtonTypeSystem];
        [_case3Button setTitle:@"Case 3: UICollectionView" forState:UIControlStateNormal];
        [_case3Button addTarget:self action:@selector(caseOfUICollectionViewButtonTouched) forControlEvents:UIControlEventTouchDown];
    }
    return _case3Button;
}

@end
