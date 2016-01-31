//
//  RestaurantsCollectionViewController.m
//  swe
//
//  Created by Peter El Jiz on 2016-01-30.
//  Copyright © 2016 greendrex. All rights reserved.
//

#import "RestaurantsCollectionViewController.h"
#import "RestaurantItemViewCell.h"

#import "GDLocation.h"
#import "GDAddress.h" 
#import "GDCategory.h"

#import "RestaurantDetailsViewController.h" 


@interface RestaurantsCollectionViewController ()

@end

@implementation RestaurantsCollectionViewController

@synthesize offscreenRestaurantItemCell;

@synthesize restaurants;

@synthesize width;
@synthesize height;

@synthesize newOrientation;


//static NSString * const reuseIdentifier = @"Cell";
static NSString * const restaurantItemCellIdentifier = @"RestaurantItemViewCell";


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register nib
    [self.collectionView registerNib:[UINib nibWithNibName:@"RestaurantItemViewCell" bundle:nil] forCellWithReuseIdentifier:restaurantItemCellIdentifier];
    
    // Do any additional setup after loading the view.
    self.collectionView.delaysContentTouches = NO;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    
    
    offscreenRestaurantItemCell = [[RestaurantItemViewCell alloc] init];
    self.width = self.collectionView.bounds.size.width;
    self.height = self.collectionView.bounds.size.height;
    
    
    GDCategory *local = [[GDCategory alloc] init];
    local.name = @"Local";
    
    GDCategory *organic = [[GDCategory alloc] init];
    local.name = @"Organic";
    
    GDCategory *fairTrade = [[GDCategory alloc] init];
    local.name = @"Fair Trade";
    
    GDCategory *social = [[GDCategory alloc] init];
    local.name = @"Social";
    
    GDCategory *humane = [[GDCategory alloc] init];
    local.name = @"Humane";
    
    
    
    //Mock Model
    GDLocation *temp1 = [[GDLocation alloc] init];
    temp1.name = @"Candide";
    temp1.locationDescription = @"Vous aimez la cuisine créative et l’art de surprendre avec des produits habituellement soporifiques. Dans leur cuisine ouverte autant qu’une cuisine peut l’être, le chef John Winter Russell et ses amis aux fourneaux, Marina De Figueiredo et Bryan Sham, concoctent des assiettes étonnantes. Ils travaillent le « local » avec une conscience certaine et font affaire avec des gens que tout le monde devrait aimer, Gaspésie Sauvage, Société Orignal et autres." ;
    temp1.categories = [[NSArray alloc] initWithObjects:local, organic, nil];
    GDAddress *temp1Addr = [[GDAddress alloc] init];
    temp1Addr.streetNumb = 551;
    temp1Addr.street = @"Rue Saint Martin";
    temp1.iconUrl = @"http://tastet.ca/wp-content/uploads/2015/12/restaurant-candide-griffintown-petite-bourgogne-332.jpg";
    temp1.address = temp1Addr;
    
    
    GDLocation *temp2 = [[GDLocation alloc] init];
    temp2.name = @"Café Joe";
    temp2.locationDescription = @"Petit café local, Live jazz au piano la fin de semaine. Soyez-y!" ;
    temp2.categories = [[NSArray alloc] initWithObjects:organic, humane, nil];
    GDAddress *temp2Addr = [[GDAddress alloc] init];
    temp2Addr.streetNumb = 3068;
    temp2Addr.street = @"Rue Saint Antoine O";
    temp2.iconUrl = @"https://www.google.ca/imgres?imgurl=http://www.montrealbits.com/images/photo/cafe_joe_1.jpg&imgrefurl=http://www.montrealbits.com/photos/cafe_joe_1.html&h=400&w=600&tbnid=AKX0sRCkBHPhwM:&docid=bIfljLrHUYVjSM&ei=REWuVvnDF8jqmAGuxpiYBA&tbm=isch&ved=0ahUKEwj59brDytTKAhVINSYKHS4jBkMQMwgcKAAwAA";

    temp2.address = temp2Addr;
    
    GDLocation *temp3 = [[GDLocation alloc] init];
    temp3.name = @"Crudessence";
    temp3.locationDescription = @"Venez goûter à notre menu plein de surprises, haut en couleurs et débordant de fraîcheur! Vous pouvez y déguster de surprenants smoothies et élixirs aux super-aliments, et régaler vos papilles avec un tout nouveau choix de déjeuners, de plats principaux et de desserts. Vous avez bien sûr toujours la possibilité de vous présenter au comptoir et de repartir avec votre jus, smoothie ou mets préféré, ou encore simplement passer pour visiter la section boutique et repartir avec des emplettes pleines de vitalité!" ;
    temp3.categories = [[NSArray alloc] initWithObjects:local, fairTrade, nil];
    GDAddress *temp3Addr = [[GDAddress alloc] init];
    temp3Addr.streetNumb = 2157;
    temp3Addr.street = @"Rue Mackay";
    temp3.iconUrl = @"http://www.saintsushibar.com/assets/images/carousel/0.jpg";
    
    temp3.address = temp3Addr;

    GDLocation *temp4 = [[GDLocation alloc] init];
    temp4.name = @"La panthère verte";
    temp4.locationDescription = @"La Panthère verte est un projet dynamique tout frais ayant comme objectif principal de développer une manière de vivre plus soutenable dans la réalité urbaine d’aujourd’hui. Elle supporte et crée des alternatives locales à travers l’utilisation de produits biologiques (locaux si possible), de matériaux recyclés et par la conscientisation." ;

    temp4.categories = [[NSArray alloc] initWithObjects:local, organic, social, nil];
    GDAddress *temp4Addr = [[GDAddress alloc] init];
    temp4Addr.streetNumb = 2153;
    temp4Addr.street = @"Rue Mackay";
    temp4.iconUrl = @"http://thegreenpanther.com/news/wp-content/themes/custom/images/involve_store.jpg";
    
    temp4.address = temp4Addr;
    
    
    GDLocation *temp5 = [[GDLocation alloc] init];
    temp5.name = @"La Palette Gourmande";
    temp5.locationDescription = @"Privilégiant des ingrédients naturels, haut de gamme et provenant en grande partie de petits producteurs locaux, nos plats sont toujours préparés avec de délicieux assaisonnements et dans le respect des produits de saison. Notre collection de mets gastronomiques valorise les ingrédients d’ici, notamment le saumon sauvage de l’Atlantique, le homard du Québec en saison, le foie gras et le canard du Lac Brome, l’agneau du Kamouraska, le bœuf Wagyu du Québec, ainsi que des produits frais de notre jardinier installé dans la région de Charlevoix. Des créations végétariennes, des gourmandises et des desserts inspirants sont également offerts." ;
    temp5.categories = [[NSArray alloc] initWithObjects:organic, nil];
    GDAddress *temp5Addr = [[GDAddress alloc] init];
    temp5Addr.streetNumb = 1486;
    temp5Addr.street = @"Rue Sherbrooke O";
    temp5.iconUrl = @"http://www.lapalettegourmande.com/img/p/1/1/0/110-large_default.jpg";
    
    temp5.address = temp5Addr;
    
    GDLocation *temp6 = [[GDLocation alloc] init];
    temp6.name = @"Monsieur";
    temp6.locationDescription = @"Kimberly Lallouz is a force to be reckoned with. The chef and owner of restaurants Miss Prêt à Manger and Monsieur Resto & Bar  (located side by side on Bleury St.) also runs two catering companies: Petite Miss Prêt à Manger, which supplies daycares with healthy, organic meals and snacks, and Miss Tennis, which provides nutritious fare for several sporting events, including the prestigious Rogers Cup." ;
    temp6.categories = [[NSArray alloc] initWithObjects:organic, nil];
    GDAddress *temp6Addr = [[GDAddress alloc] init];
    temp6Addr.streetNumb = 1102;
    temp6Addr.street = @"Rue de Bleury";
    temp6.iconUrl = @"http://www.restobarmonsieur.com/thumbs/uploads/gallery/monsieur_restaurant_bar_montreal_L_17.jpg?w=380&h=280&zc=1&v=20";
    
    temp6.address = temp6Addr;
    
    GDLocation *temp7 = [[GDLocation alloc] init];
    temp7.name = @"Ming Tao Xuan";
    temp7.locationDescription = @"MING TAO XUAN is a place to find out best quality traditional chinese loose leaf teas in Montreal, and our store is a unique and stunning oriental design is just for brought out a traditional Chinese culture of tea to introduce for our customer. So we also developed a oriental and modern website for you can order your favourite specialty loose leaf teas to be delivered to your doorstep. We sincere to invite you please drop by MING TAO XUAN in old port Montreal or explore our online shop to experience the diverse, rich flavours of our high quality specialty loose leaf teas." ;    temp7.categories = [[NSArray alloc] initWithObjects:organic, nil];
    GDAddress *temp7Addr = [[GDAddress alloc] init];
    temp7Addr.streetNumb = 451;
    temp7Addr.street = @"Rue Saint Sulpice";
    temp7.iconUrl = @"https://media-cdn.tripadvisor.com/media/photo-s/03/2e/ca/ff/ming-tao-xuan.jpg";
    
    temp7.address = temp7Addr;
    
    
    GDLocation *temp8 = [[GDLocation alloc] init];
    temp8.name = @"Le Cagibi";
    temp8.locationDescription = @"Le Cagibi est un restaurant végétarien, café et espace de spectacle dans le coeur du Mile End, à Montréal. Composé de deux pièces distinctes, Le Cagibi a pour but d’offrir un espace invitant et intime pour les artistes locaux, les musiciens et artistes de la scène, les curateurs et les organisateurs communautaires tout en assurant une ambiance détendue et comfortable pour ses clients.  Notre menu végétarien inclut plusieurs options végétaliennes et sans gluten.  Nous offrons aussi des spéciaux du jour ainsi que de délicieux brunchs la fin de semaine, que vous pouvez accompagner avec nos succulentes pâtisseries maison.  Nous avons comme priorité d’utiliser des ingrédients biologiques, équitables, locaux ou de petites entreprises, aussi souvent que possible." ;

    temp8.categories = [[NSArray alloc] initWithObjects:organic, nil];
    GDAddress *temp8Addr = [[GDAddress alloc] init];
    temp8Addr.streetNumb = 451;
    temp8Addr.street = @"Rue Saint Sulpice";
    temp8.iconUrl = @"http://s3-media1.fl.yelpcdn.com/bphoto/rt6qcinICkOlM8f4sahNZA/ls.jpg";
    
    temp8.address = temp8Addr;

    
    
    self.restaurants = [[NSArray alloc] initWithObjects:temp1, temp2, temp3, temp4, temp5, temp6,temp7, temp8,nil];
    
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
    return [self.restaurants count];
}






- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    GDLocation *location = self.restaurants[indexPath.row];
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:restaurantItemCellIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    RestaurantItemViewCell *castedCell = (RestaurantItemViewCell *) cell;
    [castedCell loadLocation:self.restaurants[indexPath.row]];
    
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
    
    
    GDLocation *location = self.restaurants[indexPath.row];
    
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
    
    
    toReturn = CGSizeMake(self.collectionView.bounds.size.width - insets.left - insets.right, self.offscreenRestaurantItemCell.frame.size.height);

    
    return toReturn;
    
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    //RestaurantItemViewCell *cell = (RestaurantItemViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    //[cell performSelectionAnimations];
    //UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    //cell.contentView.backgroundColor = [UIColor grayColor];
    
    RestaurantDetailsViewController *detailedRestaurantViewController = [self.navigationController.storyboard instantiateViewControllerWithIdentifier:@"RestaurantDetailsViewController"];
    //detailedRestaurantViewController.topic = topic;
    
    [detailedRestaurantViewController.navigationItem setLeftItemsSupplementBackButton:YES];
    [detailedRestaurantViewController.navigationItem setLeftBarButtonItem:nil];
    //[detailedRestaurantViewController.navigationItem setRightBarButtonItem:nil];
    if ([self.navigationController respondsToSelector:@selector(showViewController:sender:)])
    {
        [self.navigationController showViewController:detailedRestaurantViewController sender:self];
        
    }
    else if ([self.navigationController respondsToSelector:@selector(pushViewController:animated:)])
    {
        [self.navigationController pushViewController:detailedRestaurantViewController animated:YES];
    }

    
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












