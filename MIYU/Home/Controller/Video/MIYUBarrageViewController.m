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

    [self.barrageManager start];
    [self startBarrage];
}

- (void)viewDidDisappear:(BOOL)animated {
  [super viewDidDisappear:animated];

//  [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(addNormalBarrage) object:nil];
  [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(addMixedImageAndTextBarrage) object:nil];

}

- (void)addBarrage {
//  [self performSelector:@selector(addNormalBarrage) withObject:nil afterDelay:0.5];
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

//  CGFloat rate = 7.0;
//  NSString *path = [[NSBundle mainBundle] pathForScaledResource:@"info" ofType:@"png"];
//  NSData *data = [NSData dataWithContentsOfFile:path];
  YYImage *image = [YYImage imageNamed:@"info"];
//  YYImage *image = [YYImage imageWithData:data scale:rate];
  image.preloadAllAnimatedImageFrames = YES;
  YYAnimatedImageView *imageView = [[YYAnimatedImageView alloc] initWithImage:image];
  imageView.width = 25;
  imageView.height = 25;
  imageView.layer.borderColor = [UIColor blackColor].CGColor;
  imageView.layer.borderWidth = 1.0f;
  imageView.layer.cornerRadius = 10;

  NSMutableAttributedString *mAttributedString = [NSMutableAttributedString attachmentStringWithContent:imageView contentMode:UIViewContentModeCenter attachmentSize:imageView.size alignToFont:[UIFont boldSystemFontOfSize:20.0] alignment:YYTextVerticalAlignmentCenter];

  [mAttributedString appendAttributedString:[[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"诶呀妈呀:"] attributes:@{NSForegroundColorAttributeName:COLOR_YELLOW}]];

//  YYImage *image2 = [YYImage imageWithData:data scale:rate];
//  image2.preloadAllAnimatedImageFrames = YES;
//  YYAnimatedImageView *imageView2 = [[YYAnimatedImageView alloc] initWithImage:image2];
//
//  NSMutableAttributedString *attachText2 = [NSMutableAttributedString attachmentStringWithContent:imageView2 contentMode:UIViewContentModeCenter attachmentSize:imageView2.size alignToFont:[UIFont boldSystemFontOfSize:25.0] alignment:YYTextVerticalAlignmentCenter];
//  [mAttributedString appendAttributedString:attachText2];
//
  [mAttributedString appendAttributedString:[[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"发个粑粑弹幕发个"] attributes:@{NSForegroundColorAttributeName:COLOR_YELLOW}]];
//
//  YYImage *image3 = [YYImage imageWithData:data scale:rate];
//  image3.preloadAllAnimatedImageFrames = YES;
//  YYAnimatedImageView *imageView3 = [[YYAnimatedImageView alloc] initWithImage:image2];
//
//  NSMutableAttributedString *attachText3 = [NSMutableAttributedString attachmentStringWithContent:imageView3 contentMode:UIViewContentModeCenter attachmentSize:imageView3.size alignToFont:[UIFont boldSystemFontOfSize:25.0] alignment:YYTextVerticalAlignmentCenter];
//  [mAttributedString appendAttributedString:attachText3];

  [mAttributedString addAttribute:NSStrokeWidthAttributeName value:[NSNumber numberWithInteger:-1] range:NSMakeRange(0, mAttributedString.length)];
  [mAttributedString addAttribute:NSStrokeColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, mAttributedString.length)];
  [mAttributedString addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:20.0] range:NSMakeRange(0, mAttributedString.length)];
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














- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}





@end
