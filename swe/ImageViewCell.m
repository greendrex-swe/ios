//
//  ImageViewCell.m
//  
//
//  Created by Peter El Jiz on 2015-03-16.
//  Copyright (c) 2015 Peter El Jiz. All rights reserved.
//

#import "ImageViewCell.h" 
#import "GDCategory.h" 

#import <UIImageView+WebCache.h>
#import "UIImageView+WebRotationFixed.h"
#import "UIImage+OrientationFix.h"

@implementation ImageViewCell

@synthesize delegate;
@synthesize innerRow;
@synthesize outerRow;
@synthesize imageView;
@synthesize imageTapGesture;


/*
 If controller initializes (with nib/from nib) using:
 [self.collectionView registerNib:[UINib nibWithNibName:@"CustomPostViewCell" bundle:nil] forCellWithReuseIdentifier:PostCellIdentifier]
 */
- (void)awakeFromNib {
    // Initialization code
    [self setBackgroundColor:[UIColor whiteColor]];
    
    self.imageTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapPic:)];
    [self.imageTapGesture setDelegate:self];
    [self.imageView addGestureRecognizer:self.imageTapGesture];

}

/*
 If controller manually initializes using:
 [self.collectionView registerClass:[CustomPostViewCell class forCellWithReuseIdentifier:PostCellIdentifier]
 and ignores the nib file
 */


-(id)initWithFrame:(CGRect)frame {
    
    //NSArray *elements = [[NSBundle mainBundle] loadNibNamed:@"CustomPostViewCell" owner:self options:nil];
    //NSLog(@"%@", elements);
    // From IB
    self = [[[NSBundle mainBundle] loadNibNamed:@"ImageViewCell" owner:self options:nil] objectAtIndex:0];
    
    //Then Manual
    if (!self) {
        self = [super initWithFrame:frame];
        //any extra manual initialization
    }
    
    if (self) {
        
        self.imageTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapPic:)];
        [self.imageTapGesture setDelegate:self];
        [self.imageView addGestureRecognizer:self.imageTapGesture];
        
    }
    
    return self;
}

-(void)loadCategory:(GDCategory *) category {
    if (category != nil) {
        if (category.iconUrl != nil) {
            @autoreleasepool {
                
                
                SDWebImageCompletionBlock imageRetrievedCompletion = ^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                    
                    image = [image normalizedImage];
                };
                
                [self.imageView sd_setImageWithRotationFixedWithURL:[NSURL URLWithString:category.iconUrl] completed:imageRetrievedCompletion];
            }
        }
        
        self.category.text = category.name;
        
    }
}

- (void)tapPic:(id)sender {
    //[delegate likeClicked:self.row success:self.toggleLikeSuccess];
    [delegate pictureClicked:self.imageView.image AtInnerRow:innerRow OuterCollectionViewRow:outerRow];
}

@end
