//
//  CATNameViewController.h
//  CATContainer
//
//  Created by 王磊 on 2020/3/29.
//  Copyright © 2020 王磊. All rights reserved.
//

#import "CATConfig.h"
@import CATBridge;
@import CATTransition;

NS_ASSUME_NONNULL_BEGIN

typedef void(^CATNameBlock)(CATNameActionType actionType ,CATBaseViewController *from);

@interface CATNameViewController : CATTViewController

+ (instancetype)createNickNameWithBlock:(CATNameBlock)block;

@end

NS_ASSUME_NONNULL_END
