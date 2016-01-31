//
//  RestaurantDetailsViewController.m
//  swe
//
//  Created by Peter El Jiz on 2016-01-31.
//  Copyright © 2016 greendrex. All rights reserved.
//

#import "RestaurantDetailsViewController.h" 
#import "ImageCollectionController.h"

#import "GDLocation.h"
#import "GDCategory.h" 
#import "GDAddress.h" 


#import "MapViewController.h"

@interface RestaurantDetailsViewController ()

@end

@implementation RestaurantDetailsViewController

@synthesize imageCollectionViewDsDlg;
@synthesize imageCollectionView;
@synthesize mapView;
@synthesize mapViewController;

@synthesize categories;

@synthesize newOrientation;



static NSString * const ImageCellIdentifier = @"ImageCell";


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.imageCollectionView registerNib:[UINib nibWithNibName:@"ImageViewCell" bundle:nil] forCellWithReuseIdentifier:ImageCellIdentifier];
    self.imageCollectionView.delaysContentTouches = NO;
    //self.imageCollectionView.backgroundColor = [UIColor clearColor];
    self.imageCollectionView.showsHorizontalScrollIndicator = NO;
    self.imageCollectionViewDsDlg = [[ImageCollectionController alloc] init];
    self.imageCollectionView.delegate = self.imageCollectionViewDsDlg;
    self.imageCollectionView.dataSource = self.imageCollectionViewDsDlg;
    self.imageCollectionViewDsDlg.delegate = self;
    
    
    
    //Mock Data
    GDLocation *restaurant = [[GDLocation alloc] init];
    restaurant.name = @"Chez Peter";
    restaurant.iconUrl = @"https://scontent-yyz1-1.xx.fbcdn.net/hphotos-xlp1/v/t1.0-9/1779688_10153794548280511_1868529904_n.jpg?oh=a7ea967872846ede76cd73d8d2bb5ca0&oe=572523BA";
    restaurant.locationDescription = @"Peter does the best hot dogs";
    
    restaurant.address = [[GDAddress alloc] init];
    restaurant.address.streetNumb = 1000;
    restaurant.address.street = @"St. Antoine";

    restaurant.latitude = 45.5035249;
    restaurant.longitude = -73.5852088;
    
    GDCategory *temp = [[GDCategory alloc] init];
    temp.name = @"Human";
    temp.iconUrl = @"https://scontent-yyz1-1.xx.fbcdn.net/hphotos-xlp1/v/t1.0-9/1779688_10153794548280511_1868529904_n.jpg?oh=a7ea967872846ede76cd73d8d2bb5ca0&oe=572523BA";
    GDCategory *temp2 = [[GDCategory alloc] init];
    temp2.name = @"Inedible";
    temp2.iconUrl = @"https://scontent-yyz1-1.xx.fbcdn.net/hphotos-xlp1/v/t1.0-9/10336672_10156369316605511_5650637481601736014_n.jpg?oh=79da03eeda8220e18e77b45f8515b2c6&oe=572C425B";
    
    restaurant.categories = [[NSArray alloc] initWithObjects:temp, temp2, nil];
    
    
    self.restaurantView.text = restaurant.name;
    self.likesView.text = @"88";
    self.costView.text = @"$$$";
    self.hoursView.text = @"till 20:00";
    self.distanceView.text = @"3km away";
    [self.addressView setTitle:[restaurant.address streetWithNumber] forState: UIControlStateNormal];
    [self.phoneView setTitle:@"514-111-1111" forState: UIControlStateNormal];
    self.categories = restaurant.categories;
    
    
    CLLocation *destination = [[CLLocation alloc] initWithLatitude:restaurant.latitude longitude:restaurant.longitude];
    [self.mapViewController updateMapView:destination];
    [self.mapViewController replaceLocations:[[NSArray alloc] initWithObjects:restaurant, nil]];
    
    
} 


-(void) viewDidLayoutSubviews {
    //CGSize scrollableSize = CGSizeMake(320, self.view.frame.size.height);
    //[self_scroll setContentSize:scrollableSize];
    [super viewDidLayoutSubviews];
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.newOrientation = [[UIApplication sharedApplication] statusBarOrientation];
    //[self.imageCollectionView.collectionViewLayout invalidateLayout];
}

#pragma mark - View Rotation
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    self.newOrientation = toInterfaceOrientation;
    //[self.imageCollectionView.collectionViewLayout invalidateLayout];
}

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    //[self.imageCollectionView.collectionViewLayout invalidateLayout];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


 #pragma mark - Navigation
 
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"MapSegue"])
    {
        self.mapViewController = segue.destinationViewController;
        self.mapViewController.delegate = self;
        
    }
}



#pragma mark - Image Collection Controller Delegate

//This method lets the Image Collection Controller know how many images there are
-(NSInteger) mediaCount: (NSInteger)outerCollectionViewRow {
    return [categories count];
}

//This method returns a Media Array to the Image Collection Controller
-(NSArray *) media: (NSInteger)outerCollectionViewRow {
    return categories;
}

-(void) pictureClicked:(UIImage *)image AtInnerRow:(NSInteger)innerCollectionViewRow OuterCollectionViewRow:(NSInteger)outerCollectionViewRow {
    
}

-(UIInterfaceOrientation) newOrientation {
    return newOrientation;
}



@end
