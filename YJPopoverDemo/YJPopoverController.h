//
//  YJPopoverController.h
//  YJPopoverDemo
//
//  Created by d-engine on 16/12/27.
//  Copyright © 2016年 yangjun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YJPopoverController : UIViewController

- (instancetype)initWithContentViewController:(UIViewController *)contentViewController popoverContentSize:(CGSize)popoverContentSize;
- (void)presentPopoverFromRect:(CGRect)fromRect inView:(UIView *)inView permitterArrowDirections:(YJPopoverArrowDirection)permitterArrowDirection animated:(BOOL)animated;
- (void)presentPopoverFromBarButtonItem:(UIBarButtonItem *)item permittedArrowDirections:(YJPopoverArrowDirection)arrowDirections animated:(BOOL)animated;

@end
