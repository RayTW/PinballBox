//
//  AbstractRole.m
//  CanvasView
//
//  Created by Ray on 2017/5/6.
//  Copyright © 2017年 Ray. All rights reserved.
//

#import "AbstractRole.h"

@interface AbstractRole (){
}

@property (nonatomic, assign)NSInteger mTag;
@property (nonatomic, assign)float mX;
@property (nonatomic, assign)float mY;
@property (nonatomic, assign)float mWidth;
@property (nonatomic, assign)float mHeight;
@property (nonatomic, assign)float mHitWidth;
@property (nonatomic, assign)float mHitHeight;

@end

@implementation AbstractRole : NSObject

-(instancetype)initWithCGRect:(CGRect)rect{
    if (self = [super init]) {
        _mTag = 0;
        _mX = rect.origin.x;
        _mY = rect.origin.y;
        _mWidth = rect.size.width;
        _mHeight = rect.size.height;
        _mHitWidth = rect.size.width;
        _mHitHeight = rect.size.height;
    }
    
    return self;

}

- (void)setTag:(NSInteger)tag{
    _mTag = tag;
}

- (NSInteger)getTag{
   return _mTag;
}

- (float)getX{
    return _mX;
}

- (float)getY{
    return _mY;
}

- (float)getWidth{
    return _mWidth;
}

- (float)getHeight{
    return _mHeight;
}

- (void)setCGPoint:(CGPoint)point{
    _mX = point.x;
    _mY = point.y;
}

- (void)setX:(float)x{
    _mX = x;
}

- (void)setY:(float)y{
    _mY = y;
}

- (void)setWidth:(float)width{
    _mWidth = width;
}

- (void)setHeight:(float)height{
    _mHeight = height;
}

- (float)getHitWidth{
    return _mHitWidth;
}

- (float)getHitHeight{
    return _mHitHeight;
}

- (void)setHitWidth:(float)width{
    _mHitWidth = width;
}

- (void)setHitHeight:(float)height{
    _mHitHeight = height;
}


- (BOOL)hit:(id<Role>)role{
    int hx = [role getX];
    int hy = [role getY];
    int hh = [role getHitHeight];
    int hw = [role getHitWidth];
    
    return ((hx + hw > [self getX]) &&
            (hx < [self getX] + [self getHitWidth]) &&
            (hy + hh > [self getY]) &&
            (hy < [self getY] + [self getHitHeight]));
}

- (void)onDraw:(CGContextRef)contextRef{
}
@end
