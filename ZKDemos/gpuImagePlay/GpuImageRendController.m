//
//  GpuImageRendController.m
//  ZKDemos
//
//  Created by zk on 2020/4/19.
//  Copyright © 2020 zk. All rights reserved.
//

#import "GpuImageRendController.h"
#import "GPUImage.h"

@interface GpuImageRendController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation GpuImageRendController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GPUImageFilter *filter =  [[NSClassFromString(self.filterName) alloc] init];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImage *inputImage = [UIImage imageNamed:@"lzl.png"];
    //设置要渲染的区域
    [filter forceProcessingAtSize:inputImage.size];
    [filter useNextFrameForImageCapture];
    //获取数据源
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc]initWithImage:inputImage];
    //添加上滤镜
    [stillImageSource addTarget:filter];
    //开始渲染
    [stillImageSource processImage];
    //获取渲染后的图片
    UIImage *newImage = [filter imageFromCurrentFramebuffer];
    //加载出来
    self.imageView.image = newImage;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
