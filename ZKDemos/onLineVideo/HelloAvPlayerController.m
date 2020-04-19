//
//  HelloAvPlayerController.m
//  avPlay
//
//  Created by zk on 2020/4/1.
//  Copyright © 2020 zk. All rights reserved.
//

#import "HelloAvPlayerController.h"
#import <AVKit/AVKit.h>
#import "ZKAvPlayerView.h"

@interface HelloAvPlayerController ()

@property (weak, nonatomic) IBOutlet UIView *cusView;
@property (weak, nonatomic) ZKAvPlayerView * zkPlayerView;

@end

@implementation HelloAvPlayerController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ZKAvPlayerView *view = [[ZKAvPlayerView alloc] init];
    self.zkPlayerView = view;
    [self.cusView addSubview:view];
    self.zkPlayerView.frame = self.cusView.bounds;
    
    [self.zkPlayerView playWithUrl:@"https://stream7.iqilu.com/10339/upload_transcode/202002/18/20200218114723HDu3hhxqIT.mp4" startPlayBlock:^(CMTime duration) {
        NSLog(@"%f",CMTimeGetSeconds(duration));
    }];
}

@end
