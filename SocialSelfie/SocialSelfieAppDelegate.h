//
//  SocialSelfieAppDelegate.h
//  SocialSelfie
//
//  Created by Saad Khan on 23/08/2014.
//  Copyright (c) 2014 SocialSelfie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftSlideViewController.h"
#import "CenterMainViewController.h"

@class JASidePanelController;

@interface SocialSelfieAppDelegate : UIResponder <UIApplicationDelegate>
{
    
}
@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) JASidePanelController *rootVC;
@property (strong, nonatomic) LeftSlideViewController * leftSlideVC;
@property (strong, nonatomic) CenterMainViewController * centerMainVC;
@property (strong, nonatomic) UINavigationController * centerNavController;

-(BOOL)isCurrentCenterViewController:(id)controller;
-(void)changeCenterViewController:(id)controller;
-(void)showSlideMenu;
@end
