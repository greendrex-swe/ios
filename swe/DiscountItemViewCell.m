//
//  DiscountItemViewCell.m
//  swe
//
//  Created by Peter El Jiz on 2016-01-31.
//  Copyright © 2016 greendrex. All rights reserved.
//

#import "DiscountItemViewCell.h" 
#import "GDLocation.h"
#import "GDAddress.h"

#import <UIImageView+WebCache.h>
#import "UIImageView+WebRotationFixed.h"
#import "UIImage+OrientationFix.h"

@implementation DiscountItemViewCell

@synthesize redeemDate;
@synthesize discountPercentage;

- (void)awakeFromNib {
    // Initialization code
    [self setBackgroundColor:[UIColor whiteColor]];
    
    
    /*
     self.viewTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapPic:)];
     self.viewTapGesture.cancelsTouchesInView = NO;
     [self.viewTapGesture setDelegate:self];
     [self addGestureRecognizer:self.viewTapGesture];
     */
    
    
    //self.isLiking = NO;
    
}

/*
 If controller manually initializes using:
 [self.collectionView registerClass:[CustomPostViewCell class forCellWithReuseIdentifier:PostCellIdentifier]
 and ignores the nib file
 */



-(id)initWithFrame:(CGRect)frame {
    
    // From IB
    self = [[[NSBundle mainBundle] loadNibNamed:@"DiscountItemViewCell" owner:self options:nil] objectAtIndex:0];
    
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
    self.discountPercentage.text = [location.address streetWithNumber];
    self.redeemDate.text = location.name;
}

-(void) tapPic {
    
}




@end
