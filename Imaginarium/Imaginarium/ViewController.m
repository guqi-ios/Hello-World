//
//  ViewController.m
//  Imaginarium
//
//  Created by 谷琪 on 2020/4/7.
//  Copyright © 2020 谷琪. All rights reserved.
//

#import "ViewController.h"
#import "ImageViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[ImageViewController class]]){
        ImageViewController *ivc = (ImageViewController *)segue.destinationViewController;
        ivc.imageURL = [NSURL URLWithString:@"https://i0.hdslb.com/bfs/article/d1f0c4613eca28e934185bdd5a36cbce24606bbc.jpg"];
        ivc.title = segue.identifier;
    }
}

@end
