//
//  Address.h
//  swe
//
//  Created by Peter El Jiz on 2016-01-30.
//  Copyright © 2016 greendrex. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface GDAddress : MTLModel <MTLJSONSerializing>

@property (nonatomic) int streetNumb;
@property (nonatomic, copy) NSString *street;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *province;
@property (nonatomic, copy) NSString *postalCode;
@property (nonatomic, copy) NSString *country;

-(NSString *) streetWithNumber;

@end
