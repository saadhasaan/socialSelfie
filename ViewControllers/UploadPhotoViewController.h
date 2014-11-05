//
//  UploadPhotoViewController.h
//  SocialSelfie
//
//  Created by Saad Khan on 29/10/2014.
//  Copyright (c) 2014 SocialSelfie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UploadPhotoViewController : UIViewController


@property (strong,nonatomic)UIImage * mainImage;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

- (IBAction)uploadBtnAction:(id)sender;
- (id)initWithImage:(UIImage *)img;
@end
