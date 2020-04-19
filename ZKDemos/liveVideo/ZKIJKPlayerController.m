//
//  ZKIJKPlayerController.m
//  ZKDemos
//
//  Created by zk on 2020/4/19.
//  Copyright © 2020 zk. All rights reserved.
//

#import "ZKIJKPlayerController.h"
#import <IJKMediaFramework/IJKMediaPlayer.h>

@interface ZKIJKPlayerController ()

@property (strong, nonatomic) IJKFFMoviePlayerController * player;

@end

@implementation ZKIJKPlayerController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.address = @"http://111.202.43.95/hdl3a.douyucdn.cn/live/4332rq0srxkvig7U_550.flv?wsAuth=d03ed4b6e8c39fdb755ec0b9d493a5ff&token=app-ios-361019-4332-40160242e1941182923c72436cf37d5cd2811c92d1ef7657&logo=0&expire=0&did=cce607aca6514115520cd33200001521&ver=6.091&pt=1&st=0&origin=ws&mix=0&isp=";
    // 拉流地址
    NSURL *url = [NSURL URLWithString:self.address];
           
    // 创建IJKFFMoviePlayerController：专门用来直播，传入拉流地址就好了
    IJKFFMoviePlayerController *playerVc = [[IJKFFMoviePlayerController alloc] initWithContentURL:url withOptions:nil];
   
    // 准备播放
    [playerVc prepareToPlay];
   
    // 强引用，反正被销毁
    _player = playerVc;
    playerVc.view.frame = self.view.bounds;
    [self.view insertSubview:playerVc.view atIndex:1];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [_player stop];
}

- (void)dealloc{
    [_player shutdown];
    [_player.view removeFromSuperview];
    _player = nil;
}

@end
