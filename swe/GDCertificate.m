//
//  GDCertificate.m
//  swe
//
//  Created by Peter El Jiz on 2016-01-31.
//  Copyright © 2016 greendrex. All rights reserved.
//

#import "GDCertificate.h"

@implementation GDCertificate

@synthesize name;
@synthesize iconUrl;
@synthesize certificateDescription;

+ (NSDictionary*)JSONKeyPathsByPropertyKey {
    return @{
             @"name": @"name",
             @"iconUrl": @"iconUrl",
             @"certificateDescription": @"certificateDescription"
             };
}

@end
