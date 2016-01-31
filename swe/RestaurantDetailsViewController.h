//
//  RestaurantDetailsViewController.h
//  swe
//
//  Created by Peter El Jiz on 2016-01-31.
//  Copyright © 2016 greendrex. All rights reserved.
//

#import <UIKit/UIKit.h> 
#import "ImageCollectionControllerDelegate.h"

@class ImageCollectionController;

@interface RestaurantDetailsViewController : UIViewController <ImageCollectionControllerDelegate>

@property (strong, nonatomic) ImageCollectionController *imageCollectionViewDsDlg;
@property (weak, nonatomic) IBOutlet UICollectionView *imageCollectionView;

@property (strong, nonatomic) NSArray *media;


@property (nonatomic) UIInterfaceOrientation newOrientation;

@end
