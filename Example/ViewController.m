//
//  ViewController.m
//  Example
//
//  Created by Jeason on 2017/8/5.
//  Copyright © 2017年 Jeason.Lee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)selectedButtonAction:(UIButton *)sender {
    [sender jx_selectedTitleWithTitle:@"selected倒计时" startTime:15];
//    [sender jx_selectedTitleWithTitle:@"selected倒计时" startTime:15 waitPrefix:@"selected前序" waitSuffix:@"后序"];
}

- (IBAction)normalButtonAction:(UIButton *)sender {
    [sender jx_normalTitleWithTitle:@"normal倒计时" startTime:15];
//    [sender jx_normalTitleWithTitle:@"normal倒计时" startTime:15 waitPrefix:@"normal前序" waitSuffix:@"后序"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
