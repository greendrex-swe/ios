//
//  DiscountItemViewCell.h
//  swe
//
//  Created by Peter El Jiz on 2016-01-31.
//  Copyright © 2016 greendrex. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GDLocation;

@interface DiscountItemViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *discountPercentage;
@property (weak, nonatomic) IBOutlet UILabel *redeemDate;

-(void) loadLocation:(GDLocation *) location;
-(void) tapPic;

@end
