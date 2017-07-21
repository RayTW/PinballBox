//
//  Role.h
//  CanvasView
//
//  Created by Ray on 2017/5/6.
//  Copyright © 2017年 Ray. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Role <NSObject>

@required

- (void)setTag:(NSInteger)tag;
- (NSInteger)getTag;
- (BOOL)hit:(id<Role>)role;
- (float)getX;
- (float)getY;
- (float)getWidth;
- (float)getHeight;
- (float)getHitWidth;
- (float)getHitHeight;
- (void)setCGPoint:(CGPoint)point;
- (void)setX:(float)x;
- (void)setY:(float)y;
- (void)setWidth:(float)width;
- (void)setHeight:(float)height;
- (void)setHitWidth:(float)width;
- (void)setHitHeight:(float)height;
- (void)onDraw:(CGContextRef)contextRef;
@end
