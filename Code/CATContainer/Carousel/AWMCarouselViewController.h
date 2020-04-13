//
//  AWMCarouselViewController.h
//  AWMContainer
//
//  Created by 王磊 on 2020/3/31.
//  Copyright © 2020 王磊. All rights reserved.
//
#import "AWMConfig.h"
@import AWMCollection;

NS_ASSUME_NONNULL_BEGIN

@interface AWMCarouselViewController : AWMCollectionNoLoadingViewController

+ (instancetype)createCarousel;

@end

NS_ASSUME_NONNULL_END
