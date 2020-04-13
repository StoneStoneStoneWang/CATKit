//
//  CATBaseTableViewCell.h
//  ZTable
//
//  Created by three stone 王 on 2019/8/27.
//  Copyright © 2019 three stone 王. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger ,CATBottomLineType) {
    
    CATBottomLineTypeNormal NS_SWIFT_NAME(normal),
    
    CATBottomLineTypeNone NS_SWIFT_NAME(none) ,
    
    CATBottomLineTypeCustom NS_SWIFT_NAME(custom)
};

@interface CATBaseTableViewCell : UITableViewCell

@property (nonatomic ,strong ,readonly) UIImageView *bottomView;

@property (nonatomic ,assign) CATBottomLineType bottomLineType;

- (void)commitInit;
@end

NS_ASSUME_NONNULL_END
