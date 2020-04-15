//
//  Case1ViewController.m
//  ExerciseDemo
//
//  Created by 谷琪 on 2020/4/15.
//  Copyright © 2020 谷琪. All rights reserved.
//

#import "Case1ViewController.h"
#import "Masonry.h"
#import "SDWebImage.h"

@interface Case1ViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation Case1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initSubviews];
}

#pragma mark - Private Methods

- (void) initSubviews
{
//    [self.view addSubview:self.scrollView];
//    [self.scrollView addSubview:self.containerView];
//    [self.containerView addSubview:self.imageView];
//
//    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view).with.insets
//        (UIEdgeInsetsMake(64,0,self.view.bounds.size.height/3*2-50,0));
//    }];
//    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.scrollView);
//        make.width.height.equalTo(self.scrollView);
//    }];
//    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.top.right.equalTo(self.containerView);
//        make.height.equalTo(@60);
//    }];

    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.imageView];

    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.equalTo(@0);
    }];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.bottom.equalTo(self.scrollView);
        make.width.height.equalTo(self.scrollView);
    }];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

#pragma mark - Getters & Setters

- (UIView *)containerView
{
    if (!_containerView) {
        _containerView = [[UIView alloc] init];
        _containerView.backgroundColor = [UIColor redColor];
    }
    return _containerView;
}

- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        [_imageView sd_setImageWithURL:[NSURL URLWithString:@"https://i0.hdslb.com/bfs/article/d1f0c4613eca28e934185bdd5a36cbce24606bbc.jpg"]];
        _imageView.backgroundColor = [UIColor grayColor];
    }
    return _imageView;
}

- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.backgroundColor = [UIColor blueColor];
        _scrollView.minimumZoomScale = 0.2;
        _scrollView.maximumZoomScale = 3.0;
        _scrollView.delegate = self;
        self.scrollView.contentSize = self.imageView.image ? self.self.imageView.image.size : CGSizeZero;
    }
    return _scrollView;
}

@end
