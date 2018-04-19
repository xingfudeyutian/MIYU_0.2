//
//  MIYUMineViewController+UI.m
//  MIYU
//
//  Created by hanyutong on 2018/1/22.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUMineViewController+UI.h"
#import "MIYUNormalCell.h"
#import "MIYUMineInfoCell.h"
#import "MIYUMineMomentCell.h"



@implementation MIYUMineViewController (UI)

- (void)setupSubViews
{
  self.tableView.tableHeaderView = self.adScrollView;
}

#pragma mark - UITableViewDataSource,UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 6;
            break;
        case 1:
            return 2;
            break;
        default:
            return 0;
            break;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    BaseTableViewCell * cell;
    if (indexPath.section == 0)
    {
      if(indexPath.row == 0)
      {
        //个人信息
        cell = [MIYUMineInfoCell xibCellWithTableView:tableView];
      }
      else if(indexPath.row == 1)
      {
        //视频收费
        cell = [MIYUNormalCell xibCellWithTableView:tableView];
        cell.textLabel.text = self.items[indexPath.section][indexPath.row][@"title"];
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.detailTextLabel.text = self.items[indexPath.section][indexPath.row][@"detail"];
      }
      else if (indexPath.row == 2)
      {
        //我的动态
        cell = [MIYUMineMomentCell xibCellWithTableView:tableView];
      }
      else
      {
        cell = [MIYUNormalCell xibCellWithTableView:tableView];
        cell.textLabel.text = self.items[indexPath.section][indexPath.row][@"title"];
        cell.imageView.image = IMAGE(self.items[indexPath.section][indexPath.row][@"image"]);
        cell.detailTextLabel.text = self.items[indexPath.section][indexPath.row][@"detail"];
      }

    }
    else
    {
        cell = [MIYUNormalCell xibCellWithTableView:tableView];
        cell.textLabel.text = self.items[indexPath.section][indexPath.row][@"title"];
        cell.imageView.image = IMAGE(self.items[indexPath.section][indexPath.row][@"image"]);
        cell.detailTextLabel.text = self.items[indexPath.section][indexPath.row][@"detail"];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self cellSelectedWithIndexPath:indexPath];
}


@end
