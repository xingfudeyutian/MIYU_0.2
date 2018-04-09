//
//  CardItem2.m
//  Card
//
//  Created by D on 17/1/6.
//  Copyright © 2017年 D. All rights reserved.


#import "CardItem2.h"


@interface CardItem2 ()

@property (weak, nonatomic) IBOutlet UIView * bgView;
@property (weak, nonatomic) IBOutlet UIView * alphaMaskView;

@end


@implementation CardItem2

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    //self.bgView.layer.cornerRadius  = 5;
    
    self.layer.shadowColor   = [UIColor blackColor].CGColor;
    self.layer.shadowOffset  = CGSizeMake(0, 5);
    self.layer.shadowOpacity = 0.8;
    self.layer.shadowRadius  = 5;
}

- (void)addAlphaMaskView
{
    self.alphaMaskView.alpha = 0.3;
}

- (void)removeAlphaMaskView
{
    self.alphaMaskView.alpha = 0.3;
}

@end
