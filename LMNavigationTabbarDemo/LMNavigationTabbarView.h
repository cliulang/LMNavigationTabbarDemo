//
//  LMNavigationTabbarView.h
//  LMNavigationTabbarDemo
//
//  Created by zero on 15/7/28.
//  Copyright (c) 2015年 zero. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LMNavigationTabbarView;

@protocol LMNavigationTabbarViewDelegate <NSObject>

- (NSArray*)TitlesForLMNavigationTabbarView:(LMNavigationTabbarView*)bar;


@end


@interface LMNavigationTabbarView : UIView
@property (nonatomic,strong) UIFont* normalFont;
@property (nonatomic,strong) UIFont* selectFont;
//@property (nonatomic,assign) id<LMNavigationTabbarViewDelegate>delegate;
@property (nonatomic,strong) NSArray* titleArray;

@end
