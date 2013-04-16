//
//  ICEFirstViewController.h
//  Ice EFREI
//
//  Created by McNight on 16/04/13.
//  Copyright (c) 2013 ICE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ICEFirstViewController : UIViewController <UIWebViewDelegate>

@property (strong, nonatomic) IBOutlet UIWebView *webView;

- (BOOL)checkAlreadyLaunched;

- (void)loadWebsite;

@end
