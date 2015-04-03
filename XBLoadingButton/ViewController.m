//
//  ViewController.m
//  XBLoadingButton
//
//  Created by Peter on 15/4/2.
//  Copyright (c) 2015年 Peter. All rights reserved.
//

#import "ViewController.h"
#import "XBLoadingButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    XBLoadingButton* btn = [[XBLoadingButton alloc] initWithFrame:CGRectMake(100, 200, 80, 80)];
    [btn setTitle:@"点击开始"];
    __weak typeof (btn) wBtn = btn;
    [btn addAction:^{
        [wBtn setTitle:@"正在加载"];
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            sleep(3);
            dispatch_async(dispatch_get_main_queue(), ^{
                [wBtn setTitle:@"点击开始"];
                [wBtn stop];
            });
        });
    }];
    [self.view addSubview:btn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
