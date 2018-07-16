//
//  ViewController.m
//  ScrollImageCell
//
//  Created by Ryan on 2018/7/16.
//  Copyright © 2018年 Ryan. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat buttonWidth = 100;
    CGFloat buttonHeight = 50;
    UIButton *startButton = [[UIButton alloc] initWithFrame:CGRectMake((self.view.width - buttonWidth)/2, (self.view.height - buttonHeight)/2, buttonWidth, buttonHeight)];
    [startButton setTitle:@"开始" forState:UIControlStateNormal];
    [startButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [startButton addTarget:self action:@selector(getStart) forControlEvents:UIControlEventTouchUpInside];
    
    startButton.layer.borderWidth = 1.f;
    startButton.layer.cornerRadius = 5.f;
    startButton.layer.borderColor = [UIColor blueColor].CGColor;
    
    [self.view addSubview:startButton];
}


- (void)getStart {
    [self.navigationController pushViewController:[TableViewController new] animated:YES];
}


@end
