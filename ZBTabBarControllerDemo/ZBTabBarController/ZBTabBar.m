//
//  ZBTabBar.m
//  NZ
//
//  Created by zimbean on 13-9-4.
//  Copyright (c) 2013年 zimbean. All rights reserved.
//

#import "ZBTabBar.h"

@implementation ZBTabBar

@synthesize delegate;

@synthesize buttons;

@synthesize backgroundImageview;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame buttonImages:(NSArray *)imgNames{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        backgroundImageview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 49)];
        backgroundImageview.userInteractionEnabled = YES;
        [self addSubview:backgroundImageview];
        [self sendSubviewToBack:backgroundImageview];
        
        buttons = [[NSMutableArray alloc]init];
        
        UIButton *btn = nil;
        
        CGFloat buttonWidth = 320.0/imgNames.count;
        
        for (int i = 0; i < imgNames.count; i++) {
            btn = [UIButton buttonWithType:UIButtonTypeCustom];
			btn.tag = i;
			btn.frame = CGRectMake(buttonWidth * i, 0, buttonWidth, 49);
			[btn setImage:[[imgNames objectAtIndex:i] objectForKey:@"Default"]
                 forState:UIControlStateNormal];
			[btn setImage:[[imgNames objectAtIndex:i] objectForKey:@"Selected"]
                 forState:UIControlStateSelected];
			[btn addTarget:self
                    action:@selector(tabBarButtonClicked:)
          forControlEvents:UIControlEventTouchUpInside];
			
            [buttons addObject:btn];
            
			[self addSubview:btn];
        }
    }
    
    return self;
}

- (void)tabBarButtonClicked:(id)sender{
	UIButton *btn = sender;
    
	[self selectTabAtIndex:btn.tag];
   
    if ([delegate respondsToSelector:@selector(tabBar:didSelectIndex:)]){
        [delegate tabBar:self didSelectIndex:btn.tag];
    }
}

- (void)selectTabAtIndex:(NSInteger)index{
	for (int i = 0; i < [buttons count]; i++){
		UIButton *btn = [buttons objectAtIndex:i];
		btn.selected = NO;
		btn.userInteractionEnabled = YES;
	}
    
	UIButton *btn = [buttons objectAtIndex:index];
	btn.selected = YES;
	btn.userInteractionEnabled = NO;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
