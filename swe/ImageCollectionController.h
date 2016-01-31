//
//  PostsCollectionViewDelegateConcrete.h
//  
//
//  Created by Peter El Jiz on 2015-03-17.
//  Copyright (c) 2015 Peter El Jiz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h> 
#import "ImageViewCellDelegate.h"  

#import "ImageCollectionControllerDelegate.h"


@class ImageViewCell; 


//The Image Collection Controller was separated into its own class for easier ma

@interface ImageCollectionController : NSObject <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, ImageViewCellDelegate>

//@property (strong, nonatomic) NSMutableArray *media;
@property (nonatomic, weak) id<ImageCollectionControllerDelegate> delegate;
@property (nonatomic, strong) NSMutableDictionary *contentOffsetDictionary;
@property (nonatomic, strong) ImageViewCell *offscreenImageCell;

@end
