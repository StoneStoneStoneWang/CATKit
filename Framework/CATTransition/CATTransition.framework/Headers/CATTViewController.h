//
//  CATTViewController.h
//  ZTransiton
//
//  Created by three stone 王 on 2019/8/22.
//  Copyright © 2019 three stone 王. All rights reserved.
//

#import <UIKit/UIKit.h>
@import CATBase;
NS_ASSUME_NONNULL_BEGIN

@interface CATTViewController : CATBaseViewController 

@property(nonatomic,strong,readonly) UIPercentDrivenInteractiveTransition *CATInteractivePopTransition;

@property (nonatomic ,assign) BOOL canPanResponse;

- (void)handlePopRecognizer:(UIPanGestureRecognizer *)recognizer;

@end

NS_ASSUME_NONNULL_END
