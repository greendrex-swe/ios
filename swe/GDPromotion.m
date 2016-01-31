//
//  Promotion.m
//  swe
//
//  Created by Peter El Jiz on 2016-01-30.
//  Copyright © 2016 greendrex. All rights reserved.
//

#import "GDPromotion.h"

@implementation GDPromotion

@synthesize promoId;
@synthesize name;
@synthesize promoDescription;
@synthesize validFrom;
@synthesize validUntil;


+ (NSDictionary*)JSONKeyPathsByPropertyKey {
    return @{
             @"promoId": @"promoId",
             @"name": @"name",
             @"promoDescription": @"promoDescription",
             @"validFrom": @"validFrom",
             @"validUntil": @"validUntil"
             };
}

+ (NSDateFormatter*)dateFormatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ"; //@"yyyy-MM-dd";
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
    return dateFormatter;
}

//The template to create a transformer for a property is as follows:
//(NSValueTransformer*)propertyNameTransformer;
+ (NSValueTransformer *)validFromJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSString *str) {
        return [self.dateFormatter dateFromString:str];
    } reverseBlock:^(NSDate *date) {
        return [self.dateFormatter stringFromDate:date];
    }];
}

+ (NSValueTransformer *)validUntilJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSString *str) {
        return [self.dateFormatter dateFromString:str];
    } reverseBlock:^(NSDate *date) {
        return [self.dateFormatter stringFromDate:date];
    }];
}

@end
