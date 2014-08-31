//
//  LoginViewController.m
//  SocialSelfie
//
//  Created by Saad Khan on 30/08/2014.
//  Copyright (c) 2014 SocialSelfie. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)init
{
    self = [super initWithNibName:@"LoginViewController" bundle:nil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    UIButton *btnTopBarLeft = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnTopBarLeft setFrame:CGRectMake(0, 0, 31, 25)];
    [btnTopBarLeft.imageView setContentMode:UIViewContentModeLeft ];
    [btnTopBarLeft setImage:[UIImage imageNamed:@"back-arrow.png"] forState:UIControlStateNormal];
    [btnTopBarLeft setImage:[UIImage imageNamed:@"back-arrow-pressed.png"] forState:UIControlStateHighlighted];
    [btnTopBarLeft addTarget:self action:@selector(goBack:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButtonItemRight = [[UIBarButtonItem alloc] initWithCustomView:btnTopBarLeft];
    self.navigationItem.leftBarButtonItem = barButtonItemRight;

}
-(void)goBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
