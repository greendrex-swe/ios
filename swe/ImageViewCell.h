//
//  ImageViewCell.h
//  
//
//  Created by Peter El Jiz on 2015-03-16.
//  Copyright (c) 2015 Peter El Jiz. All rights reserved.
//

#import <UIKit/UIKit.h> 
#import "ImageViewCellDelegate.h" 

@class GDCategory;

@interface ImageViewCell : UICollectionViewCell <UIGestureRecognizerDelegate>


@property (nonatomic, weak) id<ImageViewCellDelegate> delegate;
@property (nonatomic) NSInteger innerRow;
@property (nonatomic) NSInteger outerRow;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) UITapGestureRecognizer *imageTapGesture;

@property (weak, nonatomic) IBOutlet UILabel *category;

- (void)tapPic:(id)sender;
-(void)loadCategory:(GDCategory *) category;

@end
