//
//  AWMFindPasswordViewController.h
//  AWMContainer
//
//  Created by 王磊 on 2020/3/29.
//  Copyright © 2020 王磊. All rights reserved.
//
#import "AWMConfig.h"
@import AWMBridge;
@import AWMTransition;
NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger , AWMFindPasswordActionType) {
    
     AWMFindPasswordActionTypeBack,
    
     AWMFindPasswordActionTypeFind
};

typedef void(^AWMFindPassworBlock)(AWMBaseViewController *from ,AWMFindPasswordActionType actionType);
@interface AWMFindPasswordViewController : AWMTViewController

+ (instancetype)createPasswordWithBlock:(AWMFindPassworBlock )block;

@end

NS_ASSUME_NONNULL_END
