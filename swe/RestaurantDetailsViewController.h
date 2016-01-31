//
//  RestaurantDetailsViewController.h
//  swe
//
//  Created by Peter El Jiz on 2016-01-31.
//  Copyright © 2016 greendrex. All rights reserved.
//

#import <UIKit/UIKit.h> 
#import "ImageCollectionControllerDelegate.h" 
#import "MapRelayDelegate.h"

@class ImageCollectionController;
@class MapViewController;

@interface RestaurantDetailsViewController : UIViewController <ImageCollectionControllerDelegate, MapRelayDelegate>

@property (strong, nonatomic) ImageCollectionController *imageCollectionViewDsDlg;
@property (weak, nonatomic) IBOutlet UICollectionView *imageCollectionView;

@property (weak, nonatomic) IBOutlet UIView *mapView;
@property (weak, nonatomic) MapViewController *mapViewController;


@property (weak, nonatomic) IBOutlet UILabel *restaurantView;
@property (weak, nonatomic) IBOutlet UIButton *heartButton;
@property (weak, nonatomic) IBOutlet UILabel *likesView;
@property (weak, nonatomic) IBOutlet UILabel *costView;
@property (weak, nonatomic) IBOutlet UILabel *hoursTodayView;
@property (weak, nonatomic) IBOutlet UILabel *hoursView;
@property (weak, nonatomic) IBOutlet UILabel *distanceView;

@property (weak, nonatomic) IBOutlet UIButton *fwdAddressButton;
@property (weak, nonatomic) IBOutlet UIButton *addressView;

@property (weak, nonatomic) IBOutlet UIButton *phoneButton;
@property (weak, nonatomic) IBOutlet UIButton *phoneView;

@property (strong, nonatomic) NSArray *categories;
@property (nonatomic) UIInterfaceOrientation newOrientation;

@end
