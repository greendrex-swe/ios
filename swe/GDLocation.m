//
//  Location.m
//  swe
//
//  Created by Peter El Jiz on 2016-01-30.
//  Copyright © 2016 greendrex. All rights reserved.
//

#import "GDLocation.h"

@implementation GDLocation

@synthesize lid;
@synthesize name;
@synthesize locationDescription;
@synthesize categories; //might need adapter/transformer
@synthesize certificates; //might need adapter/transformer
@synthesize address; //might need adapter/transformer
@synthesize  latitude;
@synthesize  longitude;

+ (NSDictionary*)JSONKeyPathsByPropertyKey {
    return @{
             @"lid": @"lid",
             @"iconUrl": @"iconUrl",
             @"name": @"name",
             @"locationDescription": @"locationDescription",
             @"categories": @"categories",
             @"certificates": @"certificates",
             @"address": @"address",
             @"latitude": @"latitude",
             @"longitude": @"longitude"
             };
}

@end
