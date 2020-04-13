//
//  AWMWelcomeViewController.h
//  AWMContainer
//
//  Created by 王磊 on 2020/3/29.
//  Copyright © 2020 王磊. All rights reserved.
//

@import AWMCollection;
#import "AWMConfig.h"
NS_ASSUME_NONNULL_BEGIN

@interface AWMWelcomeCollectionViewCell : UICollectionViewCell

@property (nonatomic ,copy) NSString *icon;

@end

typedef void(^AWMWelcomeBlock)(AWMBaseViewController *from);

@interface AWMWelcomeViewController : AWMCollectionNoLoadingViewController

+ (instancetype)createWelcomeWithSkipBlock:(AWMWelcomeBlock )block;

@end

NS_ASSUME_NONNULL_END
