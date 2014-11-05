//
//  MyPhotoesViewController.h
//  SocialSelfie
//
//  Created by Saad Khan on 27/10/2014.
//  Copyright (c) 2014 SocialSelfie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyPhotoesViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)backBtnAction:(id)sender;

@end
