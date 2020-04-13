//
//  CATTableNoLoadingViewController.h
//  ZContainer
//
//  Created by three stone 王 on 2019/8/22.
//  Copyright © 2019 three stone 王. All rights reserved.
//

@import CATTransition;
#import "CATTableHeaderView.h"
NS_ASSUME_NONNULL_BEGIN

@interface CATTableNoLoadingViewController : CATTViewController

@property (nonatomic ,strong) UITableView *tableView;

- (UITableViewCell *)configTableViewCell:(id)data forIndexPath:(NSIndexPath *)ip ;

- (UIView *)configTableViewSectionHeader:(id)data forSection:(NSInteger)section ;

- (CGFloat )caculateForCell:(id )data forIndexPath:(NSIndexPath *)ip;

- (void)tableViewSelectData:(id)data forIndexPath:(NSIndexPath *)ip;

@property (nonatomic ,strong) CATTableHeaderView *headerView;

@end


NS_ASSUME_NONNULL_END
