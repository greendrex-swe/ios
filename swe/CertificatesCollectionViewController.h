//
//  RestaurantsCollectionViewController.h
//  swe
//
//  Created by Peter El Jiz on 2016-01-30.
//  Copyright © 2016 greendrex. All rights reserved.
//

#import <UIKit/UIKit.h> 

@class CertificateItemViewCell;

@interface CertificatesCollectionViewController : UICollectionViewController <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) CertificateItemViewCell *offscreenCertificateItemCell;
@property (strong, nonatomic) NSArray *certificates;

@property (nonatomic) float width;
@property (nonatomic) float height;

@property (nonatomic) UIInterfaceOrientation newOrientation;


@end
