//
//  HomeViewController.m
//  SocialSelfie
//
//  Created by Saad Khan on 18/10/2014.
//  Copyright (c) 2014 SocialSelfie. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeCollectionCell.h"
#import "MensGalleryViewController.h"
#import "WoMensGalleryViewController.h"

@interface HomeViewController ()
{
    NSMutableArray * mainArray;
}
@end

@implementation HomeViewController

- (id)init
{
    self = [super initWithNibName:@"HomeViewController" bundle:nil];
    if (self) {
        mainArray=[[NSMutableArray alloc]init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //For Collection view
    [self.collectionView registerNib:[UINib nibWithNibName:@"HomeCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"HomeColCell"];
    
    [self loadMainArray];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark:Custom Methods
-(void)loadMainArray{
    [mainArray removeAllObjects];
    [mainArray addObject:@"Mens Gallery"];
    [mainArray addObject:@"Womens Gallery"];
    [mainArray addObject:@"Upload Photo"];
    [mainArray addObject:@"Take a Photo"];
    [mainArray addObject:@"Chat"];
    [mainArray addObject:@"My Profile"];
    [mainArray addObject:@"My Alerts"];
    [mainArray addObject:@"Settings"];
}
#pragma mark: UICollectionView Delegates and Datasource Methods
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [mainArray count];
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(90,90);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5, 5, 5, 5);//(top, left, bottom, right);
}
- (HomeCollectionCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HomeCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeColCell" forIndexPath:indexPath];
    
    cell.titleLbl.text=[mainArray objectAtIndex:indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%li",(long)indexPath.row);
    if([[mainArray objectAtIndex:indexPath.row]isEqualToString:@"Mens Gallery"]){
        MensGalleryViewController * mensGalleryVC=[[MensGalleryViewController alloc]init];
        [self.navigationController pushViewController:mensGalleryVC animated:YES];
    }
    else if([[mainArray objectAtIndex:indexPath.row]isEqualToString:@"Womens Gallery"]){
        WoMensGalleryViewController * womensGalleryVC=[[WoMensGalleryViewController alloc]init];
        [self.navigationController pushViewController:womensGalleryVC animated:YES];
    }
}

@end
