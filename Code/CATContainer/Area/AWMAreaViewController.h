//
//  AWMAreaViewController.h
//  ZFragment
//
//  Created by three stone 王 on 2020/3/21.
//  Copyright © 2020 three stone 王. All rights reserved.
//

@import AWMTable;
@import AWMBridge;
#import "AWMConfig.h"
NS_ASSUME_NONNULL_BEGIN

typedef void(^AWMAreaBlock)(AWMBaseViewController *from ,AWMAreaBean *selectedArea ,AWMAreaType type ,BOOL hasNext);

@interface AWMAreaViewController : AWMTableNoLoadingViewController

+ (instancetype)createAreaWithType:(AWMAreaType )type andAreaBlock:(AWMAreaBlock) block;

- (void)selectedArea:(NSInteger )sid andBlock:(AWMAreaBlock)block;

- (void)updateAreas:(NSInteger )sid ;

- (AWMAreaBean *)fetchAreaWithId:(NSInteger)sid ;
@end

NS_ASSUME_NONNULL_END
