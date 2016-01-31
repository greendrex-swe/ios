//
//  RestaurantItemViewCell.h
//  swe
//
//  Created by Peter El Jiz on 2016-01-30.
//  Copyright © 2016 greendrex. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GDLocation;

@interface RestaurantItemViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *restaurantImage;
@property (weak, nonatomic) IBOutlet UILabel *restaurant;
@property (weak, nonatomic) IBOutlet UILabel *address;


@property (strong, nonatomic) UITapGestureRecognizer *restaurantImageTapGesture;
@property (strong, nonatomic) UITapGestureRecognizer *viewTapGesture;

-(void) loadLocation:(GDLocation *) location;
-(void) tapPic;

@end
