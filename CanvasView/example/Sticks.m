//
//  Sticks.m
//  CanvasView
//
//  Created by Ray on 2017/5/8.
//  Copyright © 2017年 Ray. All rights reserved.
//

#import "Sticks.h"

@implementation Sticks

- (void)onDraw:(CGContextRef)contextRef{
    //畫方塊
    UIBezierPath * path = [UIBezierPath bezierPathWithRect:CGRectMake([self getX], [self getY], [self getWidth], [self getHeight])];
    
    //方塊顏竂
    [[UIColor blackColor] set];
    //3.添加路径
    CGContextAddPath(contextRef, path.CGPath);
    CGContextEOFillPath(contextRef);

}
@end
