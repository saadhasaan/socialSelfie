//
//  MensGalleryViewController.m
//  SocialSelfie
//
//  Created by Saad Khan on 18/10/2014.
//  Copyright (c) 2014 SocialSelfie. All rights reserved.
//

#import "MensGalleryViewController.h"

@interface MensGalleryViewController ()

@end

@implementation MensGalleryViewController

- (id)init
{
    self = [super initWithNibName:@"MensGalleryViewController" bundle:nil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark:IBActions
- (IBAction)goToPhotosAction:(id)sender {
}

- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)goToCommentsAction:(id)sender {
}

- (IBAction)goToShareAction:(id)sender {
}
@end
