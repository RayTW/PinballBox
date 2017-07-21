//
//  ViewController.m
//  CanvasView
//
//  Created by Ray on 2017/5/6.
//  Copyright © 2017年 Ray. All rights reserved.
//

#import "ViewController.h"
#import "ScenesView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setUpScenesView];
    
}

- (void)setUpScenesView{
    ScenesView *view = [[ScenesView alloc] initWithFrame:self.view.frame];
    
    [self.view addSubview:view];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
