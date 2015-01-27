//
//  LocationAndAccelerometer.h
//  GetPositionEverySecond
//
//  Created by Omar LAHLOU on 27/01/2015.
//  Copyright (c) 2015 Omar LAHLOU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreMotion/CoreMotion.h>

@interface LocationAndAccelerometer : NSObject<CLLocationManagerDelegate>





@property(strong, nonatomic) CLLocationManager* locationManager;
@property(strong, nonatomic) CLLocation* location;//current location
@property(strong, nonatomic) NSDate* currentDate;//current date
@property(strong, nonatomic) CMAccelerometerData *accelerometerData;


-(void) setMinuteTimer;


@end
