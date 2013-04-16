//
//  ICEFirstViewController.m
//  Ice EFREI
//
//  Created by McNight on 16/04/13.
//  Copyright (c) 2013 ICE. All rights reserved.
//

#import "ICEFirstViewController.h"

@interface ICEFirstViewController ()

@end

@implementation ICEFirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Site Web", @"Site Web");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // On vérifie s'il s'agit du premier lancement de l'application.
    
    if (![self checkAlreadyLaunched]) {
        
        UIAlertView *firstLaunchAlertView = [[UIAlertView alloc] initWithTitle:@"Ice EFREI"
                                                                       message:@"Bienvenue sur l'application Ice EFREI !"
                                                                      delegate:nil
                                                             cancelButtonTitle:nil
                                                             otherButtonTitles:@"Ok", nil];
        
        [firstLaunchAlertView show];
    }
    
    // On lance le chargement du site de Ice EFREI.
    
    [self loadWebsite];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)checkAlreadyLaunched {
    
    static NSString *const alreadyLaunchedKey = @"alreadyLaunched";
    
    BOOL alreadyLaunched = [[NSUserDefaults standardUserDefaults] boolForKey:alreadyLaunchedKey];
    
    if (!alreadyLaunched) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:alreadyLaunchedKey];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
    return alreadyLaunched;
}

- (void)loadWebsite {
    
    static NSString *const websiteURLAsString = @"http://www.ice-efrei.fr/";
    
    self.webView.scalesPageToFit = YES;
    self.webView.delegate = self; // On ne s'en sert pas (encore?) pour bon... pour le principe !
    
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:websiteURLAsString]];
    
    [self.webView loadRequest:urlRequest];
}

@end
