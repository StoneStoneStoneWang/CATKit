//
//  AWMAreaHeaderViewController.h
//  ZFragment
//
//  Created by three stone 王 on 2020/3/21.
//  Copyright © 2020 three stone 王. All rights reserved.
//


#import "AWMConfig.h"
@import AWMCollection;
@import AWMBean;
NS_ASSUME_NONNULL_BEGIN

typedef void(^AWMAreaHeaderBlock)(AWMBaseViewController *from ,AWMAreaBean *pArea ,AWMAreaBean *cArea ,AWMAreaBean *_Nullable rArea);

@interface AWMAreaHeaderViewController : AWMCollectionNoLoadingViewController

+ (instancetype)createAreaHeaderWithPid:(NSInteger)pid andCid:(NSInteger)cid andRid:(NSInteger )rid andAreaHeaderBlock:(AWMAreaHeaderBlock) block;

@end

@interface AWMAreaPresentAnimation : NSObject <UIViewControllerAnimatedTransitioning>


@end

@interface AWMAreaDismissAnimation : NSObject <UIViewControllerAnimatedTransitioning>


@end

NS_ASSUME_NONNULL_END
