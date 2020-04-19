//
//  ZKAvPlayerView.m
//  avPlay
//
//  Created by zk on 2020/4/1.
//  Copyright © 2020 zk. All rights reserved.
//

#import "ZKAvPlayerView.h"

@interface ZKAvPlayerView ()

@property (strong, nonatomic) AVPlayer * avPlayer;
@property (strong, nonatomic) AVPlayerLayer * playerLayer;
@property (strong, nonatomic) AVPlayerItem * currentItem;

@property (copy, nonatomic) void(^startBlock)(CMTime duration);

@end

@implementation ZKAvPlayerView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.avPlayer = [[AVPlayer alloc] init];
        self.playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.avPlayer];
        [self.layer addSublayer:self.playerLayer];
        
    }
    return self;
}

- (void)playWithUrl:(NSString *)urlString startPlayBlock:(nonnull void (^)(CMTime))startBlock{
    NSURL *url = [NSURL URLWithString:urlString];
    self.playerLayer.frame = self.bounds;
    self.startBlock = startBlock;
    
    AVPlayerItem *item = [AVPlayerItem playerItemWithURL:url];
    
    if (self.currentItem) {
        [self.currentItem removeObserver:self forKeyPath:@"status"];
    }
    
    self.currentItem = item;
    // 观察status属性
    [self.currentItem addObserver:self forKeyPath:@"status" options:(NSKeyValueObservingOptionNew) context:nil];
    
    [self.avPlayer replaceCurrentItemWithPlayerItem:item];
    [self.avPlayer play];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    AVPlayerItem *item = (AVPlayerItem *)object;
    if ([keyPath isEqualToString:@"status"]) {
         //获取更改后的状态
        AVPlayerStatus status = [[change objectForKey:@"new"] intValue];
        if (status == AVPlayerStatusReadyToPlay) {
            CMTime duration = item.duration; // 获取视频长度
            
            if (self.startBlock) {
                self.startBlock(duration);
            }
            
        } else if (status == AVPlayerStatusFailed) {
            NSLog(@"AVPlayerStatusFailed");
        } else {
            NSLog(@"AVPlayerStatusUnknown");
        }
    }
//    else if ([keyPath isEqualToString:@"loadedTimeRanges"]) {
//         NSTimeInterval timeInterval = [self availableDurationRanges]; // 缓冲时间
//         CGFloat totalDuration = CMTimeGetSeconds(_playerItem.duration); // 总时间
//    }
}

- (void)dealloc {
    [self.currentItem removeObserver:self forKeyPath:@"status"];
}

@end
