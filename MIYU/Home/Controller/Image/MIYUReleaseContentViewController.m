//
//  MIYUReleaseContentViewController.m
//  MIYU
//
//  Created by hanyutong on 2018/5/9.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUReleaseContentViewController.h"
#import "MIYUMarkListViewController.h"
#import "MIYUMarkCell.h"

@interface MIYUReleaseContentViewController () <UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MIYUReleaseContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];


  self.title = @"图文内容";
  self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发布" style:UIBarButtonItemStylePlain target:self action:@selector(releaseAction)];


}

-(void)releaseAction
{

}
- (IBAction)moreMarkList:(id)sender {

  MIYUMarkListViewController * markVC = [[MIYUMarkListViewController alloc] init];

  [self presentViewController:markVC animated:YES completion:nil];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  MIYUMarkCell * cell = [MIYUMarkCell xibCellWithTableView:tableView];
  return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
