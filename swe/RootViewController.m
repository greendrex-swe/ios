//
//  RootViewController.m
//  swe
//
//  Created by Peter El Jiz on 2016-01-30.
//  Copyright © 2016 greendrex. All rights reserved.
//

#import "RootViewController.h" 
#import "ImageCollectionController.h" 

#import "GDCategory.h"

@interface RootViewController ()

@end

@implementation RootViewController

@synthesize imageCollectionViewDsDlg;
@synthesize imageCollectionView;

@synthesize media;

@synthesize newOrientation;


static NSString * const ImageCellIdentifier = @"ImageCell";


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self.imageCollectionView registerNib:[UINib nibWithNibName:@"ImageViewCell" bundle:nil] forCellWithReuseIdentifier:ImageCellIdentifier];
    //self.imageCollectionView.backgroundColor = [UIColor clearColor];
    self.imageCollectionView.delaysContentTouches = NO;
    self.imageCollectionView.showsHorizontalScrollIndicator = NO;
    self.imageCollectionViewDsDlg = [[ImageCollectionController alloc] init];
    self.imageCollectionView.delegate = self.imageCollectionViewDsDlg;
    self.imageCollectionView.dataSource = self.imageCollectionViewDsDlg;
    self.imageCollectionViewDsDlg.delegate = self;
    
    GDCategory *temp = [[GDCategory alloc] init];
    temp.name = @"Human";
    temp.iconUrl = @"https://scontent-yyz1-1.xx.fbcdn.net/hphotos-xlp1/v/t1.0-9/1779688_10153794548280511_1868529904_n.jpg?oh=a7ea967872846ede76cd73d8d2bb5ca0&oe=572523BA";
    
    GDCategory *temp2 = [[GDCategory alloc] init];
    temp2.name = @"Inedible";
    temp2.iconUrl = @"https://scontent-yyz1-1.xx.fbcdn.net/hphotos-xlp1/v/t1.0-9/10336672_10156369316605511_5650637481601736014_n.jpg?oh=79da03eeda8220e18e77b45f8515b2c6&oe=572C425B";
    
    self.media = [[NSArray alloc] initWithObjects:temp, temp2, nil];
    
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



#pragma mark - Image Collection Controller Delegate 

//This method lets the Image Collection Controller know how many images there are
-(NSInteger) mediaCount: (NSInteger)outerCollectionViewRow {
    return [media count];
}

//This method returns a Media Array to the Image Collection Controller
-(NSArray *) media: (NSInteger)outerCollectionViewRow {
    return media;
}

-(void) pictureClicked:(UIImage *)image AtInnerRow:(NSInteger)innerCollectionViewRow OuterCollectionViewRow:(NSInteger)outerCollectionViewRow {
    
}

-(UIInterfaceOrientation) newOrientation {
    return newOrientation;
}

@end
