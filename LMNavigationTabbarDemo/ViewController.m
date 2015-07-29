//
//  ViewController.m
//  LMNavigationTabbarDemo
//
//  Created by zero on 15/7/28.
//  Copyright (c) 2015年 zero. All rights reserved.
//

#import "ViewController.h"

#import "LMNavigationTabbarView.h"
@interface ViewController ()<LMNavigationTabbarViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    LMNavigationTabbarView* bar = [[LMNavigationTabbarView alloc]initWithFrame:CGRectMake(0, 20, CGRectGetWidth(self.view.frame), 44)];
    bar.titleArray = @[@"全部",@"排行榜",@"最新",@"最热",@"更多栏目"];
    [self.view addSubview:bar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
