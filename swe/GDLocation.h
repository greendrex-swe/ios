//
//  Location.h
//  swe
//
//  Created by Peter El Jiz on 2016-01-30.
//  Copyright © 2016 greendrex. All rights reserved.
//

#import <Mantle/Mantle.h>

@class GDAddress;

@interface GDLocation : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy, readonly) NSString *lid;
@property (nonatomic, copy) NSString *iconUrl;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *locationDescription;
@property (nonatomic, copy) NSArray *categories; //NSArray = immutable
@property (nonatomic, copy) NSArray *certificates; //NSArray = immutable

@property (nonatomic, copy) GDAddress *address;
@property (nonatomic) double latitude;
@property (nonatomic) double longitude;


@end
