//
//  ViewController.m
//  GetPositionEverySecond
//
//  Created by Omar LAHLOU on 26/01/2015.
//  Copyright (c) 2015 Omar LAHLOU. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    LocationAndAccelerometer *a = [[LocationAndAccelerometer alloc] init];
    [a setMinuteTimer];

 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
