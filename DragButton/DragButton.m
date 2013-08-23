//
//  DragButton.m
//  DragButtonDemo
//
//  Created by zhang zhiyu on 13-8-23.
//  Copyright (c) 2013年 York. All rights reserved.
//

#import "DragButton.h"

@implementation DragButton
@synthesize dragEnable;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

#pragma mark - touchs event
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (!dragEnable) {
        return;
    }
    UITouch *touch = [touches anyObject];
    
    beginPoint = [touch locationInView:self];
    
    isMoving = NO;
    
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (!dragEnable) {
        return;
    }
    UITouch *touch = [touches anyObject];
    
    CGPoint nowPoint = [touch locationInView:self];
    float offsetX = nowPoint.x - beginPoint.x;
    float offsetY = nowPoint.y - beginPoint.y;
    CGPoint newcenter = CGPointMake(self.center.x + offsetX, self.center.y + offsetY);
    
    /* 限制用户不可将视图托出屏幕 */
    float halfX = CGRectGetMidX(self.bounds);
    //x坐标左边界
    newcenter.x = MAX(halfX, newcenter.x);
    //x坐标右边界
    newcenter.x = MIN(self.superview.bounds.size.width - halfX, newcenter.x);
    
    //y坐标同理
    float halfY = CGRectGetMidY(self.bounds);
    newcenter.y = MAX(halfY, newcenter.y);
    newcenter.y = MIN(self.superview.bounds.size.height - halfY, newcenter.y);
    
    //移动view
    self.center = newcenter;
    
    isMoving = YES;
    
    [super touchesMoved:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (isMoving) {
        [self setHighlighted:NO];
        return;
    }
    
    [super touchesEnded:touches withEvent:event];
}


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
