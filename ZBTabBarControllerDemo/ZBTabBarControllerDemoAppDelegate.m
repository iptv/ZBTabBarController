//
//  ZBTabBarControllerDemoAppDelegate.m
//  ZBTabBarControllerDemo
//
//  Created by Kevin Zhang on 13-9-4.
//  Copyright (c) 2013年 zimbean. All rights reserved.
//

#import "ZBTabBarControllerDemoAppDelegate.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"

@implementation ZBTabBarControllerDemoAppDelegate

@synthesize zbTabBarCtrl;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    FirstViewController *firstViewCtrl = [[FirstViewController alloc]init];
     SecondViewController *secondViewCtrl = [[SecondViewController alloc]init];
     ThirdViewController *thirdViewCtrl = [[ThirdViewController alloc]init];
    NSArray *viewCtrls = [NSArray arrayWithObjects:firstViewCtrl,secondViewCtrl,thirdViewCtrl,nil];
    
    NSMutableArray *imageNames = [[NSMutableArray alloc]init];
    NSMutableDictionary *dic1 =[[NSMutableDictionary alloc]init];
    [dic1 setObject:[UIImage imageNamed:@"guangchang.png"] forKey:@"Default"];
    [dic1 setObject:[UIImage imageNamed:@"guangchang.png"] forKey:@"Selected"];
    [imageNames addObject:dic1];
    
    NSMutableDictionary *dic2 =[[NSMutableDictionary alloc]init];
    [dic2 setObject:[UIImage imageNamed:@"guangchang.png"] forKey:@"Default"];
    [dic2 setObject:[UIImage imageNamed:@"guangchang.png"] forKey:@"Selected"];
    [imageNames addObject:dic2];
    
    NSMutableDictionary *dic3 =[[NSMutableDictionary alloc]init];
    [dic3 setObject:[UIImage imageNamed:@"guangchang.png"] forKey:@"Default"];
    [dic3 setObject:[UIImage imageNamed:@"guangchang.png"] forKey:@"Selected"];
    [imageNames addObject:dic3];
    
    zbTabBarCtrl = [[ZBTabBarController alloc]initWithViewControllers:viewCtrls
                                                               imageNames:imageNames];
    
    zbTabBarCtrl.hidesBottomBarWhenPushed = YES;
    
    self.window.rootViewController = zbTabBarCtrl;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
