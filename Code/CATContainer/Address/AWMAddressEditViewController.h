//
//  AWMAddressEditViewController.h
//  ZFragment
//
//  Created by three stone 王 on 2020/3/21.
//  Copyright © 2020 three stone 王. All rights reserved.
//

@import AWMTable;
#import "AWMConfig.h"
@import AWMBean;
@import AWMBridge;
NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger ,AWMAddressEditActionType) {
    
    AWMAddressEditActionTypeArea,
    
    AWMAddressEditActionTypeCompleted
};

typedef void(^AWMAddressEditBlock)(AWMBaseViewController *from,AWMAddressEditActionType actionType, AWMAddressBean *_Nullable addressBean ,AWMAddressEditBean *_Nullable addressEditBean);

@interface AWMAddressEditTableViewCell : AWMBaseTableViewCell


@end

@interface AWMAddressEditViewController : AWMTableNoLoadingViewController

+ (instancetype)creatAddressEditWithAddressBean:(AWMAddressBean *_Nullable)addressBean andAddressEditBlock:(AWMAddressEditBlock) block ;

- (void)updateAddressEditArea:(AWMAddressEditBean *) addressEditBean;

@end

NS_ASSUME_NONNULL_END
