//
//  loadnetworkImage.m
//  loadnetworkImage
//
//  Created by wanfengxixi on 2021/12/16.
//

#import "loadnetworkImage.h"

@implementation loadnetworkImage
//从网络下载图片
- (UIImage *)getImageFromURL:(NSString *)fileUrl{
    UIImage * result;
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:fileUrl]];
    result = [UIImage imageWithData:data];
    return result;
}
// 保存到本地
- (void)saveImage:(UIImage *)image withFileName:(NSString *)imageName oftyoe:(NSString *)extension inDirectory:(NSString *)directoryPath{
    if ([[extension lowercaseString] isEqualToString:@"png"]) {
        [UIImagePNGRepresentation(image) writeToFile:[directoryPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@",imageName,@"png"]]  options:NSAtomicWrite error:nil];
    }else if([[extension lowercaseString] isEqualToString:@"jpg"] || [[extension lowercaseString] isEqualToString:@"jpeg"]){
        [UIImageJPEGRepresentation(image, 1.0) writeToFile:[directoryPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@",imageName,@"jpeg"]] options:NSAtomicWrite error:nil];
    }else{
        NSLog(@"文件后缀名不认识");
    }
}
// 加载本地图片
- (UIImage *)loadImage:(NSString *)fileName oftype:(NSString *)extension inDirectory:(NSString *)directoryPath{
    UIImage *result = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@.%@",directoryPath,fileName,extension]];
    return result ;
}
@end
