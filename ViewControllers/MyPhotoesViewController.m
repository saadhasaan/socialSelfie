//
//  MyPhotoesViewController.m
//  SocialSelfie
//
//  Created by Saad Khan on 27/10/2014.
//  Copyright (c) 2014 SocialSelfie. All rights reserved.
//

#import "MyPhotoesViewController.h"
#import "HMSegmentedControl.h"
#import "MyPhotoCell.h"

@interface MyPhotoesViewController ()
{
    NSMutableArray * mainArray;
}
@end

@implementation MyPhotoesViewController

- (id)init
{
    self = [super initWithNibName:@"MyPhotoesViewController" bundle:Nil];
    if (self) {
        mainArray=[[NSMutableArray alloc]init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
 
    [self addSegmentBarToViewNew];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    return 78;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier=@"photoCell";
    
    
    MyPhotoCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        NSArray * nibArray = [[NSBundle mainBundle] loadNibNamed:@"MyPhotoCell" owner:nil options:nil];
        cell = (MyPhotoCell*)[nibArray objectAtIndex:0];
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    return cell;
}

#pragma mark:Custom Methods
-(void)addSegmentBarToViewNew{
    HMSegmentedControl *tempSegmentControl = [[HMSegmentedControl alloc] initWithFrame:CGRectMake(7, 64 ,306, 36)];
    
    [tempSegmentControl setSectionImages:@[[UIImage imageNamed:@"recent_btn"],[UIImage imageNamed:@"yesterday_btn"],[UIImage imageNamed:@"all_btn"]]];
    
    [tempSegmentControl setSectionSelectedImages:@[[UIImage imageNamed:@"recent_btn_pressed"], [UIImage imageNamed:@"yesterday_btn_pressed"],[UIImage imageNamed:@"all_btn_pressed"]]];
    
    [tempSegmentControl addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
    
    tempSegmentControl.type = HMSegmentedControlTypeImages;
    
    [tempSegmentControl setSelectedSegmentIndex:0];
    
    
    [tempSegmentControl setBackgroundColor:[UIColor clearColor]];
    
    [tempSegmentControl setSelectionIndicatorColor:[UIColor clearColor]];
    
    [tempSegmentControl setSelectionStyle:HMSegmentedControlSelectionStyleBox];
    
    [tempSegmentControl setSelectionLocation:HMSegmentedControlSelectionLocationUp];
    
    [self.view addSubview:tempSegmentControl];
}
#pragma mark-Selectors
- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentedControl {
    NSLog(@"Selected index %ld (via UIControlEventValueChanged)", (long)segmentedControl.selectedSegmentIndex);
}

- (IBAction)backBtnAction:(id)sender {
}
@end
