//
//  MIYUMarkListViewController.m
//  MIYU
//
//  Created by hanyutong on 2018/5/9.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUMarkListViewController.h"
#import "MIYUMarkCell.h"
#import "MIYUUnknowMarkCell.h"

@interface MIYUMarkListViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end

@implementation MIYUMarkListViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
  [self dismissViewControllerAnimated:YES completion:nil];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//  MIYUMarkCell * cell = [MIYUMarkCell xibCellWithTableView:tableView];
  MIYUUnknowMarkCell * cell = [MIYUUnknowMarkCell xibCellWithTableView:tableView];
  return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
