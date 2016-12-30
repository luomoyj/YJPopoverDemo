//
//  YJ_const.h
//  YJPopoverDemo
//
//  Created by d-engine on 16/12/28.
//  Copyright © 2016年 yangjun. All rights reserved.
//

#ifndef YJ_const_h
#define YJ_const_h

#define kYJCurrentWindow          ((UIWindow *)[[UIApplication sharedApplication].windows firstObject])

#define kYJScreenWidth            [UIScreen mainScreen].bounds.size.width
#define kYJScreenHeight           [UIScreen mainScreen].bounds.size.height

#define kPopoverViewArrowHeight 4

//箭头类型
typedef NS_ENUM(NSUInteger, YJPopoverArrowDirection) {
    YJPopoverArrowDirection_up,         //箭头向上
    YJPopoverArrowDirection_left,       //箭头向左
    YJPopoverArrowDirection_down,       //箭头向下
    YJPopoverArrowDirection_right       //箭头向右
};

#endif /* YJ_const_h */
