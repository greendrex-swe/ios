//
//  MapFetchPosts.h
//
//
//  Created by Peter El Jiz on 2014-10-22.
//  Copyright (c) 2015 Peter El Jiz. All rights reserved.
//

#import <Foundation/Foundation.h> 
#import <CoreLocation/CoreLocation.h> 


@protocol MapRelayDelegate <NSObject>

-(void)relayMapDraggedToLocation:(CLLocationCoordinate2D) location WithRadius:(CLLocationDistance) radius;

@end