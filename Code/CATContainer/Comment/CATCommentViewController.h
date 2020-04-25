//
//  CATCommentViewController.h
//  ZFragment
//
//  Created by three stone 王 on 2019/9/16.
//  Copyright © 2019 three stone 王. All rights reserved.
//

#import <CATTable/CATTable.h>
@import CATBean;
#import "CATConfig.h"
NS_ASSUME_NONNULL_BEGIN

@class CATCommentViewController;

typedef NS_ENUM(NSInteger ,CATCommentActionType) {
    
    CATCommentActionTypeUnLogin,
    
    CATCommentActionTypeComment,
    
    CATCommentActionTypeReport
    
};

typedef void(^CATCommentBlock)(CATCommentViewController *from ,CATCommentActionType type ,CATCircleBean *circleBean);

@protocol CATCommentTableViewCellDelegate <NSObject>

- (void)onMoreItemClick:(CATCommentBean *)comment;

@end

@interface CATCommentTableViewCell : CATBaseTableViewCell

@property (nonatomic ,strong) CATCommentBean *comment;

@property (nonatomic ,weak) id <CATCommentTableViewCellDelegate>mDelegate;

@end

@interface CATCommentTotalTableViewCell : CATCommentTableViewCell


@end

@interface CATCommentRectangleTableViewCell : CATCommentTableViewCell

@end

@interface CATCommentNoMoreTableViewCell : CATCommentTableViewCell

@end

@interface CATCommentFailedTableViewCell : CATCommentTableViewCell

@end

@interface CATCommentEmptyTableViewCell : CATCommentTableViewCell

@end

@interface CATCommentContentTableViewCell : CATCommentTableViewCell


@end

@interface CATCommentViewController : CATTableLoadingViewController

+ (instancetype)createCommentWithEncode:(NSString *)encode andCircleBean:(CATCircleBean *)circleBean andOp:(CATCommentBlock) block;

@property (nonatomic ,strong ,readonly) UIView *bottomBar;

@end

NS_ASSUME_NONNULL_END
