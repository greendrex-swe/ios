//
//  RestaurantsCollectionViewController.m
//  swe
//
//  Created by Peter El Jiz on 2016-01-30.
//  Copyright © 2016 greendrex. All rights reserved.
//

#import "CertificatesCollectionViewController.h"
#import "CertificateItemViewCell.h"

#import "GDLocation.h"
#import "GDAddress.h" 

@interface CertificatesCollectionViewController ()

@end

@implementation CertificatesCollectionViewController

@synthesize offscreenCertificateItemCell;

@synthesize certificates;

@synthesize width;
@synthesize height;

@synthesize newOrientation;


//static NSString * const reuseIdentifier = @"Cell";
static NSString * const certificateItemCellIdentifier = @"CertificateItemViewCell";


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register nib
    [self.collectionView registerNib:[UINib nibWithNibName:@"CertificateItemViewCell" bundle:nil] forCellWithReuseIdentifier:certificateItemCellIdentifier];
    
    // Do any additional setup after loading the view.
    self.collectionView.delaysContentTouches = NO;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    
    
    offscreenCertificateItemCell = [[CertificateItemViewCell alloc] init];
    self.width = self.collectionView.bounds.size.width;
    self.height = self.collectionView.bounds.size.height;
    
    
    
    
    
    //Mock Model
    GDLocation *temp1 = [[GDLocation alloc] init];
    temp1.name = @"B Corp";
    GDAddress *temp1Addr = [[GDAddress alloc] init];
    temp1Addr.streetNumb = 100;
    temp1Addr.street = @"% reliable. This company has shown it's dedication to sustainability by allowing registered CCA engineers to conduct and appraisal at their establishment.";
    temp1.iconUrl = @"https://code.org/images/hour_of_code_certificate.jpg";
    temp1.address = temp1Addr;
    

    self.certificates = [[NSArray alloc] initWithObjects:temp1, nil];
    
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

#pragma mark <UICollectionViewDataSource>
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.certificates count];
}






- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    GDLocation *location = self.certificates[indexPath.row];
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:certificateItemCellIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    CertificateItemViewCell *castedCell = (CertificateItemViewCell *) cell;
    [castedCell loadLocation:self.certificates[indexPath.row]];
    
    return cell;
}



//The definition of each UICollectionView margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

//X SPACING
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return self.collectionView.bounds.size.width;
}

//Y SPACING
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    
    /*
     if (UIInterfaceOrientationIsLandscape(self.newOrientation)) {
     return 10.0f;
     } else {
     return 10.0f;
     }
     */
    
    return 2.0f;
    
}








#pragma mark --UICollectionViewDelegateFlowLayout
//The size of each item
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    UIEdgeInsets insets = [self collectionView:collectionView layout:collectionViewLayout insetForSectionAtIndex:indexPath.section];
    
    CGSize toReturn; // = CGSizeMake(0, 0);
    
    
    GDLocation *location = self.certificates[indexPath.row];
    
    /*
    UILabel *tempMessageLabel = [[UILabel alloc] init];
    tempMessageLabel.font =  [UIFont systemFontOfSize:14.0f];
    tempMessageLabel.numberOfLines = 0;
    tempMessageLabel.lineBreakMode = NSLineBreakByWordWrapping;
    
    
    //Cell has a specific width (that gets changed depending on the device used, so we need the right width
    //To calculate the extra % scaled
    float extraScalePercentage;
    float messageLabelWidth;
    
    
    tempMessageLabel.bounds = CGRectMake(0, 0, messageLabelWidth, 0);
    tempMessageLabel.frame = CGRectMake(0, 0, messageLabelWidth, 0);
    tempMessageLabel.text = location.name;

    CGRect tempMessageLabelBounds = tempMessageLabel.bounds;
    tempMessageLabelBounds.size.height = CGFLOAT_MAX;
    CGRect minimumTextRect = [tempMessageLabel textRectForBounds:tempMessageLabelBounds limitedToNumberOfLines:0];
    CGFloat tempLabelHeightDelta = minimumTextRect.size.height - tempMessageLabel.frame.size.height;
    
    
    CGFloat finalCellHeight;
    finalCellHeight = self.offscreenRestaurantItemCell.frame.size.height;
    finalCellHeight += tempLabelHeightDelta;
    
    finalCellHeight += - insets.top - insets.bottom;
     
     toReturn = CGSizeMake(self.collectionView.bounds.size.width - insets.left - insets.right, finalCellHeight);

    */
    
    
    toReturn = CGSizeMake(self.collectionView.frame.size.width - insets.left - insets.right, self.offscreenCertificateItemCell.frame.size.height);
    //toReturn = CGSizeMake(self.offscreenCertificateItemCell.frame.size.height, 10);
    
    return toReturn;
    
}


- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor grayColor];
}

- (void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor whiteColor];
}


#pragma mark LongPressGesture - Options - Delete

//Gesture Recognizer - Override to YES so that swipes are recognized as well as scrolls //avoids blocking UIScrollViews Pan recognizer
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}



-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.newOrientation = [[UIApplication sharedApplication] statusBarOrientation];
    [self.collectionViewLayout invalidateLayout];
}

-(void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.collectionViewLayout invalidateLayout];
}

#pragma mark - View Rotation
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    self.newOrientation = toInterfaceOrientation;
    [self.collectionViewLayout invalidateLayout];
}

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    [self.collectionViewLayout invalidateLayout];
}

@end












