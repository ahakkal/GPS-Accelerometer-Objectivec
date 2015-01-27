//
//  LocationAndAccelerometer.m
//  GetPositionEverySecond
//
//  Created by Omar LAHLOU on 27/01/2015.
//  Copyright (c) 2015 Omar LAHLOU. All rights reserved.
//

#import "LocationAndAccelerometer.h"

@implementation LocationAndAccelerometer{
    
    NSTimer *_minuteTimer;
    NSTimer *_fiveSecondsTimer;
    
    
    float _fiveSecondsCount;
    BOOL _exitButtonPressed;

}

-(id) init{
    self = [super init];
    
    self.location = [[CLLocation alloc] init];
    self.currentDate = [[NSDate alloc]init];
    self.locationManager = [[CLLocationManager alloc] init];
    self.accelerometerData = [[CMAccelerometerData alloc] init];
    
    self.locationManager.delegate = self;
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.locationManager startUpdatingLocation];//update location
    
    _fiveSecondsCount = 0;
    _exitButtonPressed = NO;
    
    return self;
}

-(void)updateLocation{
    
    
    
    if ([CLLocationManager locationServicesEnabled]) {//check if location is enabled
        
        self.location = [self.locationManager location];//new location
        self.currentDate = self.location.timestamp;//time at which location was determined
        NSLog(@"%f",self.location.coordinate.latitude);//log out latitude
    }
    else {//location is disabled
        
    }
}

-(void) setMinuteTimer{
    _minuteTimer = [NSTimer scheduledTimerWithTimeInterval:60 target:self selector:@selector(minuteTimerAction) userInfo:nil repeats:YES];
    
    [_minuteTimer fire];// start timer at t=0;
    
}
- (void)minuteTimerAction
{
    [self updateLocation];
    
    if (!_exitButtonPressed) {
        if (!_fiveSecondsCount) {//si t=0
            [self setFiveSecondsTimer];
        }
    }
    else{
        [_minuteTimer invalidate];
        [_fiveSecondsTimer invalidate];
    }
    
    
}

-(void) setFiveSecondsTimer{
    _fiveSecondsTimer = [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(fiveSecondsTimerAction) userInfo:nil repeats:YES];
    
}

-(void)fiveSecondsTimerAction{
    if (_fiveSecondsCount < 5.001) { //the first five seconds
        _fiveSecondsCount += 0.02;
        [self updateAccelerometer];
        
    }
    else{//after 5 seconds, stop the five seconds timer.
        
        [_fiveSecondsTimer invalidate];
        _fiveSecondsCount = 0.0;
    }
}


-(void)updateAccelerometer{
    //get acceleration
    /*to access to x y and z of the accelerometer
     self.accelerometerData.acceleration.x;
     self.accelerometerData.acceleration.y;
     self.accelerometerData.acceleration.z;
     */
    
    
}


@end
