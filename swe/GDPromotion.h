//
//  Promotion.h
//  swe
//
//  Created by Peter El Jiz on 2016-01-30.
//  Copyright © 2016 greendrex. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface GDPromotion : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy, readonly) NSString *promoId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *promoDescription;
@property (nonatomic, copy) NSDate *validFrom;
@property (nonatomic, copy) NSDate *validUntil;

@end
