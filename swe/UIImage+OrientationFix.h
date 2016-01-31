//
//  UIImage+OrientationFix.h
//
//
//  Created by Peter El Jiz on 2015-05-15.
//  Copyright (c) 2015 Peter El Jiz All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (OrientationFix)

- (UIImage *)normalizedImage;
- (UIImage *)scaledToSize:(CGSize)newSize;

@end
