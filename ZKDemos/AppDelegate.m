//
//  AppDelegate.m
//  ZKDemos
//
//  Created by zk on 2020/4/19.
//  Copyright © 2020 zk. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseNavigationController.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[BaseNavigationController alloc] initWithRootViewController:[[ViewController alloc] init]];
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
