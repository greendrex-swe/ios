//
//  RestaurantItemViewCell.m
//  swe
//
//  Created by Peter El Jiz on 2016-01-30.
//  Copyright © 2016 greendrex. All rights reserved.
//

#import "CertificateItemViewCell.h"
#import "GDLocation.h" 
#import "GDAddress.h"

#import <UIImageView+WebCache.h>
#import "UIImageView+WebRotationFixed.h"
#import "UIImage+OrientationFix.h"


@implementation CertificateItemViewCell

@synthesize certificateImage;
@synthesize name;
@synthesize certificateDescription;


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
    self = [[[NSBundle mainBundle] loadNibNamed:@"CertificateItemViewCell" owner:self options:nil] objectAtIndex:0];
    
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
    self.name.text = location.name;
    self.certificateDescription.text = [location.address streetWithNumber];
    
    @autoreleasepool {
        
        __weak CertificateItemViewCell *self_ = self;
        SDWebImageCompletionBlock imageRetrievedCompletion = ^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            
            image = [image normalizedImage];
        };
        [self.certificateImage sd_setImageWithRotationFixedWithURL:[NSURL URLWithString:location.iconUrl] placeholderImage:[[UIImage imageNamed:@"person.png"] scaledToSize:CGSizeMake(64, 64)] completed:imageRetrievedCompletion];
        
    }
    
}

-(void) tapPic {
    
}


@end
