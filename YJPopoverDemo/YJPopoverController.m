//
//  YJPopoverController.m
//  YJPopoverDemo
//
//  Created by d-engine on 16/12/27.
//  Copyright © 2016年 yangjun. All rights reserved.
//

#import "YJPopoverController.h"
#import "YJPopoverView.h"
#import "YJPopViewManager.h"

#define kPopoverViewTopMagin    5

@interface YJPopoverController ()

@property (nonatomic, strong) UIViewController *contentViewController;
@property (nonatomic, assign) CGSize popoverContentSize;
@property (nonatomic, strong) YJPopoverView *popoverView;

@property (nonatomic, assign) CGRect contentViewRect;

@end

@implementation YJPopoverController

- (instancetype)initWithContentViewController:(UIViewController *)contentViewController popoverContentSize:(CGSize)popoverContentSize
{
    self = [super init];
    if (self) {
        self.contentViewController = contentViewController;
        self.popoverContentSize = popoverContentSize;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:self.popoverView];
    
    self.contentViewController.view.frame = self.contentViewRect;
    [self.view addSubview:self.contentViewController.view];
    [self addChildViewController:self.contentViewController];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    self.contentViewController.view.frame = self.contentViewRect;
}

- (void)presentPopoverFromRect:(CGRect)fromRect inView:(UIView *)inView permitterArrowDirections:(YJPopoverArrowDirection)permitterArrowDirection animated:(BOOL)animated
{
    self.popoverView.arrowDirection = permitterArrowDirection;
    
    CGRect contentRect = [inView convertRect:fromRect toView:kCurrentWindow];
    
    switch (permitterArrowDirection) {
        case YJPopoverArrowDirection_up:
        {
            self.contentViewRect = CGRectMake(0, kPopoverViewArrowHeight, self.popoverContentSize.width, self.popoverContentSize.height);
            
            CGFloat viewLeft;
            CGFloat viewRight;
            if (CGRectGetMidX(contentRect) <= CGRectGetMidX(kCurrentWindow.bounds)) {
                viewLeft = CGRectGetMidX(contentRect) - self.popoverContentSize.width / 2;
                if (viewLeft < 0) {
                    viewLeft = 5;
                }
                self.popoverView.arrowX = CGRectGetMidX(contentRect) - viewLeft;
                self.view.frame = CGRectMake(viewLeft, CGRectGetMaxY(contentRect) + kPopoverViewTopMagin, self.popoverContentSize.width, self.popoverContentSize.height);
            }
            else {
                viewRight = CGRectGetMidX(contentRect) + self.popoverContentSize.width / 2;
                if (viewRight > kScreenWidth) {
                    viewRight = kScreenWidth - 5;
                    
                }
                self.popoverView.arrowX = CGRectGetWidth(self.popoverView.bounds) - (viewRight - CGRectGetMidX(contentRect));
                self.view.frame = CGRectMake(viewRight - self.popoverContentSize.width, CGRectGetMaxY(contentRect) + kPopoverViewTopMagin, self.popoverContentSize.width, self.popoverContentSize.height);
            }
        }
            break;
        case YJPopoverArrowDirection_left:
        {
            self.contentViewRect = CGRectMake(0, 0, self.popoverContentSize.width - kPopoverViewArrowHeight, self.popoverContentSize.height);
            
            CGFloat viewTop;
            CGFloat viewBottom;
            if (CGRectGetMidY(contentRect) <= CGRectGetMidY(kCurrentWindow.bounds)) {
                viewTop = CGRectGetMidY(contentRect) - self.popoverContentSize.height/ 2;
                if (viewTop < 0) {
                    viewTop = 5;
                }
                self.popoverView.arrowX = CGRectGetMidY(contentRect) - viewTop;
                self.view.frame = CGRectMake(CGRectGetMinX(contentRect) - kPopoverViewTopMagin - self.popoverContentSize.width, viewTop, self.popoverContentSize.width, self.popoverContentSize.height);
            }
            else {
                viewBottom = CGRectGetMidY(contentRect) + self.popoverContentSize.height / 2;
                if (viewBottom > kScreenHeight) {
                    viewBottom = kScreenHeight - 5;
                }
                self.popoverView.arrowX = CGRectGetHeight(self.popoverView.bounds) - (viewBottom - CGRectGetMidY(contentRect));
                self.view.frame = CGRectMake(CGRectGetMinX(contentRect) - kPopoverViewTopMagin - self.popoverContentSize.width, viewBottom - self.popoverContentSize.height, self.popoverContentSize.width, self.popoverContentSize.height);
            }
        }
            break;
        case YJPopoverArrowDirection_down:
        {
            self.contentViewRect = CGRectMake(0, 0, self.popoverContentSize.width, self.popoverContentSize.height - kPopoverViewArrowHeight);
            
            CGFloat viewLeft, viewRight;
            if (CGRectGetMidX(contentRect) <= CGRectGetMidX(kCurrentWindow.bounds)) {
                viewLeft = CGRectGetMidX(contentRect) - self.popoverContentSize.width / 2;
                if (viewLeft < 0) {
                    viewLeft = 5;
                }
                self.popoverView.arrowX = CGRectGetMidX(contentRect) - viewLeft;
                self.view.frame = CGRectMake(viewLeft, CGRectGetMinY(contentRect) - kPopoverViewTopMagin - self.popoverContentSize.height, self.popoverContentSize.width, self.popoverContentSize.height);
            }
            else {
                viewRight = CGRectGetMidX(contentRect) + self.popoverContentSize.width / 2;
                if (viewRight > kScreenWidth) {
                    viewRight = kScreenWidth - 5;
                }
                self.popoverView.arrowX = CGRectGetWidth(self.popoverView.bounds) - (viewRight - CGRectGetMidX(contentRect));
                self.view.frame = CGRectMake(viewRight - self.popoverContentSize.width, CGRectGetMinY(contentRect) - kPopoverViewTopMagin - self.popoverContentSize.height, self.popoverContentSize.width, self.popoverContentSize.height);
            }
        }
            break;
        case YJPopoverArrowDirection_right:
        {
            self.contentViewRect = CGRectMake(kPopoverViewArrowHeight, 0, self.popoverContentSize.width - kPopoverViewArrowHeight, self.popoverContentSize.height);
            
            CGFloat viewTop, viewBottom;
            if (CGRectGetMidY(contentRect) <= CGRectGetMidY(kCurrentWindow.bounds)) {
                viewTop = CGRectGetMidY(contentRect) - self.popoverContentSize.height / 2;
                if (viewTop < 0) {
                    viewTop = 5;
                }
                self.popoverView.arrowX = CGRectGetMidY(contentRect) - viewTop;
                self.view.frame = CGRectMake(CGRectGetMaxX(contentRect) + kPopoverViewTopMagin, viewTop, self.popoverContentSize.width, self.popoverContentSize.height);
            }
            else {
                viewBottom = CGRectGetMidY(contentRect) + self.popoverContentSize.height / 2;
                if (viewBottom > kScreenHeight) {
                    viewBottom = kScreenHeight - 5;
                }
                self.popoverView.arrowX = CGRectGetHeight(self.popoverView.bounds) - (viewBottom - CGRectGetMidY(contentRect));
                self.view.frame = CGRectMake(CGRectGetMaxX(contentRect) + kPopoverViewTopMagin, viewBottom - self.popoverContentSize.height, self.popoverContentSize.width, self.popoverContentSize.height);
            }
        }
            break;
        default:
            break;
    }

    [kYJPopViewManager showPopView:self.view disMissBlock:^{
        [self.contentViewController.view removeFromSuperview];
        [self.contentViewController removeFromParentViewController];
    }];
}

- (void)presentPopoverFromBarButtonItem:(UIBarButtonItem *)item permittedArrowDirections:(YJPopoverArrowDirection)arrowDirections animated:(BOOL)animated
{

}

#pragma mark -- setter
- (YJPopoverView *)popoverView
{
    if (_popoverView == nil) {
        _popoverView = [[YJPopoverView alloc] initWithFrame:CGRectMake(0, 0, self.popoverContentSize.width, self.popoverContentSize.height)];
    }
    return _popoverView;
}

@end
