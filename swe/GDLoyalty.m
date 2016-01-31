//
//  GDLoyalty.m
//  swe
//
//  Created by Peter El Jiz on 2016-01-30.
//  Copyright © 2016 greendrex. All rights reserved.
//

#import "GDLoyalty.h"

@implementation GDLoyalty

@synthesize userEstablishmentLoyaltyId;
@synthesize currentLoyaltyLevelId;
@synthesize currentLoyaltyLevelName;
@synthesize currentLoyaltyLevelDescription;
@synthesize nextGoalId;
@synthesize nextGoalName;

+ (NSDictionary*)JSONKeyPathsByPropertyKey {
    return @{
             @"userEstablishmentLoyaltyId": @"userEstablishmentLoyaltyId",
             @"currentLoyaltyLevelId": @"currentLoyaltyLevelId",
             @"currentLoyaltyLevelName": @"currentLoyaltyLevelName",
             @"currentLoyaltyLevelDescription": @"currentLoyaltyLevelDescription",
             @"nextGoalId": @"nextGoalId",
             @"nextGoalName": @"nextGoalName"
             };
}

@end
