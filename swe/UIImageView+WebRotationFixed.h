#import "SDWebImageCompat.h"
#import "SDWebImageManager.h"


@interface UIImageView (WebRotationFix)


- (void)sd_setImageWithRotationFixedWithURL:(NSURL *)url;
- (void)sd_setImageWithRotationFixedWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder;
- (void)sd_setImageWithRotationFixedWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options;
- (void)sd_setImageWithRotationFixedWithURL:(NSURL *)url completed:(SDWebImageCompletionBlock)completedBlock;
- (void)sd_setImageWithRotationFixedWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder completed:(SDWebImageCompletionBlock)completedBlock;
- (void)sd_setImageWithRotationFixedWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options completed:(SDWebImageCompletionBlock)completedBlock;
- (void)sd_setImageWithRotationFixedWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options progress:(SDWebImageDownloaderProgressBlock)progressBlock completed:(SDWebImageCompletionBlock)completedBlock;
- (void)sd_setImageWithRotationFixedWithPreviousCachedImageWithURL:(NSURL *)url andPlaceholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options progress:(SDWebImageDownloaderProgressBlock)progressBlock completed:(SDWebImageCompletionBlock)completedBlock;
- (void)sd_setAnimationImagesWithRotationFixedWithURLs:(NSArray *)arrayOfURLs;
- (void)sd_cancelCurrentImageLoad;
- (void)sd_cancelCurrentAnimationImagesLoad;

@end
