//
//  FredPlaying.m
//  swe
//
//  Created by Peter El Jiz on 2016-01-31.
//  Copyright © 2016 greendrex. All rights reserved.
//

#import "FredPlaying.h"
#import "GDLocation.h"

@implementation FredPlaying

-(void) main {
    GDLocation *restaurant=[[GDLocation alloc]init];
    restaurant.name = @"Candide";
    restaurant.locationDescription = @"Vous aimez la cuisine créative et l’art de surprendre avec des produits habituellement soporifiques. Dans leur cuisine ouverte autant qu’une cuisine peut l’être, le chef John Winter Russell et ses amis aux fourneaux, Marina De Figueiredo et Bryan Sham, concoctent des assiettes étonnantes. Ils travaillent le « local » avec une conscience certaine et font affaire avec des gens que tout le monde devrait aimer, Gaspésie Sauvage, Société Orignal et autres." ;
    
    GDLocation *restaurant2=[[GDLocation alloc]init];
    restaurant2.name = @"Café Joe";
    restaurant2.locationDescription = @"Petit café local, Live jazz au piano la fin de semaine. Soyez-y!" ;
    
    GDLocation *restaurant3=[[GDLocation alloc]init];
    restaurant3.name = @"Crudessence";
    restaurant3.locationDescription = @"Venez goûter à notre menu plein de surprises, haut en couleurs et débordant de fraîcheur! Vous pouvez y déguster de surprenants smoothies et élixirs aux super-aliments, et régaler vos papilles avec un tout nouveau choix de déjeuners, de plats principaux et de desserts. Vous avez bien sûr toujours la possibilité de vous présenter au comptoir et de repartir avec votre jus, smoothie ou mets préféré, ou encore simplement passer pour visiter la section boutique et repartir avec des emplettes pleines de vitalité!" ;
    
    GDLocation *restaurant4=[[GDLocation alloc]init];
    restaurant4.name = @"La panthère verte";
    restaurant4.locationDescription = @"La Panthère verte est un projet dynamique tout frais ayant comme objectif principal de développer une manière de vivre plus soutenable dans la réalité urbaine d’aujourd’hui. Elle supporte et crée des alternatives locales à travers l’utilisation de produits biologiques (locaux si possible), de matériaux recyclés et par la conscientisation." ;
    
    GDLocation *restaurant5=[[GDLocation alloc]init];
    restaurant5.name = @"La Palette Gourmande";
    restaurant5.locationDescription = @"Privilégiant des ingrédients naturels, haut de gamme et provenant en grande partie de petits producteurs locaux, nos plats sont toujours préparés avec de délicieux assaisonnements et dans le respect des produits de saison. Notre collection de mets gastronomiques valorise les ingrédients d’ici, notamment le saumon sauvage de l’Atlantique, le homard du Québec en saison, le foie gras et le canard du Lac Brome, l’agneau du Kamouraska, le bœuf Wagyu du Québec, ainsi que des produits frais de notre jardinier installé dans la région de Charlevoix. Des créations végétariennes, des gourmandises et des desserts inspirants sont également offerts." ;
    
    GDLocation *restaurant6=[[GDLocation alloc]init];
    restaurant6.name = @"Monsieur";
    restaurant6.locationDescription = @"Kimberly Lallouz is a force to be reckoned with. The chef and owner of restaurants Miss Prêt à Manger and Monsieur Resto & Bar  (located side by side on Bleury St.) also runs two catering companies: Petite Miss Prêt à Manger, which supplies daycares with healthy, organic meals and snacks, and Miss Tennis, which provides nutritious fare for several sporting events, including the prestigious Rogers Cup." ;
    
    
    GDLocation *restaurant7=[[GDLocation alloc]init];
    restaurant7.name = @"Ming Tao Xuan";
    restaurant7.locationDescription = @"MING TAO XUAN is a place to find out best quality traditional chinese loose leaf teas in Montreal, and our store is a unique and stunning oriental design is just for brought out a traditional Chinese culture of tea to introduce for our customer. So we also developed a oriental and modern website for you can order your favourite specialty loose leaf teas to be delivered to your doorstep. We sincere to invite you please drop by MING TAO XUAN in old port Montreal or explore our online shop to experience the diverse, rich flavours of our high quality specialty loose leaf teas." ;
    
    GDLocation *restaurant8=[[GDLocation alloc]init];
    restaurant8.name = @"Le Cagibi";
    restaurant8.locationDescription = @"Le Cagibi est un restaurant végétarien, café et espace de spectacle dans le coeur du Mile End, à Montréal. Composé de deux pièces distinctes, Le Cagibi a pour but d’offrir un espace invitant et intime pour les artistes locaux, les musiciens et artistes de la scène, les curateurs et les organisateurs communautaires tout en assurant une ambiance détendue et comfortable pour ses clients.  Notre menu végétarien inclut plusieurs options végétaliennes et sans gluten.  Nous offrons aussi des spéciaux du jour ainsi que de délicieux brunchs la fin de semaine, que vous pouvez accompagner avec nos succulentes pâtisseries maison.  Nous avons comme priorité d’utiliser des ingrédients biologiques, équitables, locaux ou de petites entreprises, aussi souvent que possible." ;
    
    GDLocation *restaurant9=[[GDLocation alloc]init];
    restaurant9.name = @"Thazar";
    restaurant9.locationDescription = @"Bistro japonais très actuel, le Thazard est on ne peut plus hipster, à l’image de son quartier. Aux fourneaux, le talentueux chef nippon Hachiro Fujise concocte des petits plats à partager, tous plus alléchants les uns que les autres: tartares de bœuf wagyu ou de saumon, soupes ramen, hot-dog de pieuvre, poutine miso, croquette Menchikatsu (porc émincé) et l’un des gros vendeurs, le poulet Karaage. Derrière le bar, des mixologues brassent allègrement des drinks originaux et très tentants. On peut d’ailleurs s’arrêter juste pour siroter un verre et grignoter quelque chose jusqu’à tard le soir. Le rapport qualité-prix est excellent et le midi les plats à prix doux valent également un arrêt. On en profite pour découvrir que certains sakés sont aussi raffraichissants qu’un vin blanc!" ;
    
    GDLocation *restaurant10=[[GDLocation alloc]init];
    restaurant10.name = @"Lola Rosa";
    restaurant10.locationDescription = @"Lola Rosa Park is the new baby of Lola Rosa, spacier, modern but still the same spirit. A space for our grocery store where we will sell our homemade product." ;
    
    GDLocation *restaurant11=[[GDLocation alloc]init];
    restaurant11.name = @"Resonance Cafe";
    restaurant11.locationDescription = @"PLieu branché proposant des espressos et repas légers végétaliens, et des concerts de musique moderne le soir." ;
    
    GDLocation *restaurant12=[[GDLocation alloc]init];
    restaurant12.name = @"Sophie Sucrée";
    restaurant12.locationDescription = @"Sophie était ma grand-mère. Longtemps je l’ai regardée préparer ses pâtisseries dans la cuisine familiale. Elle faisait tout à la main et n’utilisait que des ingrédients de qualité. Les invités se régalaient et tous attendaient impatiemment le magnifique et délicieux gâteau que Sophie avait préparé. Je la vois encore découper et servir elle-même fièrement son chef-d’œuvre. Chaque détail est important, disait-elle, car chaque détail fait la différence. Mais son plus grand secret, c’est que ses pâtisseries tissaient un lien de joie entre tous." ;
    
    GDLocation *restaurant13=[[GDLocation alloc]init];
    restaurant13.name = @"Le Doggy Café";
    restaurant13.locationDescription = @"Alors qu’elle était encore étudiante en restauration à l’Institut de tourisme et d'hôtellerie du Québec (ITHQ), Gabrielle Aubin a consacré son mémoire de recherche à l’émergence des « food trucks » à Montréal. Au fil de ses voyages, la jeune femme s’est aperçue que son rêve d’ouvrir un établissement acceptant les chiens n’était pas aussi fou qu’il y paraissait.Avec sa partenaire d’affaires Caroline Le Corre, elle a donc décidé de passer à la vitesse supérieure et d’établir un plan d’affaires. Six mois plus tard, les deux propriétaires ouvraient le Doggy Café sur le Plateau, un lieu pouvant accueillir 45 personnes et une trentaine de chiens pouvant eux aussi passer un bon moment au chaud… biscuit compris !" ;
    
    GDLocation *restaurant14=[[GDLocation alloc]init];
    restaurant14.name = @"Ô deux soeurs";
    restaurant14.locationDescription = @"Petit à petit, de plus en plus grand Ô deux sœurs est un petit commerce qui a repris son envol depuis maintenant cinq ans, cheminant d’aventures en aventures, à travers les lieux et les découvertes et ne cessant de cumuler les talents. Dans cet univers philanthrope, toute l’équipe de petits créateurs s’affaire à réinventer les traditionnels plaisir de la table, tout en s’assurant de plaire au fin palais de la reine Mère! En semaine, nous déclinons une table d’hôte, midi et soir, qui saura satisfaire autant votre gourmandise que votre portefeuille. N’oubliez surtout pas de venir vous gâter les jours de fin de semaine en profitant de nos joyeux brunchs gourmands. Une carte de sandwichs, salades, desserts et de boissons chaudes ou froides est servie en tout temps. Venez aussi découvrir notre toute nouvelle sélection de café qui vous laissera l’envie d’en rapporter un peu à la maison. Une gamme de mets préparés est toujours disponible sur place, délicieux classiques, souvent végé et bio, toujours santé et résolument pratiques. Jetez aussi un coup d’œil côté épicerie, vous y découvrirez sûrement quelques produits originaux parmi notre sympathique sélection. Depuis deux ans, le commerce se promène aussi sur quatre roues via notre Foodtruck : Ô sœurs Volantes. Salade en tortilles, boulettes et sourires à l’honneur." ;
    
    GDLocation *restaurant15=[[GDLocation alloc]init];
    restaurant15.name = @"Aux vivres";
    restaurant15.locationDescription = @"Suivant des techniques de culture traditionnelles, les producteurs biologiques s’abstiennent d’introduire des pesticides et des fertilisants synthétiques dans le sol, de sorte qu’ils ne s’introduisent pas dans votre bouche. Nous croyons qu’en mangeant bio, on soutient un mode de vie sain, des pratiques agricoles durables et la disponibilité à long terme d’une nourriture diversifiée et pleine de saveur.Chez Aux Vivres, nous augmentons constamment notre usage de fruits, de légumes et de grains biologiques. Nous tâchons de trouver un équilibre entre notre consommation de produits biologiques et nos partenariats avec des fermes locales, de manière à minimiser notre empreinte écologique. Ainsi, nous privilégions parfois des produits régionaux plutôt que des aliments biologiques lorsque ces derniers doivent franchir plusieurs milliers de kilomètres pour nous parvenir (par exemple, nous préférons des carottes cultivées par un agriculteur québécois à des carottes biologiques de Californie). Dans le cadre de notre engagement à proposer une alimentation intègre, nous nous efforçons d’offrir un menu composé de choix plus sains, plus savoureux et plus respectueux de l’environnement que la nourriture de culture conventionnelle ou importée." ;
    
    GDLocation *restaurant16=[[GDLocation alloc]init];
    restaurant16.name = @"Le Sain Bol";
    restaurant16.locationDescription = @"En toute simplicité, Frédéric vous accueille dans son restaurant et partage, le temps d'un repas,  l'art d'une alimentation saine. Travaillant avec des produits biologiques et locaux, Frédéric propose un menu diversifié et créatif qui convient à tous : autant aux végétariens, végétaliens, sans gluten, sans lactose ou autres intolérances alimentaires. L'espace chaleureux qu'est le Sain Bol, où les tables se partagent et les discussions avec le chef sont toujours les bienvenues, constitue un lieu d'échange convivial. Le Sain Bol est également un lieu d'échange culturel où des évènements publics sont organisés certains soirs de la semaine (projection de film, lecture d'auteurs, gymnastique créative, etc)." ;
    
    
    
}

@end
