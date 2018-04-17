//
//  MIYUIncomeViewController.m
//  MIYU
//
//  Created by hanyutong on 2018/1/30.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUIncomeViewController.h"

@interface MIYUIncomeViewController ()

@end

@implementation MIYUIncomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的收益";
  self.navigationController.navigationBar.tintColor = [UIColor blackColor] ;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"明细" style:UIBarButtonItemStylePlain target:self action:@selector(rightAction)];
}

- (void)rightAction
{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
