//
//  UploadPhotoViewController.m
//  SocialSelfie
//
//  Created by Saad Khan on 29/10/2014.
//  Copyright (c) 2014 SocialSelfie. All rights reserved.
//

#import "UploadPhotoViewController.h"
#import "AFNetworking.h"
#import "Constants.h"
#import "UtilsFunctions.h"
#import "MBProgressHUD.h"

@interface UploadPhotoViewController ()

@end

@implementation UploadPhotoViewController
@synthesize mainImage;
- (id)initWithImage:(UIImage *)img
{
    self = [super initWithNibName:@"UploadPhotoViewController" bundle:Nil];
    if (self) {
        mainImage=img;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.imgView.image=mainImage;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark:IBAction & Selectors
- (IBAction)uploadBtnAction:(id)sender {
}

#pragma mark:Webservices
-(void)uploadPhotoWebservice{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    [params setObject:kTaskUploadImage forKey:kTask];
    [params setObject:GetStringWithKey(kUserID) forKey:kUserID];
    [params setObject:UIImagePNGRepresentation(mainImage) forKey:kUploadedFile];
    
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

