//
//  MIYUBarrageViewController.m
//  MIYU
//
//  Created by hanyutong on 2018/3/27.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUBarrageViewController.h"
#import "OCBarrageMixedImageAndTextCell.h"


@interface MIYUBarrageViewController ()

@property (nonatomic, strong) OCBarrageManager *barrageManager;

@end

@implementation MIYUBarrageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.barrageManager = [[OCBarrageManager alloc] init];
    self.barrageManager.renderView.frame = self.view.frame;
    self.barrageManager.renderView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.barrageManager.renderView];
    self.view.backgroundColor = [UIColor clearColor];
 
}

- (void)viewDidDisappear:(BOOL)animated {
  [super viewDidDisappear:animated];
  [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(addMixedImageAndTextBarrage) object:nil];
}

- (void)addBarrage {
  [self performSelector:@selector(addMixedImageAndTextBarrage) withObject:nil afterDelay:0.5];
}

- (void)addNormalBarrage {

  OCBarrageTextDescriptor *textDescriptor = [[OCBarrageTextDescriptor alloc] init];
  textDescriptor.text = [NSString stringWithFormat:@"这是一条弹幕...."];
  textDescriptor.textColor = [UIColor whiteColor];
  textDescriptor.positionPriority = OCBarragePositionLow;
  textDescriptor.textFont = [UIFont systemFontOfSize:14.0];
  textDescriptor.strokeColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
  textDescriptor.strokeWidth = -1;
  textDescriptor.animationDuration = arc4random()%5 + 5;
  textDescriptor.barrageCellClass = [OCBarrageTextCell class];

  [self.barrageManager renderBarrageDescriptor:textDescriptor];

  [self performSelector:@selector(addNormalBarrage) withObject:nil afterDelay:1];
}

- (void)addMixedImageAndTextBarrage {
  OCBarrageTextDescriptor *imageAndTextDescriptor = [[OCBarrageTextDescriptor alloc] init];
  YYImage *image = [YYImage imageNamed:@"info.png"];
  image.preloadAllAnimatedImageFrames = YES;
  YYAnimatedImageView *imageView = [[YYAnimatedImageView alloc] init];
  [imageView setImageWithURL:[NSURL URLWithString:@"https://i.loli.net/2017/11/09/5a046546a2a1f.jpg"] placeholder:image];
  imageView.width = 25;
  imageView.height = 25;
  imageView.clipsToBounds = YES;
  imageView.layer.borderColor = [UIColor blackColor].CGColor;
  imageView.layer.borderWidth = 1.0f;
  imageView.layer.cornerRadius = 12.5;
  //头像
  NSMutableAttributedString *mAttributedString = [NSMutableAttributedString attachmentStringWithContent:imageView contentMode:UIViewContentModeCenter attachmentSize:imageView.size alignToFont:[UIFont boldSystemFontOfSize:20.0] alignment:YYTextVerticalAlignmentCenter];
  //名字
  [mAttributedString appendAttributedString:[[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"诶呀妈呀:"] attributes:@{NSForegroundColorAttributeName:COLOR_YELLOW}]];
  //内容
  [mAttributedString appendAttributedString:[[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"发个弹幕发个"] attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}]];

  [mAttributedString addAttribute:NSStrokeWidthAttributeName value:[NSNumber numberWithInteger:-1] range:NSMakeRange(0, mAttributedString.length)];
  [mAttributedString addAttribute:NSStrokeColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, mAttributedString.length)];
  [mAttributedString addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:15.0] range:NSMakeRange(0, mAttributedString.length)];
  imageAndTextDescriptor.attributedText = mAttributedString;
  imageAndTextDescriptor.positionPriority = OCBarragePositionHigh;
  imageAndTextDescriptor.animationDuration = arc4random()%5 + 5;;
  imageAndTextDescriptor.barrageCellClass = [OCBarrageMixedImageAndTextCell class];
  [self.barrageManager renderBarrageDescriptor:imageAndTextDescriptor];

  [self performSelector:@selector(addMixedImageAndTextBarrage) withObject:nil afterDelay:2.0];
}
- (void)startBarrage {
  [self.barrageManager start];
  [self addBarrage];
}
- (void)stopBarrage {
  [self.barrageManager stop];
  [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(addBarrage) object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}





@end
