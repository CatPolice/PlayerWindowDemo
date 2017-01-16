//
//  ViewController.m
//  PlayerWindowDemo
//
//  Created by runlin on 17/1/16.
//  Copyright © 2017年 gavin. All rights reserved.
//

#import "ViewController.h"
#import "PlayerWindow.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    PlayerWindow *pl = [PlayerWindow defaultGiftView:CGRectMake(0, 100, 375, 200)];
    [self.view addSubview:pl];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
