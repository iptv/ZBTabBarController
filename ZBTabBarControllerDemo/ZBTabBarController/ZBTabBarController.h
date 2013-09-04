//
//  ZBTabBarController.h
//  NZ
//
//  Created by Kevin Zhang on 13-9-4.
//  Copyright (c) 2013年 上海天信网络科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBTabBar.h"

@interface ZBTabBarController : UITabBarController<ZBTabBarDelegate>{
    ZBTabBar *zbTabBar;
}

- (id)initWithViewControllers:(NSArray *)viewCtrls imageNames:(NSArray *)imgNames;

- (void)hidesTabBarWhenPushed;

- (void)showTabBarWhenPoped;

@end
