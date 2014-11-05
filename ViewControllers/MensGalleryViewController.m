//
//  MensGalleryViewController.m
//  SocialSelfie
//
//  Created by Saad Khan on 18/10/2014.
//  Copyright (c) 2014 SocialSelfie. All rights reserved.
//

#import "MensGalleryViewController.h"
#import "CommentsViewController.h"
#import "AFNetworking.h"
#import "MBProgressHUD.h"
#import "Constants.h"
#import "UtilsFunctions.h"


@interface MensGalleryViewController ()
{
    SharePopUpView * sharePopUpView;
    BOOL isSharePopUpViewPresent;
}
@end

@implementation MensGalleryViewController

- (id)init
{
    self = [super initWithNibName:@"MensGalleryViewController" bundle:nil];
    if (self) {
        sharePopUpView=[[SharePopUpView alloc]init];
        sharePopUpView.frame=CGRectMake(0, self.view.frame.size.height-130-100,sharePopUpView.frame.size.width, sharePopUpView.frame.size.height);
        sharePopUpView.delegate=self;
        isSharePopUpViewPresent=NO;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _imagePager.pageControl.currentPageIndicatorTintColor = [UIColor lightGrayColor];
    _imagePager.pageControl.pageIndicatorTintColor = [UIColor blackColor];
    
    [self getAllPicturesOfMensGalleryWebsrvice];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - AFImagePager DataSource
- (NSArray *) arrayWithImageUrlStrings
{
    return [NSArray arrayWithObjects:
            @"https://raw.github.com/kimar/tapebooth/master/Screenshots/Screen1.png",
            @"https://raw.github.com/kimar/tapebooth/master/Screenshots/Screen2.png",
            @"https://raw.github.com/kimar/tapebooth/master/Screenshots/Screen3.png",
            nil];
}

- (UIViewContentMode) contentModeForImage:(NSUInteger)image
{
    return UIViewContentModeScaleAspectFill;
}

#pragma mark:IBActions
- (IBAction)goToPhotosAction:(id)sender {
}

- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)goToCommentsAction:(id)sender {
    CommentsViewController * commentVC=[[CommentsViewController alloc]init];
    [self.navigationController pushViewController:commentVC animated:YES];
}

- (IBAction)goToShareAction:(id)sender {
    if (!isSharePopUpViewPresent) {
        isSharePopUpViewPresent=YES;
        [self.view addSubview:sharePopUpView];
    }
    else{
        isSharePopUpViewPresent=NO;
        [sharePopUpView removeFromSuperview];
    }
}

- (IBAction)goToLikeAction:(id)sender {
}
#pragma mark:SharePopUpViewDelegate
-(void)shareFBButtonHasBeenPressed{
    
}
-(void)shareTWButtonHasBeenPressed{
    
}
-(void)closeSharePopUpViewButtonHasBeenPressed{
    isSharePopUpViewPresent=NO;
    [sharePopUpView removeFromSuperview];
}
#pragma mark:Webservices
-(void)likePhotoWebservice{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    

    [params setObject:@"asd" forKey:kImageID];
    if (GetStringWithKey(kUserID)) {
        [params setObject:GetStringWithKey(kUserID) forKey:kUserID];
    }

    [params setObject:kTaskLikeImage forKey:kTask];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [manager POST:kBaseURL parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        NSLog(@"Error: %@", error);
    }];
}
-(void)getAllPicturesOfMensGalleryWebsrvice{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    if (GetStringWithKey(kUserID)) {
        [params setObject:GetStringWithKey(kUserID) forKey:kUserID];
    }
    
    [params setObject:kTaskGetAllMaleImages forKey:kTask];
    
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
