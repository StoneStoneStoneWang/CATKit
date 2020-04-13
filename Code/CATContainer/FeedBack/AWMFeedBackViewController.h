//
//  AWMFeedBackViewController.h
//  AWMContainer
//
//  Created by 王磊 on 2020/3/30.
//  Copyright © 2020 王磊. All rights reserved.
//
#import "AWMConfig.h"
@import AWMBridge;
@import AWMTransition;

NS_ASSUME_NONNULL_BEGIN

typedef void(^AWMFeedBackBlock)(AWMBaseViewController *from);

@interface AWMFeedBackViewController : AWMTViewController

+ (instancetype)createFeedBackWithBlock:(AWMFeedBackBlock)block;

@end

NS_ASSUME_NONNULL_END
