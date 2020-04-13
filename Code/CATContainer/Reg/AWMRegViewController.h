//
//  AWMRegViewController.h
//  AWMContainer
//
//  Created by 王磊 on 2020/3/29.
//  Copyright © 2020 王磊. All rights reserved.
//

#import "AWMConfig.h"
@import AWMBridge;
@import AWMTransition;

NS_ASSUME_NONNULL_BEGIN
typedef void(^AWMRegBlock)(AWMRegActionType actionType ,AWMBaseViewController *from);
@interface AWMRegViewController : AWMTViewController

+ (instancetype)createRegWithBlock:(AWMRegBlock) block;
@end

NS_ASSUME_NONNULL_END
