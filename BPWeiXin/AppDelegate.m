//
//  AppDelegate.m
//  BPWeiXin
//
//  Created by bingcai on 16/5/11.
//  Copyright © 2016年 bingcai. All rights reserved.
//

#import "AppDelegate.h"
#import "SDAppFrameTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [SDAppFrameTabBarController new];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [self setupNavBar];
    return YES;
}

- (void)setupNavBar {
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;

    UINavigationBar *bar = [UINavigationBar appearance];
    bar.barTintColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.9];
    bar.tintColor = [UIColor whiteColor];
    bar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
//    UITabBarController *tabVC = (UITabBarController *)self.window.rootViewController;
//    UINavigationController *nav = tabVC.selectedViewController;
//    UIViewController *childVC = [nav.childViewControllers lastObject];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
