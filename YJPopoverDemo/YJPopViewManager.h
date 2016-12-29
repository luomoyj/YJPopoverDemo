//
//  YJPopViewManager.h
//  YJPopoverDemo
//
//  Created by d-engine on 16/12/28.
//  Copyright © 2016年 yangjun. All rights reserved.
//

#define kYJPopViewManager [YJPopViewManager shared]

typedef void(^YJBasicBlock)();

#import <UIKit/UIKit.h>

@interface YJPopViewManager : NSObject

+ (instancetype)shared;
- (void)showPopView:(UIView *)view disMissBlock:(YJBasicBlock)disMissBlock;
- (void)disMissView;

@end
