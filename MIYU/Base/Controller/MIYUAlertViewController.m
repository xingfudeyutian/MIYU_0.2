//
//  MIYUAlertViewController.m
//  MIYU
//
//  Created by hanyutong on 2018/5/21.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUAlertViewController.h"


@interface MIYUAlertViewController ()
@property (weak, nonatomic) IBOutlet UILabel *messageL;
@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;


@end

@implementation MIYUAlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];


  if (self.model != nil) {
    self.messageL.text = self.model.message;
    [self.leftBtn setTitle:self.model.leftButton forState:UIControlStateNormal];
    [self.rightBtn setTitle:self.model.rightButton forState:UIControlStateNormal];

  }

}



- (IBAction)buttonAction:(id)sender {
 [self.view removeFromSuperview];
  UIButton * button = (UIButton *)sender;
  switch (button.tag) {
    case 0:
    {


    }
      break;
    case 1:
    {

      if (self.actionBlock)
      {
        self.actionBlock(button.tag);
      }
    }
      break;
    default:
      break;
  }
}












- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
