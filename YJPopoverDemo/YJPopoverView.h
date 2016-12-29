//
//  BMTitlePopView.h
//  Bremer
//
//  Created by d-engine on 16/12/9.
//  Copyright © 2016年 yangjun. All rights reserved.
//


#import <UIKit/UIKit.h>

extern const NSInteger kPopoverViewArrowHeight;

@interface YJPopoverView : UIView

//箭头方向
@property (nonatomic, assign) YJPopoverArrowDirection arrowDirection;
//箭头x坐标
@property (nonatomic, assign) CGFloat arrowX;

@end
