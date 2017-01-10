//
//  YJPopoverController.h
//  YJPopoverDemo
//
//  Created by d-engine on 16/12/27.
//  Copyright © 2016年 yangjun. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface YJPopoverController : UIViewController

/**
 *
 *  @param contentViewController 内容视图
 *  @param popoverContentSize    内容视图大小
 *
 */
- (instancetype)initWithContentViewController:(UIViewController *)contentViewController popoverContentSize:(CGSize)popoverContentSize;

/**
 *
 *  @param fromRect                以此rect来决定弹出框位置
 *  @param inView                  fromRect参数是以此view为参考
 *  @param permitterArrowDirection 箭头方向
 *  @param animated                是否有动画
 */
- (void)presentPopoverFromRect:(CGRect)fromRect inView:(UIView *)inView permitterArrowDirections:(YJPopoverArrowDirection)permitterArrowDirection animated:(BOOL)animated;
- (void)presentPopoverFromBarButtonItem:(UIBarButtonItem *)item permittedArrowDirections:(YJPopoverArrowDirection)arrowDirections animated:(BOOL)animated;

@end
