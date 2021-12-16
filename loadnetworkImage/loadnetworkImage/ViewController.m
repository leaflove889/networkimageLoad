//
//  ViewController.m
//  loadnetworkImage
//
//  Created by wanfengxixi on 2021/12/16.
//

#import "ViewController.h"
#import "loadnetworkImage.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *img;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *doucmentsDirectoryPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSLog(@"保存路径 %@",doucmentsDirectoryPath);
    // 保存图片到本地

    NSArray *array = @[@"DEV"
    ];
    
    for (NSInteger i=0;i < array.count; i++ ) {
//        UIImage *imageUrl = [[loadnetworkImage new] getImageFromURL:[NSString stringWithFormat:@"http://localhost/%@.png",array[i]]];
        UIImage *imageUrl = [[loadnetworkImage new] getImageFromURL:[NSString stringWithFormat:@"https://www.iloveimg.com/img/iloveimg.png"]];
    https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/1e738cf8dafc4d31869a53f34f339803~tplv-k3u1fbpfcp-watermark.awebp
//        NSLog(@"%@",[NSString stringWithFormat:@"http://localhost/%@.png",array[i]]);
        [[loadnetworkImage new ] saveImage:imageUrl withFileName:array[i] oftyoe:@"png" inDirectory:doucmentsDirectoryPath];
    }
    
    NSArray *file = [[[NSFileManager alloc]init] subpathsAtPath:doucmentsDirectoryPath];
    NSLog(@"%@",file);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self setAppIconWithName:@"DEV"];
    });
   
    
}
- (void)setAppIconWithName:(NSString *)iconName {

    if (![[UIApplication sharedApplication] supportsAlternateIcons]) {
        return;
    }
    
    if ([iconName isEqualToString:@""]) {
        iconName = nil;
    }
    [[UIApplication sharedApplication] setAlternateIconName:iconName completionHandler:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"更换app图标发生错误了 ： %@",error);
        }else{
            NSLog(@"%@",[UIApplication sharedApplication].alternateIconName);
        }
    }];
    

}


@end
