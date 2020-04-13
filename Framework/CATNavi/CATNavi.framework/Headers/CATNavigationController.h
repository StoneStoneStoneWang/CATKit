//
//  CATNavigationController.h
//  ZNavi
//
//  Created by three stone 王 on 2019/8/22.
//  Copyright © 2019 three stone 王. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UINavigationBar+CAT.h"
#import "UIBarButtonItem+CAT.h"

NS_ASSUME_NONNULL_BEGIN

@protocol CATNavigationConfig <NSObject>

@property (nonatomic ,assign) CGFloat CATFontSize;

@property (nonatomic ,strong) UIColor *CATNormalTitleColor;

@property (nonatomic ,strong) UIColor *CATLoginTitleColor;

@property (nonatomic ,strong) UIColor *CATNormalBackgroundColor;

@property (nonatomic ,strong) UIColor *CATLoginBackgroundColor;

@property (nonatomic ,copy) NSString *CATNormalBackImage;

@property (nonatomic ,copy) NSString *CATLoginBackImage;

@end

@interface CATNavigationController : UINavigationController

+ (void)initWithConfig:(id <CATNavigationConfig>) config;

@end

NS_ASSUME_NONNULL_END
