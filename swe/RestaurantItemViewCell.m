//
//  RestaurantItemViewCell.m
//  swe
//
//  Created by Peter El Jiz on 2016-01-30.
//  Copyright © 2016 greendrex. All rights reserved.
//

#import "RestaurantItemViewCell.h" 
#import "GDLocation.h" 
#import "GDAddress.h"

#import <UIImageView+WebCache.h>
#import "UIImageView+WebRotationFixed.h"
#import "UIImage+OrientationFix.h"


@implementation RestaurantItemViewCell

@synthesize restaurantImage;
@synthesize restaurant;
@synthesize address;


- (void)awakeFromNib {
    // Initialization code
    [self setBackgroundColor:[UIColor whiteColor]];
    
    
    /*
    self.viewTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapPic:)];
    self.viewTapGesture.cancelsTouchesInView = NO;
    [self.viewTapGesture setDelegate:self];
    [self addGestureRecognizer:self.viewTapGesture];
    */
    
    self.restaurantImageTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapPic:)];
    self.restaurantImageTapGesture.cancelsTouchesInView = NO;
    [self.restaurantImageTapGesture setDelegate:self];
    [self.restaurantImage addGestureRecognizer:self.restaurantImageTapGesture];
    
    
    
    //self.isLiking = NO;
    
}

/*
 If controller manually initializes using:
 [self.collectionView registerClass:[CustomPostViewCell class forCellWithReuseIdentifier:PostCellIdentifier]
 and ignores the nib file
 */



-(id)initWithFrame:(CGRect)frame {
    
    // From IB
    self = [[[NSBundle mainBundle] loadNibNamed:@"RestaurantItemViewCell" owner:self options:nil] objectAtIndex:0];
    
    //Then Manual
    if (!self) {
        self = [super initWithFrame:frame];
        //any extra manual initialization
    }
    
    if (self) {
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    
    return self;
}


-(void) loadLocation:(GDLocation *) location {
    self.restaurant.text = location.name;
    self.address.text = [location.address streetWithNumber];
    
    @autoreleasepool {
        
        __weak RestaurantItemViewCell *self_ = self;
        SDWebImageCompletionBlock imageRetrievedCompletion = ^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            
            image = [image normalizedImage];
        };
        [self.restaurantImage sd_setImageWithRotationFixedWithURL:[NSURL URLWithString:location.iconUrl] placeholderImage:[[UIImage imageNamed:@"person.png"] scaledToSize:CGSizeMake(64, 64)] completed:imageRetrievedCompletion];
        
    }
    
}

-(void) tapPic {
    
}


@end
