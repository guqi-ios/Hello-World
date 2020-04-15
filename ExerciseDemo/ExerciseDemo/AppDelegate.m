//
//  AppDelegate.m
//  ExerciseDemo
//
//  Created by 谷琪 on 2020/4/14.
//  Copyright © 2020 谷琪. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    MainViewController *mvc = [[MainViewController alloc] init];
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:mvc];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window setBackgroundColor:[UIColor whiteColor]];
    [self.window setRootViewController:nc];
    [self.window makeKeyAndVisible];

    return YES;
}

@end
