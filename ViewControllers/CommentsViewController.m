//
//  EndrCommentsViewController.m
//  SalamPlanet
//
//  Created by Globit on 29/09/2014.
//  Copyright (c) 2014 Globit. All rights reserved.
//

#import "CommentsViewController.h"
#import "Comment.h"
#import "CommentCell.h"
#import "User.h"

#define kOFFSET_FOR_KEYBOARD 216.0-44.0//for tabbar

@interface CommentsViewController ()
{
    BOOL isKeyBoardAppeared;
    NSMutableArray * mainArray;
    User * meUser;
}

@end

@implementation CommentsViewController
- (id)init
{
    self = [super initWithNibName:@"CommentsViewController" bundle:Nil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    mainArray=[[NSMutableArray alloc]init];
    [self loadMainArray];
    
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    NSNotificationCenter * notifCenter=[NSNotificationCenter defaultCenter];
    [notifCenter addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    [notifCenter addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    NSNotificationCenter * notifCenter=[NSNotificationCenter defaultCenter];
    [notifCenter removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [notifCenter removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark: Keyboard Hide/Show Methods
- (void)keyboardWillHide:(NSNotification *)notif {
    if(isKeyBoardAppeared){
        [self setViewMoveUp:NO];
    }
    isKeyBoardAppeared=NO;
}

- (void)keyboardWillShow:(NSNotification *)notif{
    if(!isKeyBoardAppeared){
        [self setViewMoveUp:YES];
    }
    isKeyBoardAppeared=YES;
    //Scroll the tableview to bottom
    NSIndexPath* ipath = [NSIndexPath indexPathForRow: mainArray.count-1 inSection: 0];
    [self.tableView scrollToRowAtIndexPath: ipath atScrollPosition: UITableViewScrollPositionBottom animated: YES];
}

-(void)setViewMoveUp:(BOOL)moveUp
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3]; // if you want to slide up the view
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    CGRect rect = self.mainView.frame;
    if (moveUp)
    {
        rect.size.height -= kOFFSET_FOR_KEYBOARD;
    }
    else
    {
        rect.size.height += kOFFSET_FOR_KEYBOARD;
    }
    self.mainView.frame = rect;
    [UIView commitAnimations];
}

#pragma mark:Custom Methods
-(void)loadMainArray{

}
-(CGSize)calculateSizeForText:(NSString *)txt{
    
    CGSize maximumLabelSize = CGSizeMake(300, 180);
    CGSize expectedSectionSize = [txt sizeWithFont:self.samplLbl.font
                                               constrainedToSize:maximumLabelSize
                                                   lineBreakMode:NSLineBreakByTruncatingTail];
    return expectedSectionSize;
}
-(void)insertNewComment{
    if([self.commentTF.text length]==0){
        return;
    }
    [self.tableView reloadData];
    [self scrollTableViewToBottom];
    self.commentTF.text=@"";
    
}
-(void)scrollTableViewToBottom{
    //Scroll the tableview to bottom
    NSIndexPath* ipath = [NSIndexPath indexPathForRow: mainArray.count-1 inSection: 0];
    [self.tableView scrollToRowAtIndexPath: ipath atScrollPosition: UITableViewScrollPositionBottom animated: YES];
}
#pragma mark: UITableView Delegates and Datasource methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [mainArray count];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 140;
//    return 64+[self calculateSizeForText:endrCmt.commentText].height+10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifierCommentCell=@"commentCell";

    
    CommentCell * cell = [tableView dequeueReusableCellWithIdentifier:identifierCommentCell];
    if (!cell) {
        NSArray * nibArray = [[NSBundle mainBundle] loadNibNamed:@"CommentCell" owner:nil options:nil];
        cell = (CommentCell*)[nibArray objectAtIndex:0];
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark: IBActions and Selector Methods


- (IBAction)goBackAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma TextField Delegates
-(BOOL) textFieldShouldReturn:(UITextField *)textField{
//    [textField resignFirstResponder];
//    return YES;
    [self insertNewComment];
    return NO;
}
@end
