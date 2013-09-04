//
//  ZBTabBarController.m
//  NZ
//
//  Created by Kevin Zhang on 13-9-4.
//  Copyright (c) 2013年 上海天信网络科技有限公司. All rights reserved.
//

#import "ZBTabBarController.h"

@interface ZBTabBarController ()

@end

#define SCREEN_HEIGHT   [UIScreen mainScreen].applicationFrame.size.height
@implementation ZBTabBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithViewControllers:(NSArray *)viewCtrls imageNames:(NSArray *)imgNames{

    self = [super init];
   
    if (self) {
        self.viewControllers = viewCtrls;
        self.tabBar.hidden = YES;
        
        CGRect tabBarFrame = CGRectMake(0, self.view.bounds.size.height-49.0, 320, 49);
        zbTabBar = [[ZBTabBar alloc]initWithFrame:tabBarFrame
                                    buttonImages:imgNames];
        zbTabBar.delegate = self;
        [self.view addSubview:zbTabBar];
        
        for (UIView *view in self.view.subviews) {
            if ([view isKindOfClass:[ZBTabBar class]]) {
                NSLog(@"is subclass... %f, %f,",view.frame.origin.x, view.frame.origin.y);
            }
        }
        
         self.selectedIndex = 1;
    }
    
    return self;
}

- (void)hidesTabBarWhenPushed{
    [UIView beginAnimations:@"" context:nil];
    [UIView setAnimationDuration:0.4];
    zbTabBar.frame = CGRectMake(0, self.view.bounds.size.height, 320, 49);
    [UIView commitAnimations];
}

- (void)showTabBarWhenPoped{
    [UIView beginAnimations:@"" context:nil];
    [UIView setAnimationDuration:0.4];
    zbTabBar.frame = CGRectMake(0, self.view.bounds.size.height - 49, 320, 49);
    [UIView commitAnimations];
}

- (void)viewDidLoad{
    [super viewDidLoad];
}

#pragma mark ZBTabBarDelegate
- (void)tabBar:(ZBTabBar *)tabBar didSelectIndex:(NSInteger)index{
    if (self.selectedIndex == index) {
        return;
    }
    
    self.selectedIndex = index;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
