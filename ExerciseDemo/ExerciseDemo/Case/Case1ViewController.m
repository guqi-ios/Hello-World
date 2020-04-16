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

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation Case1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Case 1: UIScrollView";
    [self setupUserInterface];
}

#pragma mark - Private Methods

- (void) setupUserInterface
{
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.imageView];

    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
    }];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

#pragma mark - Getters & Setters

- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
//        [_imageView sd_setImageWithURL:[NSURL URLWithString:@"https://i0.hdslb.com/bfs/article/d1f0c4613eca28e934185bdd5a36cbce24606bbc.jpg"]];
        _imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://i0.hdslb.com/bfs/article/d1f0c4613eca28e934185bdd5a36cbce24606bbc.jpg"]]];
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
        _scrollView.contentSize = self.imageView.image ? self.imageView.image.size : CGSizeZero;
    }
    return _scrollView;
}

@end
