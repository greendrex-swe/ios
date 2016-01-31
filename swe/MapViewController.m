//
//  ShowMapViewController.m
//
//
//  Created by Peter El Jiz on 2014-10-07.
//  Copyright (c) 2015 Peter El Jiz. All rights reserved.
//

#import "MapViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "AppDelegate.h"
#import <MapKit/MapKit.h>

#import "MKMapView+ZoomLevel.h" 

#import "GDLocation.h"

/*
#define GEORGIA_TECH_LATITUDE 33.777328
#define GEORGIA_TECH_LONGITUDE -84.397348
*/

#define ZOOM_LEVEL 14


@interface MapViewController ()

@end

@implementation MapViewController

@synthesize delegate;
@synthesize isRotating;


- (void)viewDidLoad {
    [super viewDidLoad];

    self.locations = [[NSMutableArray alloc] init];
    
    self.isRotating = false;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)updateMapView:(CLLocation *)location {
    CLLocationCoordinate2D location2D;
    location2D.latitude = location.coordinate.latitude;
    location2D.longitude = location.coordinate.longitude;
    [self.map setCenterCoordinate:location2D zoomLevel:13 animated:YES];
    
}

-(void)setMapAnnotations:(NSMutableArray *)mapAnnotations {
    [self.map removeAnnotations:self.map.annotations];
    [self.map addAnnotations:mapAnnotations];
}

-(void)setMapAnnotation:(id <MKAnnotation>) mapAnnotation {
    [self.map addAnnotation:mapAnnotation];
}


-(CLLocationCoordinate2D)getCenterCoordinate
{
    CLLocationCoordinate2D centerCoor = [self.map centerCoordinate];
    return centerCoor;
}

-(CLLocationCoordinate2D)getTopCenterCoordinate
{
    // to get coordinate from CGPoint of your map
    CLLocationCoordinate2D topCenterCoor = [self.map convertPoint:CGPointMake(self.map.frame.size.width / 2.0f, 0) toCoordinateFromView:self.map];
    return topCenterCoor;
}

-(CLLocationDistance)getRadius
{
    CLLocationCoordinate2D centerCoor = [self getCenterCoordinate];
    // init center location from center coordinate
    CLLocation *centerLocation = [[CLLocation alloc] initWithLatitude:centerCoor.latitude longitude:centerCoor.longitude];
    
    CLLocationCoordinate2D topCenterCoor = [self getTopCenterCoordinate];
    CLLocation *topCenterLocation = [[CLLocation alloc] initWithLatitude:topCenterCoor.latitude longitude:topCenterCoor.longitude];
    
    CLLocationDistance radius = [centerLocation distanceFromLocation:topCenterLocation];
    
    return radius/1000;
}

//set delegate to when map item is clicked!



-(void) replaceLocations:(NSArray *)newPosts {
    [self.locations removeAllObjects];
    [self.locations addObjectsFromArray:newPosts];
    [self replaceAnnotations];
}


-(void)replaceAnnotations {
    
    [self.map removeAnnotations:self.map.annotations];
    
    // a few variables to be used as we iterate through the array of results
    CLLocationCoordinate2D location;                         // coordinates of the annotation
    NSMutableArray *newAnnotations = [NSMutableArray array]; // an array in which we'll save our annotations temporarily
    MKPointAnnotation *newAnnotation;                        // the pointer to the annotation we're adding
    
    // iterate through the array, adding an annotation to our our array of new annotations
    //NSLog(@"Count: %d", [self.posts count]);
    
#pragma mark - onfokh
    
    for (GDLocation *l in self.locations)
    {
        
        // retrieve latitude and longitude from the post entry
        location.latitude = l.latitude;
        location.longitude = l.longitude;
        
        // create the annotation
        
        newAnnotation = [[MKPointAnnotation alloc] init];
        //newAnnotation.title = post.message;
        newAnnotation.coordinate = location;
        
        // add it to our array
        //
        // incidentally, generally I just add it to the mapview directly, but
        // given that you have a didAddAnnotationViews, we'll just build up
        // an array and add them all to the map view in one step after we're
        // done iterating through the JSON results
        
        [newAnnotations addObject:newAnnotation];
    }
    
    // when done, add the annotations
    [self.map addAnnotations:newAnnotations];
    
}


#pragma mark - View Rotation
#pragma mark - iOS 7
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    isRotating = YES;
}

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    isRotating = NO;
}




@end
