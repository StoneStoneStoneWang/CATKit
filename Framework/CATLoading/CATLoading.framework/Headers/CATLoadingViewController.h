//
//  CATLoadingViewController.h
//  TSUIKit
//
//  Created by three stone 王 on 2018/7/10.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

@import CATTransition;
#import "CATLoadingView.h"
@interface CATLoadingViewController : CATTViewController

@property (nonatomic ,strong ,readonly) CATLoadingView *loadingView;

@property (nonatomic ,assign) CATLoadingStatus loadingStatus;

// 重新加载
- (void)onReloadItemClick;

@end
