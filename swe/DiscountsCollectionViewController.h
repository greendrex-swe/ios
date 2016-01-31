//
//  RestaurantsCollectionViewController.h
//  swe
//
//  Created by Peter El Jiz on 2016-01-30.
//  Copyright © 2016 greendrex. All rights reserved.
//

#import <UIKit/UIKit.h> 

@class DiscountItemViewCell;

@interface DiscountsCollectionViewController : UICollectionViewController <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UISearchBarDelegate>

@property (strong, nonatomic) DiscountItemViewCell *offscreenDiscountItemCell;
@property (strong, nonatomic) NSArray *discounts;

@property (nonatomic) float width;
@property (nonatomic) float height;

@property (nonatomic) UIInterfaceOrientation newOrientation;


@end
