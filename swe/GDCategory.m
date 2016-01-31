//
//  Category.m
//  swe
//
//  Created by Peter El Jiz on 2016-01-30.
//  Copyright © 2016 greendrex. All rights reserved.
//

#import "GDCategory.h"

@implementation GDCategory

@synthesize ctgId;
@synthesize name;
@synthesize iconUrl;
@synthesize ctgDescription;
@synthesize maximumRating;
@synthesize rating;
@synthesize lastEvaluation;


+ (NSDictionary*)JSONKeyPathsByPropertyKey {
    return @{
             @"ctgId": @"ctgId",
             @"name": @"name",
             @"iconUrl": @"iconUrl",
             @"ctgDescription": @"ctgDescription",
             @"maximumRating": @"maximumRating",
             @"rating": @"rating",
             @"lastEvaluation": @"lastEvaluation"
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
+ (NSValueTransformer *)lastEvaluationJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSString *str) {
        return [self.dateFormatter dateFromString:str];
    } reverseBlock:^(NSDate *date) {
        return [self.dateFormatter stringFromDate:date];
    }];
}

@end
