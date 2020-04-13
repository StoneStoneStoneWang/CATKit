//
//  AWMNameViewController.h
//  AWMContainer
//
//  Created by 王磊 on 2020/3/29.
//  Copyright © 2020 王磊. All rights reserved.
//

#import "AWMConfig.h"
@import AWMBridge;
@import AWMTransition;

NS_ASSUME_NONNULL_BEGIN

typedef void(^AWMNameBlock)(AWMNameActionType actionType ,AWMBaseViewController *from);

@interface AWMNameViewController : AWMTViewController

+ (instancetype)createNickNameWithBlock:(AWMNameBlock)block;

@end

NS_ASSUME_NONNULL_END
