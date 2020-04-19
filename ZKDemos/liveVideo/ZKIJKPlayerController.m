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
