//
//  GDCertificate.h
//  swe
//
//  Created by Peter El Jiz on 2016-01-31.
//  Copyright © 2016 greendrex. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface GDCertificate : MTLModel

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *iconUrl;
@property (nonatomic, copy) NSString *certificateDescription;

@end
