//
//  ShowMapViewController.h
//
//
//  Created by Peter El Jiz on 2014-10-07.
//  Copyright (c) 2015 Peter El Jiz. All rights reserved.
//

#import <UIKit/UIKit.h> 
#import <MapKit/MapKit.h> 
#import "MapRelayDelegate.h" 

@class MKPointAnnotation;
@class MKPinAnnotationView;
@class CustomPin;

@interface MapViewController : UIViewController <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *map;
@property (strong, nonatomic) NSMutableArray *locations;
@property (weak, nonatomic) id <MapRelayDelegate> delegate;

@property (nonatomic) bool isRotating;



-(void)listenForLocationChanges;
-(void)locationUpdateNotification:(NSNotification *) notification;
-(CLLocationCoordinate2D)getCenterCoordinate;
-(CLLocationCoordinate2D)getTopCenterCoordinate; 
-(CLLocationDistance)getRadius;
-(void)updateMapView:(CLLocation *) location;


-(void) replaceLocations:(NSArray *)newPosts;
-(void)replaceAnnotations;
-(void)addAnnotations:(NSArray *) newPosts;

@end
