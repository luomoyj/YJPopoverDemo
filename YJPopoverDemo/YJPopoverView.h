//
//  BMTitlePopView.h
//  Bremer
//
//  Created by d-engine on 16/12/9.
//  Copyright © 2016年 yangjun. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface YJPopoverView : UIView

//箭头方向
@property (nonatomic, assign) YJPopoverArrowDirection arrowDirection;
//箭头坐标, 上下箭头----x坐标， 左右箭头----y坐标
@property (nonatomic, assign) CGFloat arrowLocation;

@end
