//
//  ViewController.m
//  YJPopoverDemo
//
//  Created by d-engine on 16/12/27.
//  Copyright © 2016年 yangjun. All rights reserved.
//

#import "ViewController.h"
#import "YJPopoverController.h"
#import "YJPopoverContentController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *btnPop;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"popover Demo";
}

- (IBAction)btnTitleTapAction:(UIButton *)btn
{
    NSLog(@"111");
    
    YJPopoverContentController *contentController = [[YJPopoverContentController alloc] init];
    
    YJPopoverController *popController = [[YJPopoverController alloc] initWithContentViewController:contentController popoverContentSize:CGSizeMake(150, 35 * 3 + 10)];
    [popController presentPopoverFromRect:btn.frame inView:btn.superview permitterArrowDirections:YJPopoverArrowDirection_up animated:YES];
}

- (IBAction)btnPopDownTapAction:(UIButton *)btn
{
    YJPopoverContentController *contentController= [[YJPopoverContentController alloc] init];
    
    YJPopoverController *popController = [[YJPopoverController alloc] initWithContentViewController:contentController popoverContentSize:CGSizeMake(150, 35 * 3 + 10)];
    [popController presentPopoverFromRect:btn.frame inView:btn.superview permitterArrowDirections:YJPopoverArrowDirection_down animated:YES];
}

- (IBAction)btnPopLeftTapAction:(UIButton *)btn
{
    YJPopoverContentController *contentController = [[YJPopoverContentController alloc] init];
    
    YJPopoverController *popController = [[YJPopoverController alloc] initWithContentViewController:contentController popoverContentSize:CGSizeMake(150, 35 * 3 + 10)];
    [popController presentPopoverFromRect:btn.frame inView:btn.superview permitterArrowDirections:YJPopoverArrowDirection_left animated:YES];
}

- (IBAction)btnPopRightTapAction:(UIButton *)btn
{
    YJPopoverContentController *contentController = [[YJPopoverContentController alloc] init];
    
    YJPopoverController *popController = [[YJPopoverController alloc] initWithContentViewController:contentController popoverContentSize:CGSizeMake(150, 35 * 3 + 10)];
    [popController presentPopoverFromRect:btn.frame inView:btn.superview permitterArrowDirections:YJPopoverArrowDirection_right animated:YES];
}

@end
