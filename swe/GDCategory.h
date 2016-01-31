//
//  Category.h
//  swe
//
//  Created by Peter El Jiz on 2016-01-30.
//  Copyright © 2016 greendrex. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface GDCategory : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy, readonly) NSString *ctgId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *iconUrl;
@property (nonatomic, copy) NSString *ctgDescription;
@property (nonatomic) float maximumRating; //0 to 10
@property (nonatomic) float rating;
@property (nonatomic, copy) NSDate *lastEvaluation;

@end
