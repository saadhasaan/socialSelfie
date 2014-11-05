//
//  MyPhotoCell.m
//  SocialSelfie
//
//  Created by Saad Khan on 27/10/2014.
//  Copyright (c) 2014 SocialSelfie. All rights reserved.
//

#import "MyPhotoCell.h"

@implementation MyPhotoCell
@synthesize delegate;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)likeBtnAction:(id)sender {
    [delegate gotoLikesDetailForPhotoID:@"ad"];
}

- (IBAction)commentBtnAction:(id)sender {
    [delegate gotoCommentsDetailForPhotoID:@"ad"];
}

- (IBAction)shareBtnAction:(id)sender {
    [delegate gotoShareForPhotoID:@"ad"];
}
@end
