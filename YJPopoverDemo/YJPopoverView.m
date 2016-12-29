//
//  BMTitlePopView.m
//  Bremer
//
//  Created by d-engine on 16/12/9.
//  Copyright © 2016年 yangjun. All rights reserved.
//

#import "YJPopoverView.h"

const NSInteger kPopoverViewArrowHeight = 4;

@interface YJPopoverView ()


@end

@implementation YJPopoverView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [[UIColor blackColor] setFill];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    switch (self.arrowDirection) {
        case YJPopoverArrowDirection_up:
        {
            CGContextMoveToPoint(context, self.arrowX, CGRectGetMinY(rect));
            CGContextAddLineToPoint(context, self.arrowX - kPopoverViewArrowHeight, CGRectGetMinY(rect) + kPopoverViewArrowHeight);
            CGContextAddLineToPoint(context, CGRectGetMinX(rect), CGRectGetMinY(rect) + kPopoverViewArrowHeight);
            CGContextAddLineToPoint(context, CGRectGetMinX(rect), CGRectGetMaxY(rect));
            CGContextAddLineToPoint(context, CGRectGetMaxX(rect), CGRectGetMaxY(rect));
            CGContextAddLineToPoint(context, CGRectGetMaxX(rect), CGRectGetMinY(rect) + kPopoverViewArrowHeight);
            CGContextAddLineToPoint(context, self.arrowX + kPopoverViewArrowHeight, CGRectGetMinY(rect) + kPopoverViewArrowHeight);
            CGContextAddLineToPoint(context, self.arrowX, CGRectGetMinY(rect));
        }
            break;
        case YJPopoverArrowDirection_left:
        {
            CGContextMoveToPoint(context, CGRectGetMinX(rect), CGRectGetMinY(rect));
            CGContextAddLineToPoint(context, CGRectGetMinX(rect), CGRectGetMaxY(rect));
            CGContextAddLineToPoint(context, CGRectGetMaxX(rect) - kPopoverViewArrowHeight, CGRectGetMaxY(rect));
            CGContextAddLineToPoint(context, CGRectGetMaxX(rect) - kPopoverViewArrowHeight, self.arrowX + kPopoverViewArrowHeight);
            CGContextAddLineToPoint(context, CGRectGetMaxX(rect), self.arrowX);
            CGContextAddLineToPoint(context, CGRectGetMaxX(rect) - kPopoverViewArrowHeight, self.arrowX - kPopoverViewArrowHeight);
            CGContextAddLineToPoint(context, CGRectGetMaxX(rect) - kPopoverViewArrowHeight, CGRectGetMinY(rect));
            CGContextAddLineToPoint(context, CGRectGetMinX(rect), CGRectGetMinY(rect));
        }
            break;
        case YJPopoverArrowDirection_down:
        {
            CGContextMoveToPoint(context, CGRectGetMinX(rect), CGRectGetMinY(rect));
            CGContextAddLineToPoint(context, CGRectGetMinX(rect), CGRectGetMaxY(rect) - kPopoverViewArrowHeight);
            CGContextAddLineToPoint(context, self.arrowX - kPopoverViewArrowHeight, CGRectGetMaxY(rect) - kPopoverViewArrowHeight);
            CGContextAddLineToPoint(context, self.arrowX, CGRectGetMaxY(rect));
            CGContextAddLineToPoint(context, self.arrowX + kPopoverViewArrowHeight, CGRectGetMaxY(rect) - kPopoverViewArrowHeight);
            CGContextAddLineToPoint(context, CGRectGetMaxX(rect), CGRectGetMaxY(rect) - kPopoverViewArrowHeight);
            CGContextAddLineToPoint(context, CGRectGetMaxX(rect), CGRectGetMinY(rect));
            CGContextAddLineToPoint(context, CGRectGetMinX(rect), CGRectGetMinY(rect));
        }
            break;
        case YJPopoverArrowDirection_right:
        {
            CGContextMoveToPoint(context, CGRectGetMinX(rect) + kPopoverViewArrowHeight, CGRectGetMinY(rect));
            CGContextAddLineToPoint(context, CGRectGetMinX(rect) + kPopoverViewArrowHeight, self.arrowX - kPopoverViewArrowHeight);
            CGContextAddLineToPoint(context, CGRectGetMinX(rect), self.arrowX);
            CGContextAddLineToPoint(context, CGRectGetMinX(rect) + kPopoverViewArrowHeight, self.arrowX + kPopoverViewArrowHeight);
            CGContextAddLineToPoint(context, CGRectGetMinX(rect) + kPopoverViewArrowHeight, CGRectGetMaxY(rect));
            CGContextAddLineToPoint(context, CGRectGetMaxX(rect), CGRectGetMaxY(rect));
            CGContextAddLineToPoint(context, CGRectGetMaxX(rect), CGRectGetMinY(rect));
            CGContextAddLineToPoint(context, CGRectGetMinX(rect) + kPopoverViewArrowHeight, CGRectGetMinY(rect));
        }
            break;
        default:
            break;
    }
    
    CGContextDrawPath(context, kCGPathFillStroke);
}

@end
