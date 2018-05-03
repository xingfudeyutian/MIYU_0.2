//
//  MIYUReportViewController.m
//  MIYU
//
//  Created by hanyutong on 2018/4/28.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUReportViewController.h"

@interface MIYUReportViewController ()<UIGestureRecognizerDelegate>

@end

@implementation MIYUReportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)okBtn:(id)sender {

  [self.view removeFromSuperview];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
  [self.view removeFromSuperview];
}
-(void)dealloc
{
  NSLog(@"%s",__func__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
