//
//  ICESecondViewController.h
//  Ice EFREI
//
//  Created by McNight on 16/04/13.
//  Copyright (c) 2013 ICE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ICESecondViewController : UIViewController <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;

- (void)checkEFREIsDistanceFromLocation:(CLLocation *)location;

@end
