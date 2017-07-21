//
//  CanvasView.m
//  CanvasView
//
//  Created by Ray on 2017/5/6.
//  Copyright © 2017年 Ray. All rights reserved.
//

#import "CanvasView.h"


@interface CanvasView (){
    NSThread *mDrawThread;
    NSTimeInterval mFPS;
}

@property (nonatomic, strong)NSMutableArray<id<Role>> *mRoles;

@end


@implementation CanvasView


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initialize];
        
        [self setUp: frame];
    }
    
    return self;
}

- (void)initialize{
    [self setFPS:30];
    self.mRoles = [NSMutableArray new];
    mDrawThread = [[NSThread alloc] initWithTarget:self selector:@selector(repaint:) object:self];
    [mDrawThread start];
}

- (void)setFPS:(NSInteger)fps{
    mFPS = 1.0 / fps;
}

- (void)setUp:(CGRect)frame{
    
}

- (void)addRole:(id<Role>)role{
    @synchronized (self.mRoles) {
        [self.mRoles addObject:role];
    }
}

- (void)removeRole:(id<Role>)role{
    @synchronized (self.mRoles) {
        [self.mRoles removeObject:role];
    }
}

- (CGPoint)locationInViewWithTouche:(NSSet *)touches{
    return [[touches anyObject] locationInView:self];
}

- (void)drawRect:(CGRect)rect{
    NSMutableArray *roles = nil;
    
    @synchronized (self.mRoles) {
        roles = [self.mRoles mutableCopy];
    }
    
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    
    for(id<Role> role in roles){
        [role onDraw:contextRef];
    }
    
    [self onDrawnRoles:roles];
    
}

- (void)repaint:(UIView *)view{
    while (![[NSThread currentThread] isCancelled]) {
        dispatch_sync(dispatch_get_main_queue(), ^(){
            [view setNeedsDisplay];
        });
        
        
        [NSThread sleepForTimeInterval: mFPS];
    }
    
}

- (void)onDrawnRoles:(NSMutableArray<id<Role>> *)roles{
    
}




@end
