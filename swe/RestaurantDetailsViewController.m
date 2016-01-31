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
    GDLocation *temp1 = [[GDLocation alloc] init];
    temp1.name = @"Candide";
    temp1.latitude = 45.4890888;
    temp1.longitude = -73.5716044;
    temp1.locationDescription = @"Vous aimez la cuisine créative et l’art de surprendre avec des produits habituellement soporifiques. Dans leur cuisine ouverte autant qu’une cuisine peut l’être, le chef John Winter Russell et ses amis aux fourneaux, Marina De Figueiredo et Bryan Sham, concoctent des assiettes étonnantes. Ils travaillent le « local » avec une conscience certaine et font affaire avec des gens que tout le monde devrait aimer, Gaspésie Sauvage, Société Orignal et autres." ;
    GDAddress *temp1Addr = [[GDAddress alloc] init];
    temp1Addr.streetNumb = 551;
    temp1Addr.street = @"Rue Saint Martin";
    temp1.iconUrl = @"http://tastet.ca/wp-content/uploads/2015/12/restaurant-candide-griffintown-petite-bourgogne-332.jpg";
    temp1.address = temp1Addr;
    

    GDCategory *fairTrade = [[GDCategory alloc] init];
    fairTrade.name = @"Fair Trade";
    fairTrade.iconUrl = @"data:image/png;base64,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";
    
    GDCategory *local = [[GDCategory alloc] init];
    local.name = @"Local";
    local.iconUrl = @"data:image/png;base64,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";

    
    
    temp1.categories = [[NSArray alloc] initWithObjects:fairTrade, local, nil];
    
    
    self.restaurantView.text = temp1.name;
    self.likesView.text = @"88";
    self.costView.text = @"$$$";
    self.hoursView.text = @"till 20:00";
    self.distanceView.text = @"3km away";
    [self.addressView setTitle:[temp1.address streetWithNumber] forState: UIControlStateNormal];
    [self.phoneView setTitle:@"514-111-1111" forState: UIControlStateNormal];
    self.categories = temp1.categories;
    
    
    CLLocation *destination = [[CLLocation alloc] initWithLatitude:temp1.latitude longitude:temp1.longitude];
    [self.mapViewController updateMapView:destination];
    [self.mapViewController replaceLocations:[[NSArray alloc] initWithObjects:temp1, nil]];
    
    
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
