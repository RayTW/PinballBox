//
//  AbstractRole.h
//  CanvasView
//
//  Created by Ray on 2017/5/6.
//  Copyright © 2017年 Ray. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Role.h"

@interface AbstractRole : NSObject<Role>

-(instancetype)initWithCGRect:(CGRect)rect;

@end
