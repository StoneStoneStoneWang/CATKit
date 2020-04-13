//
//  AWMSettingViewController.h
//  AWMContainer
//
//  Created by 王磊 on 2020/3/29.
//  Copyright © 2020 王磊. All rights reserved.
//

#import "AWMConfig.h"
@import AWMBridge;
@import AWMTable;

NS_ASSUME_NONNULL_BEGIN

@interface AWMSettingTableViewCell : AWMBaseTableViewCell

@property (nonatomic ,strong) AWMSettingBean *setting;

@end

typedef void(^AWMSettingBlock)(AWMSettingActionType actionType ,AWMBaseViewController *from);

@interface AWMSettingViewController : AWMTableNoLoadingViewController

+ (instancetype)createSettingWithBlock:(AWMSettingBlock) block;

- (void)updateTableData;
@end

NS_ASSUME_NONNULL_END
