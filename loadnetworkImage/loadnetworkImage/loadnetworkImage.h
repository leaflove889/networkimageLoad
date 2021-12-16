//
//  loadnetworkImage.h
//  loadnetworkImage
//
//  Created by wanfengxixi on 2021/12/16.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface loadnetworkImage : NSObject
///从网络下载图片
- (UIImage *)getImageFromURL:(NSString *)fileUrl;
/// 保存到本地
- (void)saveImage:(UIImage *)image withFileName:(NSString *)imageName oftyoe:(NSString *)extension inDirectory:(NSString *)directoryPath;
/// 加载本地图片
- (UIImage *)loadImage:(NSString *)fileName oftype:(NSString *)extension inDirectory:(NSString *)directoryPath;
@end

NS_ASSUME_NONNULL_END
