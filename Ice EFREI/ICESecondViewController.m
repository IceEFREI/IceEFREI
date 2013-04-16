//
//  ICESecondViewController.m
//  Ice EFREI
//
//  Created by McNight on 16/04/13.
//  Copyright (c) 2013 ICE. All rights reserved.
//

#import "ICESecondViewController.h"

@interface ICESecondViewController ()

@end

@implementation ICESecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Association", @"Association");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    
    // On prépare la localisation.
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [self.locationManager startUpdatingLocation];
    
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)checkEFREIsDistanceFromLocation:(CLLocation *)location {
    
    static const CLLocationDegrees efreisLatitude = 48.7885246;
    static const CLLocationDegrees efreisLongitude = 2.3637251;
    
    CLLocation *efreisLocation = [[CLLocation alloc] initWithLatitude:efreisLatitude longitude:efreisLongitude];
    
    CLLocationDistance distanceFromEFREI = [location distanceFromLocation:efreisLocation];
    
    if (distanceFromEFREI < 200.0) {
        
        UIAlertView *nearEFREIAlert = [[UIAlertView alloc] initWithTitle:@"Coucou !"
                                                                 message:@"Il semblerait que vous soyez proche de l'école.\nN'hésitez pas à passer nous voir !"
                                                                delegate:nil
                                                       cancelButtonTitle:nil
                                                       otherButtonTitles:@"Ok", nil];
        
        [nearEFREIAlert show];
        
    }
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    
    CLLocation *location = [locations lastObject];
    
    NSLog(@"location : %@", location); // À retirer plus tard...
    
    CLLocationAccuracy accuracy = location.horizontalAccuracy;
    
    if (accuracy <= 100.0) { // Si la précision est d'au moins 100m...
        
        [self.locationManager stopUpdatingLocation]; // On arrête le rafraichissement, ça pompe de la batterie
        
        [self checkEFREIsDistanceFromLocation:location]; // On vérifie s'il est proche de l'école
    }
}

@end
