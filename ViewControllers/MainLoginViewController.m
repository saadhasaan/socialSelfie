//
//  MainLoginViewController.m
//  SocialSelfie
//
//  Created by Saad Khan on 04/11/2014.
//  Copyright (c) 2014 SocialSelfie. All rights reserved.
//

#import "MainLoginViewController.h"
#import <AdSupport/AdSupport.h>
#import "UtilsFunctions.h"
#import "Constants.h"
#import "AFNetworking.h"

#define facebookKey @"123"
@interface MainLoginViewController (){
    FBLogin * fbLogin;
}

@end

@implementation MainLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    SaveStringWithKey([[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString],kDeviceID);
    SaveStringWithKey(@"1", kDeviceType);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark:FBLoginDelegate
-(void)failedToFetchAnyAccount{
    [MBProgressHUD hideAllHUDsForView:self.view animated:NO];
}
-(void)fbProfileHasBeenFetchedSuccessfullyWithInfo:(FBUserSelf *)fbUser{
    [MBProgressHUD hideAllHUDsForView:self.view animated:NO];
    [self facebookLoginWebserviceWithFBUser:fbUser];
}
-(void)fbProfileDidNotFetched{
    [MBProgressHUD hideAllHUDsForView:self.view animated:NO];
}
#pragma mark:IBActions and Selectors
- (IBAction)facebookBtnAction:(id)sender {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    if (!fbLogin) {
        fbLogin=[[FBLogin alloc]initWithKey:facebookKey];
        fbLogin.delegate=self;
    }
    else{
        [fbLogin facebookAccountInit];
    }
}

- (IBAction)twitterBtnPressed:(id)sender {
}

- (IBAction)socialSelfieLoginBtnPressed:(id)sender {
    LoginViewController * loginVC=[[LoginViewController alloc]init];
    [self.navigationController pushViewController:loginVC animated:YES];
}
- (IBAction)signUpBtnPressed:(id)sender {
    SignupViewController * signUp=[[SignupViewController alloc]init];
    [self.navigationController pushViewController:signUp animated:YES];
}

- (IBAction)aboutUsBtnPressed:(id)sender {
}
#pragma mark:Webservices
-(void)facebookLoginWebserviceWithFBUser:(FBUserSelf * )fbUser{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    [params setObject:fbUser.firstName forKey:kName];
    [params setObject:fbUser.fbiD forKey:kFBID];
    [params setObject:fbUser.gender forKey:kGender];
    [params setObject:fbUser.email forKey:kEmail];
    [params setObject:fbUser.profileImageURL forKey:kFacebookImage];

    if (GetStringWithKey(kDeviceType)) {
        [params setObject:GetStringWithKey(kDeviceType) forKey:kDeviceID];
    }
    if (GetStringWithKey(kDeviceID)) {
        [params setObject:GetStringWithKey(kDeviceID) forKey:kDeviceID];
    }
    [params setObject:kTaskFBLogin forKey:kTask];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [manager POST:kBaseURL parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        NSLog(@"Error: %@", error);
    }];
}
@end
