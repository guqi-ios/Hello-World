//
//  AppDelegate.m
//  Homework2
//
//  Created by 谷琪 on 2020/4/10.
//  Copyright © 2020 谷琪. All rights reserved.
//

#import "AppDelegate.h"
#import "YTKNetworkConfig.h"
#import "TableViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    YTKNetworkConfig *config = [YTKNetworkConfig sharedConfig];
    config.baseUrl = @"https://api.weibo.com";
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window setBackgroundColor:[UIColor whiteColor]];
    TableViewController *tvc = [[TableViewController alloc] init];
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:tvc];
    [self.window setRootViewController:nc];
    [self.window makeKeyAndVisible];

    return YES;
}

@end
