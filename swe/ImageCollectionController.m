//
//  PostsCollectionViewDelegateConcrete.m
//  
//
//  Created by Peter El Jiz on 2015-03-17.
//  Copyright (c) 2015 Peter El Jiz. All rights reserved.
//

#import "ImageCollectionController.h"
#import "ImageViewCell.h"

static NSString * const ImageCellIdentifier = @"ImageCell";

@implementation ImageCollectionController

#pragma mark <UICollectionViewDataSource>

@synthesize offscreenImageCell;
@synthesize contentOffsetDictionary;
@synthesize delegate;


-(id) init {
    
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.offscreenImageCell = [[ImageViewCell alloc] init];
    self.contentOffsetDictionary = [[NSMutableDictionary alloc] init];
    
    return self;
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    //#warning Incomplete method implementation -- Return the number of sections
    return 1;
}


//USE DELEGATE TO ACCESS THE MEDIA INFO


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [delegate mediaCount:collectionView.tag];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ImageViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ImageCellIdentifier forIndexPath:indexPath];
    
    //Set these two so that the cell could inform the controller that the image was clicked
    cell.delegate = self;
    cell.innerRow = indexPath.row;
    cell.outerRow = collectionView.tag;
    
    NSArray *media = [delegate media:collectionView.tag];
    if ((media != nil) && (media.count > 0) && (indexPath.row < media.count)) {
        GDCategory *category = media[indexPath.row];
        [cell loadCategory:category];
    } else {
        //NSLog(@"Media nil or count <= 0");
        //NSLog(@"Media: %@", self.media); //media is not null, so it's the count vs indexPath.row ---> out of sync ---> mafroud hayne
    }
    
    
    return cell;
    
}



#pragma mark --UICollectionViewDelegateFlowLayout
//The size of each item
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    UIEdgeInsets insets = [self collectionView:collectionView layout:collectionViewLayout insetForSectionAtIndex:indexPath.section];
    
    CGSize toReturn; // = CGSizeMake(0, 0);
    
    //If photo is needed
    NSArray *media = [delegate media:collectionView.tag];
    GDCategory *category;
    if ((media != nil) && (media.count > 0) && (indexPath.row < media.count)) {
        category = media[indexPath.row];
    }
    
    //Since the Image Collection Controller is incapable of detecting orientation changes, the parent VC should keep track of it and pass it in.
    UIInterfaceOrientation newOrientation = [delegate newOrientation];
    
    if ((newOrientation == 0) || UIInterfaceOrientationIsPortrait(newOrientation)) {
        
        if ([media count] > 1) {
            toReturn = CGSizeMake(collectionView.frame.size.width - insets.left - insets.right -25, collectionView.bounds.size.height - insets.top - insets.bottom);
        } else {
            toReturn = CGSizeMake(collectionView.frame.size.width - insets.left - insets.right, collectionView.bounds.size.height - insets.top - insets.bottom);
        }
    } else {
        if ([media count] > 1) {
            toReturn = CGSizeMake(collectionView.frame.size.width - insets.left - insets.right - 25, collectionView.bounds.size.height - insets.top - insets.bottom);
        } else {
            toReturn = CGSizeMake(collectionView.frame.size.width - insets.left - insets.right, collectionView.bounds.size.height - insets.top - insets.bottom);
        }
    }
    
    return toReturn;
    
}

//The definition of each UICollectionView margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

//X SPACING
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return collectionView.bounds.size.height;
}

//Y SPACING
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 1.0f;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (![scrollView isKindOfClass:[UICollectionView class]]) return;
    UICollectionView *collectionView = (UICollectionView *)scrollView;
    CGFloat horizontalOffset = scrollView.contentOffset.x;
    NSInteger index = collectionView.tag;
    self.contentOffsetDictionary[[@(index) stringValue]] = @(horizontalOffset);
    
}


-(void) pictureClicked:(UIImage *)image AtInnerRow:(NSInteger)innerCollectionViewRow OuterCollectionViewRow:(NSInteger)outerCollectionViewRow {
    [delegate pictureClicked:image AtInnerRow:innerCollectionViewRow OuterCollectionViewRow:outerCollectionViewRow];
}


@end
