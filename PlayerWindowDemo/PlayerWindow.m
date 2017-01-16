//
//  PlayerWindow.m
//  PlayerWindowDemo
//
//  Created by runlin on 17/1/16.
//  Copyright © 2017年 gavin. All rights reserved.
//

#import "PlayerWindow.h"

#define MAINSCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_SCALE [UIScreen mainScreen].bounds.size.width/375
#define MAINSCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@implementation PlayerWindow

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [[NSBundle mainBundle] loadNibNamed:[[self class] description] owner:self options:nil];
        _showWindowView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        [self addSubview:_showWindowView];
        
        [self setupLiveGiftView];
        
        
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        
        [self setupLiveGiftView];
    }
    return self;
}


+ (instancetype)defaultGiftView:(CGRect)frame{
//    return [[PlayerWindow alloc]initWithFrame:CGRectMake(0, 0, MAINSCREEN_WIDTH, 200)];
    return [[PlayerWindow alloc] initWithFrame:frame];
}


- (void)setupLiveGiftView{
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self];
    if ([self pointInside:touchPoint withEvent:event]) {
        if (self.topView.alpha == 0) {
            [self showTopAndBottomView];
        }else{
            [self hiddenTopAndBottomView];
        }
    }
}

- (void)startDurationTimer
{
    self.durationTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(monitorVideoPlayback) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.durationTimer forMode:NSDefaultRunLoopMode];
}

- (void)stopDurationTimer
{
    [self.durationTimer invalidate];
}

- (IBAction)fullScreenSwitch:(id)sender {
    
    if (self.isFullscreenMode) {
        return;
    }
    self.originFrame = self.frame;
    CGFloat height = [[UIScreen mainScreen] bounds].size.width;
    CGFloat width = [[UIScreen mainScreen] bounds].size.height;
    CGRect frame = CGRectMake((height - width) / 2, (width - height) / 2, width, height);
    [UIView animateWithDuration:0.3f animations:^{
        self.frame = frame;
        [self setTransform:CGAffineTransformMakeRotation(M_PI_2)];
    } completion:^(BOOL finished) {
        _isFullscreenMode = YES;
    }];
    
    [self startDurationTimer];
    
}


- (IBAction)shrinkScreenButtonClick:(id)sender
{
    if (!self.isFullscreenMode) {
        return;
    }
    [UIView animateWithDuration:0.3f animations:^{
        [self setTransform:CGAffineTransformIdentity];
        self.frame = self.originFrame;
    } completion:^(BOOL finished) {
        self.isFullscreenMode = NO;
    }];
}



- (void)monitorVideoPlayback{
    [self stopDurationTimer];
    [self hiddenTopAndBottomView];
}

- (void)showTopAndBottomView{
    [UIView animateWithDuration:0 animations:^{
        self.topView.alpha = 0.0;
        self.bottomView.alpha = 0.0;
    } completion:^(BOOL finished) {
        if (finished) {
            _topView.alpha = 1;
            _bottomView.alpha = 1;
        }
        
        [self startDurationTimer];
    }];
}

- (void)hiddenTopAndBottomView{
    [UIView animateWithDuration:0 animations:^{
        self.topView.alpha = 1;
        self.bottomView.alpha = 1;
    } completion:^(BOOL finished) {
        if (finished) {
            _topView.alpha = 0.0;
            _bottomView.alpha = 0.0;
        }
        
        [self stopDurationTimer];
        
    }];
}


@end
