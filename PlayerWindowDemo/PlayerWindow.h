//
//  PlayerWindow.h
//  PlayerWindowDemo
//
//  Created by runlin on 17/1/16.
//  Copyright © 2017年 gavin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayerWindow : UIView

@property (strong, nonatomic) IBOutlet UIView *showWindowView;
@property (nonatomic, assign) BOOL isFullscreenMode;
@property (nonatomic, assign) BOOL isShowTopViewBottomView;
@property (nonatomic, assign) CGRect originFrame;
@property (nonatomic, strong) NSTimer *durationTimer;

@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;


+ (instancetype)defaultGiftView:(CGRect)frame;

@end
