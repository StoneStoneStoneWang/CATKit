//
//  AWMAddressSelectedViewController.h
//  ZFragment
//
//  Created by three stone 王 on 2020/3/21.
//  Copyright © 2020 three stone 王. All rights reserved.
//
#import "AWMConfig.h"
@import AWMTable;
@import AWMBean;
@import AWMBridge;
NS_ASSUME_NONNULL_BEGIN

typedef void(^AWMAddressSelectedBlock)(AWMAddressActionType actionType,AWMAddressBean *_Nullable address ,NSIndexPath *_Nullable ip ,AWMBaseViewController *from);

@interface AWMAddressSelectedViewController : AWMTableLoadingViewController

+ (instancetype)createAddressSelectedWithBlock:(AWMAddressSelectedBlock) addressBlock;

- (void)updateAddress:(AWMAddressBean *)addressBean andIp:(NSIndexPath *)ip;

- (void)insertAddress:(AWMAddressBean *)addressBean;

@end

NS_ASSUME_NONNULL_END
