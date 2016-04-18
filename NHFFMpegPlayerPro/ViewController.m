//
//  ViewController.m
//  NHFFMpegPlayerPro
//
//  Created by hu jiaju on 16/4/18.
//  Copyright © 2016年 hu jiaju. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"http" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(HttpAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    weakify(self)
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        strongify(self)
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(self.view.mas_top).offset(100);
        make.width.equalTo(@100);
        make.height.equalTo(@50);
    }];
    
}

- (void)HttpAction {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
