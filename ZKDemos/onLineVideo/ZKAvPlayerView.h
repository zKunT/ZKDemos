//
//  ZKAvPlayerView.h
//  avPlay
//
//  Created by zk on 2020/4/1.
//  Copyright © 2020 zk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVKit/AVKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZKAvPlayerView : UIView

- (void)playWithUrl:(NSString *)urlString startPlayBlock:(void(^)(CMTime duration))startBlock;

@end

NS_ASSUME_NONNULL_END
