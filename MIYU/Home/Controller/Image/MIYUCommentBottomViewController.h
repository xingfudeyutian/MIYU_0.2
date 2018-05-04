//
//  MIYUCommentBottomViewController.h
//  MIYU
//
//  Created by hanyutong on 2018/5/4.
//  Copyright © 2018年 hanyutong. All rights reserved.
//

#import "MIYUBaseViewController.h"


typedef void(^CommentBottomViewChangedHeight)(CGFloat height);
@interface MIYUCommentBottomViewController : MIYUBaseViewController

@property (nonatomic, copy) CommentBottomViewChangedHeight changedHeightBlock;

-(BOOL)resignFirstResponder;
@end
