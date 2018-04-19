//
//  MIYUFilterViewController.m
//  MIYU
//
//  Created by hanyutong on 2018/4/18.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUFilterViewController.h"

@interface MIYUFilterViewController ()

@property (weak, nonatomic) IBOutlet UIButton *genderAll;
@property (weak, nonatomic) IBOutlet UIButton *boy;
@property (weak, nonatomic) IBOutlet UIButton *girl;
@property (nonatomic ,strong) UIButton * currentGender;



@property (weak, nonatomic) IBOutlet UIButton *sameCity;
@property (weak, nonatomic) IBOutlet UIButton *cityAll;
@property (nonatomic ,strong) UIButton * currentCity;


@property (weak, nonatomic) IBOutlet UIButton *done;
@property (weak, nonatomic) IBOutlet UIButton *cancel;






@end

@implementation MIYUFilterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  self.currentGender = self.genderAll;
  self.currentCity = self.sameCity;

}

- (IBAction)genderAction:(id)sender {


  UIButton * actionBtn = (UIButton *)sender;
  [actionBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
  actionBtn.layer.borderWidth = 0;
  actionBtn.backgroundColor = COLOR_YELLOW;
  actionBtn.layer.shadowColor = [UIColor blackColor].CGColor;
  actionBtn.layer.shadowOffset = CGSizeMake(5.0, 5.0);
  actionBtn.layer.shadowRadius = 20;
  actionBtn.layer.shadowOpacity = 0.5;
  actionBtn.layer.masksToBounds = YES;

  self.currentGender.layer.borderWidth = 1.0f;
  [self.currentGender setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
  self.currentGender.backgroundColor = [UIColor whiteColor];
  self.currentGender = actionBtn;






}


- (IBAction)cityAction:(id)sender {
  UIButton * actionBtn = (UIButton *)sender;
  [actionBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
  actionBtn.layer.borderWidth = 0;
  actionBtn.backgroundColor = COLOR_YELLOW;
  actionBtn.layer.shadowColor = [UIColor blackColor].CGColor;
  actionBtn.layer.shadowOffset = CGSizeMake(5.0, 5.0);
  actionBtn.layer.shadowRadius = 20;
  actionBtn.layer.shadowOpacity = 0.5;
  actionBtn.layer.masksToBounds = YES;

  self.currentCity.layer.borderWidth = 1.0f;
  [self.currentCity setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
  self.currentCity.backgroundColor = [UIColor whiteColor];
  self.currentCity = actionBtn;


}

- (IBAction)doneAction:(id)sender {

  [self.view removeFromSuperview];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
