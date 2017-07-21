//
//  ScenesView.m
//  CanvasView
//
//  Created by Ray on 2017/5/6.
//  Copyright © 2017年 Ray. All rights reserved.
//

#define STICKS_ID 10
#define BALL_ID 20

#import "ScenesView.h"
#import "Sticks.h"
#import "Ball.h"

@implementation ScenesView{
    Sticks *mSticks;
    Ball *mBall;
    float mBallSpeed;
}

- (void)setUp:(CGRect)frame{
    [self setBackgroundColor:[UIColor whiteColor]];
    [self setFPS:30];
    mBallSpeed = 10;
    
    //宣告棒子位置、大小
    mSticks = [[Sticks alloc] initWithCGRect:CGRectMake(0, frame.size.height - 80, 80, 20)];
    [mSticks setHitHeight:0];
    [mSticks setTag:STICKS_ID];
    [self addRole:mSticks];
    
    
    mBall = [[Ball alloc] initWithCGRect:CGRectMake(frame.size.width / 2.0, frame.size.height / 2.0, 20, 20)];
    [mBall setTag:BALL_ID];
    [self addRole:mBall];

    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    CGPoint location = [self locationInViewWithTouche:touches];

    if ([event allTouches].count > 1){
        
        [self.superview touchesMoved:touches withEvent:event];
        
    }else if ([event allTouches].count == 1) {
        
        float x = location.x - ([mSticks getWidth] / 2.0f);
        

        if((location.x + [mSticks getWidth]) > self.frame.size.width){
            [mSticks setX:self.frame.size.width - [mSticks getWidth]];
        }else if(x < 0){
            [mSticks setX:0];
        }else{
            [mSticks setX:location.x];
        }
        
    }
    
}


- (void)onDrawnRoles:(NSMutableArray<id<Role>> *)roles{
    
    //球增加移動距離
    [mBall setY:[mBall getY] + mBallSpeed];
    
    //判斷球是否超出上邊界或下邊界
    if([mBall getY] < 0 || [mBall getY] > self.frame.size.height - [mBall getHeight]){
        mBallSpeed = -mBallSpeed;
    }
    
    //球碰到棒子
    if([mSticks hit:mBall]){
        mBallSpeed = -mBallSpeed;
    }

}



@end
