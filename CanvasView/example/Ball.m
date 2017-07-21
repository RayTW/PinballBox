//
//  Ball.m
//  CanvasView
//
//  Created by ray.lee on 2017/5/9.
//  Copyright © 2017年 Ray. All rights reserved.
//

#import "Ball.h"

@implementation Ball{
    int mCount;
}

-(instancetype)initWithCGRect:(CGRect)rect{
    mCount = 2;
    return [super initWithCGRect:rect];
}

- (void)onDraw:(CGContextRef)contextRef{
    
    mCount--;
    
    
    
    if(mCount == 1){
        //畫ball
        UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake([self getX], [self getY], [self getWidth], [self getHeight]) cornerRadius:[self getHeight]];
        [[UIColor blueColor] set];
        CGContextAddPath(contextRef, path.CGPath);
        CGContextEOFillPath(contextRef);

    }else{
        //畫ball
        UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake([self getX], [self getY], [self getWidth], [self getHeight]) cornerRadius:[self getHeight]];
        [[UIColor greenColor] set];
        CGContextAddPath(contextRef, path.CGPath);
        CGContextEOFillPath(contextRef);

    }
    
    if(mCount <= 0){
        mCount = 2;
    }

}
@end
