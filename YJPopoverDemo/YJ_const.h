//
//  YJ_const.h
//  YJPopoverDemo
//
//  Created by d-engine on 16/12/28.
//  Copyright © 2016年 yangjun. All rights reserved.
//

#ifndef YJ_const_h
#define YJ_const_h

#define kCurrentWindow          ((UIWindow *)[[UIApplication sharedApplication].windows firstObject])

#define kScreenWidth            [UIScreen mainScreen].bounds.size.width
#define kScreenHeight           [UIScreen mainScreen].bounds.size.height


typedef NS_ENUM(NSUInteger, YJPopoverArrowDirection) {
    YJPopoverArrowDirection_up,
    YJPopoverArrowDirection_left,
    YJPopoverArrowDirection_down,
    YJPopoverArrowDirection_right
};

#endif /* YJ_const_h */
