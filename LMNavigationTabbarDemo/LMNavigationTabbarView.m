//
//  LMNavigationTabbarView.m
//  LMNavigationTabbarDemo
//
//  Created by zero on 15/7/28.
//  Copyright (c) 2015年 zero. All rights reserved.
//

#import "LMNavigationTabbarView.h"
#define ITEM_WIDTH 80

@interface LMNavigationTabbarView ()
@property (nonatomic,strong) UIScrollView* scrollView;
@property (nonatomic,strong) NSMutableArray* barArray;
@property (nonatomic,assign) NSInteger currentIndex;
@property (nonatomic,strong) UIButton* selectItem;

@end

@implementation LMNavigationTabbarView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        _currentIndex = 0;
        _normalFont = [UIFont systemFontOfSize:13];
        _selectFont = [UIFont systemFontOfSize:16];
    }
    return self;
}


#pragma mark - Actions

- (void)didSelectItem:(UIButton*)sender{
    self.selectItem = sender;
}

- (void)addBars{
    [self.titleArray enumerateObjectsUsingBlock:^(NSString* obj, NSUInteger idx, BOOL *stop) {
        UIButton* item = [UIButton buttonWithType:UIButtonTypeCustom];
        item.frame = CGRectMake(idx*ITEM_WIDTH, 0, ITEM_WIDTH, CGRectGetHeight(self.frame));
        item.tag = idx;
        [item setTitle:obj forState:UIControlStateNormal];
        item.titleLabel.font = _normalFont;
        [item addTarget:self action:@selector(didSelectItem:) forControlEvents:UIControlEventTouchUpInside];
        [item setBackgroundColor:[UIColor clearColor]];
        [self.barArray addObject:item];
        [self.scrollView addSubview:item];
        
    }];
//    [self didSelectItem:self.barArray[_currentIndex]];
    self.selectItem = self.barArray[_currentIndex];
    self.scrollView.contentSize = CGSizeMake(ITEM_WIDTH*self.titleArray.count, CGRectGetHeight(self.scrollView.frame));
}

#pragma mark - Setup

- (void)setSelectItem:(UIButton *)selectItem{
    if(_selectItem != selectItem){
        CGFloat animationTime = 5.3;
        if(_selectItem != nil){
            [UIView animateWithDuration:animationTime animations:^{
                _selectItem.titleLabel.font = _normalFont;
            }];
        }
        [UIView animateWithDuration:animationTime animations:^{
            selectItem.titleLabel.font = _selectFont;
        } completion:^(BOOL finished) {
            _selectItem = selectItem;
            CGFloat centerMidX = CGRectGetMidX(self.frame);
            CGFloat itemMidX = CGRectGetMidX(_selectItem.frame);
            CGFloat width = self.scrollView.contentSize.width;
            if(itemMidX > centerMidX && itemMidX < width-centerMidX){
                [UIView animateWithDuration:0.3 animations:^{
                    [self.scrollView setContentOffset:CGPointMake(itemMidX-centerMidX, 0)];
                } completion:^(BOOL finished) {
                    
                }];
            }else if (self.scrollView.contentOffset.x +centerMidX*2 < CGRectGetMaxX(_selectItem.frame)){
               [UIView animateWithDuration:0.3 animations:^{
                    [self.scrollView setContentOffset:CGPointMake(width-centerMidX*2.0, 0)];
               } completion:^(BOOL finished) {
                   
               }];
            }else if(self.scrollView.contentOffset.x > CGRectGetMinX(_selectItem.frame)){
                [UIView animateWithDuration:0.3 animations:^{
                    [self.scrollView setContentOffset:CGPointMake(0, 0)];
                } completion:^(BOOL finished) {
                    
                }];
            }
        }];
        
    }
}

- (void)setTitleArray:(NSArray *)titleArray{
    if(_titleArray != titleArray){
        _titleArray = titleArray;
        if(self.barArray.count > 0){
            for(UIButton* item in self.barArray){
                [item removeFromSuperview];
            }
            [self.barArray removeAllObjects];
            _currentIndex = 0;
        }
        [self addBars];
    }
}

- (NSMutableArray*)barArray{
    if(_barArray == nil){
        _barArray = [NSMutableArray array];
    }
    return _barArray;
}

- (UIScrollView*)scrollView{
    if(_scrollView == nil){
        _scrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        [self addSubview:_scrollView];
    }
    return _scrollView;
}

@end



