//
//  ImagePostViewCellDelegate.h
//
//
//  Created by Peter El Jiz on 2015-05-05.
//  Copyright (c) 2015 Peter El Jiz. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ImageCollectionControllerDelegate <NSObject>

-(NSInteger) mediaCount: (NSInteger)outerCollectionViewRow;
-(NSArray *) media: (NSInteger)outerCollectionViewRow;
-(void) pictureClicked:(UIImage *)image AtInnerRow:(NSInteger)innerCollectionViewRow OuterCollectionViewRow:(NSInteger)outerCollectionViewRow;
-(UIInterfaceOrientation) newOrientation;
-(float) collectionViewWidth;

@end
