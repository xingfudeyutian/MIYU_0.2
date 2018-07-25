//
//  MIYUFeedBackImageCell.m
//  MIYU
//
//  Created by hanyutong on 2018/5/22.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUFeedBackImageCell.h"


@interface MIYUFeedBackImageCell ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) UIButton * addButton;

@end

@implementation MIYUFeedBackImageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
