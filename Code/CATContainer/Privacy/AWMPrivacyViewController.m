//
//  AWMPrivacyViewController.m
//  AWMContainer
//
//  Created by 王磊 on 2020/3/29.
//  Copyright © 2020 王磊. All rights reserved.
//

#import "AWMPrivacyViewController.h"
@import SToolsKit;
@interface AWMPrivacyViewController ()

@property (nonatomic ,strong) AWMProtocolBridge *bridge;

#if AWMUserInfoOne

#elif AWMUserInfoTwo

#elif AWMUserInfoThree

@property (nonatomic ,strong) UIView *topLine;
#else


#endif
@end

@implementation AWMPrivacyViewController

#if AWMUserInfoOne

#elif AWMUserInfoTwo

#elif AWMUserInfoThree

- (UIView *)topLine {
    if (!_topLine) {
        
        _topLine = [UIView new];
    }
    return _topLine;
}
#else


#endif
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
#if AWMPROFILEALPHA
    
    [self.navigationController setNavigationBarHidden:false];
#endif
}


+ (instancetype)createPrivacy {
    
    return [self new];
}

- (void)configViewModel {
    
    self.bridge = [AWMProtocolBridge new];
    
    [self.bridge createProtocol:self] ;
}
- (void)addOwnSubViews {
    [super addOwnSubViews];
#if AWMUserInfoOne
    
    
#elif AWMUserInfoTwo
    
#elif AWMUserInfoThree
    
    [self.view addSubview:self.topLine];
#else
    
    
#endif
    
    
}
- (void)configOwnSubViews {
    [super configOwnSubViews];
    
    
#if AWMUserInfoOne
    
#elif AWMUserInfoTwo
    
    
#elif AWMUserInfoThree
    
    self.topLine.backgroundColor = [UIColor s_transformToColorByHexColorStr:@AWMColor];
    
    if ([self.navigationController.viewControllers.firstObject isKindOfClass:NSClassFromString(@"AWMLoginViewController")]) {
        
        CGFloat h = CGRectGetHeight(self.navigationController.navigationBar.bounds);
        
        self.topLine.frame = CGRectMake(15, h, CGRectGetWidth(self.view.bounds) - 30, 8);
        
    } else {
        
        CGFloat h = KTOPLAYOUTGUARD;
        
        self.topLine.frame = CGRectMake(15, h, CGRectGetWidth(self.view.bounds) - 30, 8);
    }
    
    CGRect initFrame = self.textView.frame;
    
    CGRect finalFrame = CGRectOffset(initFrame, 0, 8);
    
    self.textView.frame = finalFrame;
    
#else
    
    
#endif
}
- (void)configOwnProperties {
    [super configOwnProperties];
    
#if AWMUserInfoOne
    
#elif AWMUserInfoTwo
    
    self.textView.backgroundColor = [UIColor whiteColor];
    
    self.view.backgroundColor = [UIColor s_transformToColorByHexColorStr:@AWMColor];
    
    self.textView.layer.masksToBounds = false;
    
#elif AWMUserInfoThree
    
    
#else
    
    
#endif
    
}

- (void)configNaviItem {
    
    self.title = @"隐私与协议";
}
- (BOOL)canPanResponse {
    return true;
}

@end
