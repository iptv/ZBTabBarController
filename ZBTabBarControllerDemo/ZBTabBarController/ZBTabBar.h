//
//  ZBTabBar.h
//
//  Created by zimbean on 13-9-4.
//  Copyright (c) 2013年 zimbean. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZBTabBarDelegate;

@interface ZBTabBar : UIView{
  
}

@property (nonatomic, unsafe_unretained)id<ZBTabBarDelegate>delegate;

@property (nonatomic, strong)NSMutableArray *buttons;

@property (nonatomic, strong)UIImageView *backgroundImageview;

- (id)initWithFrame:(CGRect)frame buttonImages:(NSArray *)imgNames;

@end


@protocol ZBTabBarDelegate<NSObject>

@optional

- (void)tabBar:(ZBTabBar *)tabBar didSelectIndex:(NSInteger)index;

@end