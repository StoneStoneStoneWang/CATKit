//
//  AWMUserInfoViewController.h
//  AWMContainer
//
//  Created by 王磊 on 2020/3/29.
//  Copyright © 2020 王磊. All rights reserved.
//
#import "AWMConfig.h"
@import AWMBridge;
@import AWMTable;

NS_ASSUME_NONNULL_BEGIN

@interface AWMUserInfoTableViewCell : AWMBaseTableViewCell

@property (nonatomic ,strong) AWMUserInfoBean *userInfo;

@end

typedef NS_ENUM(NSInteger, AWMUserInfoActionType) {
    AWMUserInfoActionTypeName,
    AWMUserInfoActionTypeSignature,
};

typedef void(^AWMUserInfoBlock)(AWMUserInfoActionType actionType ,AWMBaseViewController *from);

@interface AWMUserInfoViewController : AWMTableNoLoadingViewController

+ (instancetype)createUserInfoWithBlock:(AWMUserInfoBlock )block;

- (void)updateName:(NSString *)name;

- (void)updateSignature:(NSString *)signature;

@end

NS_ASSUME_NONNULL_END
