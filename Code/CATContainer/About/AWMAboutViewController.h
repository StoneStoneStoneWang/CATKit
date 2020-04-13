//
//  AWMAboutViewController.h
//  AWMContainer
//
//  Created by 王磊 on 2020/3/30.
//  Copyright © 2020 王磊. All rights reserved.
//


#import "AWMConfig.h"
@import AWMBridge;
@import AWMTable;
NS_ASSUME_NONNULL_BEGIN

@interface AWMAboutTableHeaderView : AWMTableHeaderView

@end

@interface AWMAboutTableViewCell : AWMBaseTableViewCell

@property (nonatomic ,strong) AWMAboutBean *about;

@end

@interface AWMAboutViewController : AWMTableNoLoadingViewController

+ (instancetype)createAbout;

@end

NS_ASSUME_NONNULL_END
