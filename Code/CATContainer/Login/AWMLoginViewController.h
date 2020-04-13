//
//  AWMLoginViewController.h
//  AWMContainer
//
//  Created by 王磊 on 2020/3/29.
//  Copyright © 2020 王磊. All rights reserved.
//


#import "AWMConfig.h"
@import AWMBridge;
@import AWMTransition;
NS_ASSUME_NONNULL_BEGIN

typedef void(^AWMLoginBlock)(AWMLoginActionType actionType ,AWMBaseViewController *from);
@interface AWMLoginViewController : AWMTViewController

+ (instancetype)createLoginWithBlock:(AWMLoginBlock)block;

@end

NS_ASSUME_NONNULL_END
