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


#define kPopoverViewMaginToBtn      5           //弹出视图距离btn的距离
#define kPopoverViewMaginToScreen   5           //当弹出视图超出屏幕边缘时，弹出视图距离屏幕边缘的距离


@interface YJPopoverController ()

@property (nonatomic, strong) UIViewController *contentViewController;
@property (nonatomic, assign) CGSize popoverContentSize;    //弹出框size
@property (nonatomic, strong) YJPopoverView *popoverView;   //背景视图，有箭头

@property (nonatomic, assign) CGRect contentViewRect;       //内容视图大少

@end

@implementation YJPopoverController

- (void)dealloc
{
    
    NSLog(@"popoverController dealloc");
}

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
    [self.contentViewController didMoveToParentViewController:self];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    self.contentViewController.view.frame = self.contentViewRect;
}

- (void)presentPopoverFromRect:(CGRect)fromRect inView:(UIView *)inView permitterArrowDirections:(YJPopoverArrowDirection)permitterArrowDirection animated:(BOOL)animated
{
    self.popoverView.arrowDirection = permitterArrowDirection;
    
    CGRect contentRect = [inView convertRect:fromRect toView:kYJCurrentWindow];
    
    switch (permitterArrowDirection) {
        case YJPopoverArrowDirection_up:
        {
            self.contentViewRect = CGRectMake(0, kPopoverViewArrowHeight, self.popoverContentSize.width, self.popoverContentSize.height);
            
            CGFloat viewLeft;
            CGFloat viewRight;
            
            //点击视图位于屏幕左边时， 判断弹出视图是否超出屏幕左边缘，如果超出就将弹出视图整个右移；
            //点击视图位于屏幕右边时， 判断弹出视图是否超出屏幕右边缘，如果超出就将弹出视图整个左移;
            if (CGRectGetMidX(contentRect) <= CGRectGetMidX(kYJCurrentWindow.bounds)) {
                viewLeft = CGRectGetMidX(contentRect) - self.popoverContentSize.width / 2;
                if (viewLeft < 0) {
                    viewLeft = kPopoverViewMaginToScreen;
                }
                self.popoverView.arrowLocation = CGRectGetMidX(contentRect) - viewLeft;
                self.view.frame = CGRectMake(viewLeft, CGRectGetMaxY(contentRect) + kPopoverViewMaginToBtn, self.popoverContentSize.width, self.popoverContentSize.height);
            }
            else {
                viewRight = CGRectGetMidX(contentRect) + self.popoverContentSize.width / 2;
                if (viewRight > kYJScreenWidth) {
                    viewRight = kYJScreenWidth - kPopoverViewMaginToScreen;
                    
                }
                self.popoverView.arrowLocation = CGRectGetWidth(self.popoverView.bounds) - (viewRight - CGRectGetMidX(contentRect));
                self.view.frame = CGRectMake(viewRight - self.popoverContentSize.width, CGRectGetMaxY(contentRect) + kPopoverViewMaginToBtn, self.popoverContentSize.width, self.popoverContentSize.height);
            }
        }
            break;
        case YJPopoverArrowDirection_left:
        {
            self.contentViewRect = CGRectMake(0, 0, self.popoverContentSize.width - kPopoverViewArrowHeight, self.popoverContentSize.height);
            
            CGFloat viewTop;
            CGFloat viewBottom;
            
            //点击视图位于屏幕上方时， 判断弹出视图是否超出屏幕上边缘，如果超出就将弹出视图整个下移；
            //点击视图位于屏幕下方时， 判断弹出视图是否超出屏幕下边缘，如果超出就将弹出视图整个上移;
            if (CGRectGetMidY(contentRect) <= CGRectGetMidY(kYJCurrentWindow.bounds)) {
                viewTop = CGRectGetMidY(contentRect) - self.popoverContentSize.height/ 2;
                if (viewTop < 0) {
                    viewTop = kPopoverViewMaginToScreen;
                }
                self.popoverView.arrowLocation = CGRectGetMidY(contentRect) - viewTop;
                self.view.frame = CGRectMake(CGRectGetMinX(contentRect) - kPopoverViewMaginToBtn - self.popoverContentSize.width, viewTop, self.popoverContentSize.width, self.popoverContentSize.height);
            }
            else {
                viewBottom = CGRectGetMidY(contentRect) + self.popoverContentSize.height / 2;
                if (viewBottom > kYJScreenHeight) {
                    viewBottom = kYJScreenHeight - kPopoverViewMaginToScreen;
                }
                self.popoverView.arrowLocation = CGRectGetHeight(self.popoverView.bounds) - (viewBottom - CGRectGetMidY(contentRect));
                self.view.frame = CGRectMake(CGRectGetMinX(contentRect) - kPopoverViewMaginToBtn - self.popoverContentSize.width, viewBottom - self.popoverContentSize.height, self.popoverContentSize.width, self.popoverContentSize.height);
            }
        }
            break;
        case YJPopoverArrowDirection_down:
        {
            self.contentViewRect = CGRectMake(0, 0, self.popoverContentSize.width, self.popoverContentSize.height - kPopoverViewArrowHeight);
            
            CGFloat viewLeft, viewRight;
            
            //点击视图位于屏幕左边时， 判断弹出视图是否超出屏幕左边缘，如果超出就将弹出视图整个右移；
            //点击视图位于屏幕右边时， 判断弹出视图是否超出屏幕右边缘，如果超出就将弹出视图整个左移;
            if (CGRectGetMidX(contentRect) <= CGRectGetMidX(kYJCurrentWindow.bounds)) {
                viewLeft = CGRectGetMidX(contentRect) - self.popoverContentSize.width / 2;
                if (viewLeft < 0) {
                    viewLeft = kPopoverViewMaginToScreen;
                }
                self.popoverView.arrowLocation = CGRectGetMidX(contentRect) - viewLeft;
                self.view.frame = CGRectMake(viewLeft, CGRectGetMinY(contentRect) - kPopoverViewMaginToBtn - self.popoverContentSize.height, self.popoverContentSize.width, self.popoverContentSize.height);
            }
            else {
                viewRight = CGRectGetMidX(contentRect) + self.popoverContentSize.width / 2;
                if (viewRight > kYJScreenWidth) {
                    viewRight = kYJScreenWidth - kPopoverViewMaginToScreen;
                }
                self.popoverView.arrowLocation = CGRectGetWidth(self.popoverView.bounds) - (viewRight - CGRectGetMidX(contentRect));
                self.view.frame = CGRectMake(viewRight - self.popoverContentSize.width, CGRectGetMinY(contentRect) - kPopoverViewMaginToBtn - self.popoverContentSize.height, self.popoverContentSize.width, self.popoverContentSize.height);
            }
        }
            break;
        case YJPopoverArrowDirection_right:
        {
            self.contentViewRect = CGRectMake(kPopoverViewArrowHeight, 0, self.popoverContentSize.width - kPopoverViewArrowHeight, self.popoverContentSize.height);
            
            CGFloat viewTop, viewBottom;
            
            //点击视图位于屏幕上方时， 判断弹出视图是否超出屏幕上边缘，如果超出就将弹出视图整个下移；
            //点击视图位于屏幕下方时， 判断弹出视图是否超出屏幕下边缘，如果超出就将弹出视图整个上移;
            if (CGRectGetMidY(contentRect) <= CGRectGetMidY(kYJCurrentWindow.bounds)) {
                viewTop = CGRectGetMidY(contentRect) - self.popoverContentSize.height / 2;
                if (viewTop < 0) {
                    viewTop = kPopoverViewMaginToScreen;
                }
                self.popoverView.arrowLocation = CGRectGetMidY(contentRect) - viewTop;
                self.view.frame = CGRectMake(CGRectGetMaxX(contentRect) + kPopoverViewMaginToBtn, viewTop, self.popoverContentSize.width, self.popoverContentSize.height);
            }
            else {
                viewBottom = CGRectGetMidY(contentRect) + self.popoverContentSize.height / 2;
                if (viewBottom > kYJScreenHeight) {
                    viewBottom = kYJScreenHeight - kPopoverViewMaginToScreen;
                }
                self.popoverView.arrowLocation = CGRectGetHeight(self.popoverView.bounds) - (viewBottom - CGRectGetMidY(contentRect));
                self.view.frame = CGRectMake(CGRectGetMaxX(contentRect) + kPopoverViewMaginToBtn, viewBottom - self.popoverContentSize.height, self.popoverContentSize.width, self.popoverContentSize.height);
            }
        }
            break;
        default:
            break;
    }

    [kYJPopViewManager showPopView:self.view disMissBlock:^{
        [self.contentViewController willMoveToParentViewController:nil];
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
