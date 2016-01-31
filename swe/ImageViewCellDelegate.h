//
//  PostViewCellDelegate.h
//
//
//  Created by Peter El Jiz on 2014-10-13.
//  Copyright (c) 2015 Peter El Jiz All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "CustomPostViewCell.h" 

//@class CustomPostViewCell;

@class GDCategory;

@protocol ImageViewCellDelegate <NSObject>   //define delegate protocol

-(void) pictureClicked:(UIImage *)image AtInnerRow:(NSInteger)innerCollectionViewRow OuterCollectionViewRow:(NSInteger)outerCollectionViewRow;

@end