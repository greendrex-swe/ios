//
//  GDLoyalty.h
//  swe
//
//  Created by Peter El Jiz on 2016-01-30.
//  Copyright © 2016 greendrex. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface GDLoyalty : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy, readonly) NSString *userEstablishmentLoyaltyId;
@property (nonatomic, copy, readonly) NSString *currentLoyaltyLevelId;

@property (nonatomic, copy) NSString *currentLoyaltyLevelName;
@property (nonatomic, copy) NSString *currentLoyaltyLevelDescription;
@property (nonatomic, copy, readonly) NSString *nextGoalId;
@property (nonatomic, copy) NSString *nextGoalName;

@end
