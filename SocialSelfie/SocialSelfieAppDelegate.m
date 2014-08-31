//
//  SocialSelfieAppDelegate.m
//  SocialSelfie
//
//  Created by Saad Khan on 23/08/2014.
//  Copyright (c) 2014 SocialSelfie. All rights reserved.
//

#import "SocialSelfieAppDelegate.h"
#import "JASidePanelController.h"

@implementation SocialSelfieAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    self.rootVC = [[JASidePanelController alloc] init];
    self.rootVC.shouldDelegateAutorotateToVisiblePanel = NO;
    
    self.leftSlideVC=[[LeftSlideViewController alloc]init];
    self.centerMainVC=[[CenterMainViewController alloc]init];

    self.centerNavController=[[UINavigationController alloc] initWithRootViewController:self.centerMainVC];

	self.rootVC.leftPanel = self.leftSlideVC;
	self.rootVC.centerPanel = self.centerNavController;
	
	self.window.rootViewController = self.rootVC;
    [self.window makeKeyAndVisible];
    return YES;
    
    return YES;
}
#pragma mark:Action for view changings
-(BOOL)isCurrentCenterViewController:(id)controller{
    if([[self.centerNavController.viewControllers lastObject]isKindOfClass:controller])
    {
        return YES;
    }
    return NO;
}
-(void)changeCenterViewController:(id)controller{
//    [self.centerNavController setViewControllers:[NSArray arrayWithObject:controller] animated:NO];
    [self.centerNavController pushViewController:controller animated:NO];
    self.rootVC.centerPanel = self.centerNavController;
//    [self.rootVC showCenterPanelAnimated:YES];
}
-(void)changeCenterViewControllerToCenterMainView{
    [self.centerNavController setViewControllers:[NSArray arrayWithObject:self.centerMainVC] animated:YES];
}
-(void)showSlideMenu{
    [self.rootVC showLeftPanelAnimated:YES];
}
#pragma mark:UIApplication 
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
