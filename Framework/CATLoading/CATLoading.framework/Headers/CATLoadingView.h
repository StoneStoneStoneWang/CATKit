//
//  CATLoadingView.h
//  TSUIKit
//
//  Created by three stone 王 on 2018/7/10.
//  Copyright © 2018年 three stone 王. All rights reserved.
//
@import UIKit;
@import CATTransition;

typedef NS_ENUM(NSInteger,CATLoadingStatus) {
    
    CATLoadingStatusBegin,
    
    CATLoadingStatusLoading,
    
    CATLoadingStatusSucc,
    
    CATLoadingStatusFail,
    
    CATLoadingStatusReload
};

@protocol CATLoadingViewDelegate <NSObject>

- (void)onReloadItemClick;

@end

@interface CATLoadingView : UIView

+ (instancetype)loadingWithContentViewController:(CATTViewController *)contentViewController;

/*
 设置加载状态
 CATLoadingStatusBegin 请在viewwillappear里
 CATLoadingStatusLoading 请在设置begin之后 viewwillappear里
 CATLoadingStatusSucc 加载成功
 CATLoadingStatusFail 加载失败
 CATLoadingStatusReload 重新加载 屏幕上有 点击屏幕重新加载按钮
 */
@property (nonatomic ,assign ,readonly) BOOL isLoading;

@property (nonatomic ,assign)CATLoadingStatus status;

- (void)changeLoadingStatus:(CATLoadingStatus )status;

@property (nonatomic ,weak) id<CATLoadingViewDelegate> mDelegate;


@end
