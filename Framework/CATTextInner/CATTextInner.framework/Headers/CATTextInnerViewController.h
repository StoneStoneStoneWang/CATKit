//
//  CATTextInnerViewController.h
//  ZTextInner
//
//  Created by three stone 王 on 2020/3/26.
//  Copyright © 2020 three stone 王. All rights reserved.
//

@import CATLoading;

NS_ASSUME_NONNULL_BEGIN

@interface CATTextInnerViewController : CATLoadingViewController

- (void)CATLoadHtmlString:(NSString *)htmlString NS_SWIFT_NAME(CATLoadHtmlString(htmlString:));

@property (nonatomic ,strong ,readonly) UITextView *textView;

@end

NS_ASSUME_NONNULL_END
