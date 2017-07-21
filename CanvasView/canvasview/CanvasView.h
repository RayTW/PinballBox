//
//  CanvasView.h
//  CanvasView
//
//  Created by Ray on 2017/5/6.
//  Copyright © 2017年 Ray. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Role.h"

@interface CanvasView : UIView

//畫面載入時
- (void)setUp:(CGRect)frame;
//預設每秒刷新畫面30次
- (void)setFPS:(NSInteger)fps;
//點擊畫面的位置
- (CGPoint)locationInViewWithTouche:(NSSet *)touches;
//加入要繪置到畫面上的角色
- (void)addRole:(id<Role>)role;
//移除要場景上的角色
- (void)removeRole:(id<Role>)role;
//當可繪置畫面時的事件
- (void)onDrawnRoles:(NSMutableArray<id<Role>> *)roles;
@end
