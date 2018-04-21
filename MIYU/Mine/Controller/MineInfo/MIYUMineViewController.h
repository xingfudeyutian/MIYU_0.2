//
//  MIYUMineViewController.h
//  MIYU
//
//  Created by hanyutong on 2018/1/4.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUBaseViewController.h"
#import "MIYUADScrollView.h"

@interface MIYUMineViewController : MIYUBaseViewController

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray * items;
@property (nonatomic, strong) MIYUADScrollView * adScrollView;

- (void)cellSelectedWithIndexPath:(NSIndexPath *)indexPath;


@end
