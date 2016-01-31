//
//  Address.m
//  swe
//
//  Created by Peter El Jiz on 2016-01-30.
//  Copyright © 2016 greendrex. All rights reserved.
//

#import "GDAddress.h"

@implementation GDAddress

@synthesize streetNumb;
@synthesize street;
@synthesize city;
@synthesize province;
@synthesize postalCode;
@synthesize country;


+ (NSDictionary*)JSONKeyPathsByPropertyKey {
    return @{
             @"streetNumb": @"streetNumb",
               @"street": @"street",
               @"city": @"city",
               @"province": @"province",
               @"postalCode": @"postalCode",
               @"country": @"country"
               };
}

-(NSString *) streetWithNumber {
    return [NSString stringWithFormat:@"%d %@", streetNumb, street];
}

@end
