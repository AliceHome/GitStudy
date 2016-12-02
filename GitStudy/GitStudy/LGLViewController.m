//
//  ViewController.m
//  GitStudy
//
//  Created by Liuguiliang on 2016/12/2.
//  Copyright © 2016年 HuiDragon. All rights reserved.
//

#import "LGViewController.h"

@interface LGViewController () 

@end

@implementation LGViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"view did load.");
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"view will appear.");
}
@end
