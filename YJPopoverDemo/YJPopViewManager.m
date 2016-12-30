//
//  YJPopViewManager.m
//  YJPopoverDemo
//
//  Created by d-engine on 16/12/28.
//  Copyright © 2016年 yangjun. All rights reserved.
//

#import "YJPopViewManager.h"

@interface YJPopViewManager ()

@property (nonatomic, strong) UIView *maskView;     //背景遮罩
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, copy) YJBasicBlock disMissBlock;

@end

@implementation YJPopViewManager

+ (instancetype)shared
{
    static YJPopViewManager *viewManager;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        viewManager = [[super alloc] init];
    });
    return viewManager;
}

- (UIView *)maskView
{
    if (!_maskView) {
        _maskView = [[UIView alloc] initWithFrame:kYJCurrentWindow.bounds];
        _maskView.backgroundColor = [UIColor blackColor];
        _maskView.alpha = 0;
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(maskTapGesture:)];
        [_maskView addGestureRecognizer:tapGesture];
    }
    return _maskView;
}

- (void)maskTapGesture:(UITapGestureRecognizer *)gest
{
    [self disMissView];
}

//显示弹出框
- (void)showPopView:(UIView *)view disMissBlock:(YJBasicBlock)disMissBlock
{
    self.disMissBlock = disMissBlock;
    
    self.contentView = view;
    
    UIView *superView = kYJCurrentWindow;
    [superView addSubview:self.maskView];
    
    view.alpha = 0;
    [superView addSubview:view];
    
    [UIView animateWithDuration:0.2 animations:^{
        view.alpha = 1;
        self.maskView.alpha = 0.4;
    } completion:^(BOOL finished) {
        
    }];
}

//弹出框消失
- (void)disMissView
{
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.contentView.alpha = 0;
        self.maskView.alpha = 0;
    } completion:^(BOOL finished) {
        [self.contentView removeFromSuperview];
        [self.maskView removeFromSuperview];
        self.contentView = nil;
        self.maskView = nil;
        if (self.disMissBlock) {
            self.disMissBlock();
        }
    }];
}

@end
