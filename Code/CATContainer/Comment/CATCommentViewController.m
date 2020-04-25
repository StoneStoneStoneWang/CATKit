//
//  CATCommentViewController.m
//  ZFragment
//
//  Created by three stone 王 on 2019/9/16.
//  Copyright © 2019 three stone 王. All rights reserved.
//

#import "CATCommentViewController.h"

@import CATCache;
@import JXTAlertManager;
@import SToolsKit;
@import Masonry;
@import CATBridge;
@import SDWebImage;

@interface CATCommentTableViewCell ()


@end

@implementation CATCommentTableViewCell


@end

@interface CATCommentTotalTableViewCell ()

@property (nonatomic ,strong) UILabel *titleLabel;
@end

@implementation CATCommentTotalTableViewCell

- (UILabel *)titleLabel {
    
    if (!_titleLabel) {
        
        _titleLabel = [UILabel new];
        
        _titleLabel.numberOfLines = 1;
        
        _titleLabel.text = @"全部评论";
        
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        
        _titleLabel.textColor = [UIColor whiteColor];
    }
    return _titleLabel;
}

- (void)commitInit {
    [super commitInit];
    
    [self.contentView addSubview:self.titleLabel];
    
    self.backgroundColor = [UIColor s_transformTo_AlphaColorByHexColorStr:@"#ffffff30"];;
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self);
        
        make.left.mas_equalTo(15);
    }];
}
@end

@interface CATCommentRectangleTableViewCell ()

@end

@implementation CATCommentRectangleTableViewCell

- (void)commitInit {
    [super commitInit];
    
    self.backgroundColor = [UIColor clearColor];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

@end

@interface CATCommentNoMoreTableViewCell ()

@property (nonatomic ,strong) UILabel *titleLabel;

@end

@implementation CATCommentNoMoreTableViewCell

- (UILabel *)titleLabel {
    
    if (!_titleLabel) {
        
        _titleLabel = [UILabel new];
        
        _titleLabel.numberOfLines = 1;
        
        _titleLabel.font = [UIFont systemFontOfSize:13];
        
        _titleLabel.text = @"没有更多数据了";
        
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        
        _titleLabel.textColor = [UIColor whiteColor];
    }
    return _titleLabel;
}

- (void)commitInit {
    [super commitInit];
    
    self.backgroundColor = [UIColor s_transformTo_AlphaColorByHexColorStr:@"#ffffff30"];;
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [self.contentView addSubview:self.titleLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.equalTo(self);
    }];
}

@end

@interface CATCommentFailedTableViewCell ()

@property (nonatomic ,strong) UILabel *titleLabel;

@end

@implementation CATCommentFailedTableViewCell

- (UILabel *)titleLabel {
    
    if (!_titleLabel) {
        
        _titleLabel = [UILabel new];
        
        _titleLabel.numberOfLines = 1;
        
        _titleLabel.font = [UIFont systemFontOfSize:13];
        
        _titleLabel.text = @"网络错误,点击重新拉取";
        
        _titleLabel.textColor = [UIColor s_transformToColorByHexColorStr:@CATColor];
        
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (void)commitInit {
    [super commitInit];
    
    self.backgroundColor = [UIColor s_transformTo_AlphaColorByHexColorStr:@"#ffffff30"];;
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [self.contentView addSubview:self.titleLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.equalTo(self);
    }];
}

@end

@interface CATCommentEmptyTableViewCell ()

@property (nonatomic ,strong) UILabel *titleLabel;

@end

@implementation CATCommentEmptyTableViewCell

- (UILabel *)titleLabel {
    
    if (!_titleLabel) {
        
        _titleLabel = [UILabel new];
        
        _titleLabel.numberOfLines = 1;
        
        _titleLabel.font = [UIFont systemFontOfSize:13];
        
        _titleLabel.text = @"暂无评论";
        
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        
        _titleLabel.textColor = [UIColor whiteColor];
    }
    return _titleLabel;
}

- (void)commitInit {
    [super commitInit];
    
    self.backgroundColor = [UIColor s_transformTo_AlphaColorByHexColorStr:@"#ffffff30"];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [self.contentView addSubview:self.titleLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.equalTo(self);
    }];
}

@end

@interface CATCommentContentTableViewCell ()

@property (nonatomic ,strong) UILabel *titleLabel;

@property (nonatomic ,strong) UIImageView *iconImageView;

@property (nonatomic ,strong) UILabel *nameLabel;

@property (nonatomic ,strong) UILabel *timeLabel;

@property (nonatomic ,strong) UIButton *moreItem;

@property (nonatomic ,strong) CATCommentBean *commentBean;

@end

@implementation CATCommentContentTableViewCell

- (UIImageView *)iconImageView {
    
    if (!_iconImageView) {
        
        _iconImageView = [UIImageView new];
        
        _iconImageView.layer.cornerRadius = 20;
        
        _iconImageView.layer.masksToBounds = true;
    }
    return _iconImageView;
}
- (UILabel *)nameLabel {
    
    if (!_nameLabel) {
        
        _nameLabel = [UILabel new];
        
        _nameLabel.font = [UIFont systemFontOfSize:15];
        
        _nameLabel.textAlignment = NSTextAlignmentLeft;
        
        _nameLabel.textColor = [UIColor s_transformToColorByHexColorStr:@"#ffffff"];
        
    }
    return _nameLabel;
}
- (UILabel *)timeLabel {
    
    if (!_timeLabel) {
        
        _timeLabel = [UILabel new];
        
        _timeLabel.font = [UIFont systemFontOfSize:12];
        
        _timeLabel.textAlignment = NSTextAlignmentLeft;
        
        _timeLabel.textColor = [UIColor s_transformToColorByHexColorStr:@"#ffffff"];
        
    }
    return _timeLabel;
}
- (UILabel *)titleLabel {
    
    if (!_titleLabel) {
        
        _titleLabel = [UILabel new];
        
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        
        _titleLabel.font = [UIFont systemFontOfSize:13];
        
        _titleLabel.textColor = [UIColor s_transformToColorByHexColorStr:@"#ffffff"];
        
        _titleLabel.numberOfLines = 0;
        
    }
    return _titleLabel;
}

- (UIButton *)moreItem {
    
    if (!_moreItem) {
        
        _moreItem = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_moreItem setImage:[UIImage imageNamed:@"更多"] forState:UIControlStateNormal];
    }
    return _moreItem;
}

- (void)commitInit {
    [super commitInit];
    
    [self.contentView addSubview:self.iconImageView];
    
    [self.contentView addSubview:self.nameLabel];
    
    [self.contentView addSubview:self.timeLabel];
    
    [self.contentView addSubview:self.titleLabel];
    
    [self.contentView addSubview:self.moreItem];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.backgroundColor = [UIColor s_transformTo_AlphaColorByHexColorStr:@"#ffffff30"];;
    
    [self.moreItem addTarget:self action:@selector(onMoreItemClick) forControlEvents:UIControlEventTouchUpInside];
}
- (void)setComment:(CATCommentBean *)comment {
    
    self.commentBean = comment;
    
    self.nameLabel.text = comment.users.nickname;
    
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@?x-oss-process=image/resize,w_200,h_200",comment.users.headImg]] placeholderImage:[UIImage imageNamed:@CATLogoIcon] options:SDWebImageRefreshCached];
    
    self.timeLabel.text = [[NSString stringWithFormat:@"%ld",comment.intime / 1000] s_convertToDate:SDateTypeDateStyle];
    
    self.titleLabel.text = comment.content;
}
- (void)onMoreItemClick {
    
    if (self.mDelegate && [self.mDelegate respondsToSelector:@selector(onMoreItemClick:)]) {
        
        [self.mDelegate onMoreItemClick:self.commentBean];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.top.mas_equalTo(15);
        
        make.height.width.mas_equalTo(40);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.iconImageView.mas_right).offset(15);
        
        make.bottom.equalTo(self.iconImageView).offset(-1);
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.iconImageView.mas_right).offset(15);
        
        make.top.equalTo(self.iconImageView).offset(1);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.mas_equalTo(-40);
        
        make.left.equalTo(self.iconImageView.mas_right).offset(15);
        
        make.top.equalTo(self.iconImageView.mas_bottom).offset(15);
        
    }];
    
    [self.moreItem mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.mas_equalTo(-15);
        
        make.centerY.equalTo(self.iconImageView);
    }];
}

@end

#define BottomBar_Height KTABBAR_HEIGHT
@interface CATCommentViewController () <UITextFieldDelegate ,CATCommentTableViewCellDelegate>

@property (nonatomic ,strong) CATCommentBridge *bridge;

@property (nonatomic ,copy) NSString *encode;

@property (nonatomic ,strong ,readwrite) UIView *bottomBar;

@property (nonatomic ,strong) UITextField *editTF;

@property (nonatomic ,strong) UIButton *publishItem;

@property (nonatomic ,strong) UIButton *coverItem;

@property (nonatomic ,copy) CATCommentBlock block;

@property (nonatomic ,strong) CATCircleBean *circleBean;
@end

@implementation CATCommentViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setBackgroundColor:[UIColor s_transformToColorByHexColorStr:@CATColor]];
    
}

+ (instancetype)createCommentWithEncode:(NSString *)encode andCircleBean:(CATCircleBean *)circleBean andOp:(CATCommentBlock) block {
    
    return [[self alloc] initWithEncode:encode andCircleBean:circleBean andOp:block];
}
- (instancetype)initWithEncode:(NSString *)encode andCircleBean:(CATCircleBean *)circleBean andOp:(CATCommentBlock) block{
    
    if (self = [super init]) {
        
        self.encode = encode;
        
        self.block = block;
        
        self.circleBean = circleBean;
    }
    return self;
}

- (UIView *)bottomBar {
    
    if (!_bottomBar) {
        
        _bottomBar = [[UIView alloc] init];
        
        _bottomBar.backgroundColor = [UIColor s_transformTo_AlphaColorByHexColorStr:@"#ffffff30"];;
    }
    return _bottomBar;
}
- (UITextField *)editTF {
    
    if (!_editTF) {
        
        _editTF = [[UITextField alloc] initWithFrame:CGRectZero];
        
        _editTF.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入评论内容" attributes:@{NSForegroundColorAttributeName: [UIColor s_transformTo_AlphaColorByHexColorStr:@"#ffffff80"] }];
        
        _editTF.textColor = [UIColor whiteColor];
        
        _editTF.font = [UIFont systemFontOfSize:13];
        
        _editTF.delegate = self;
        
        _editTF.returnKeyType = UIReturnKeyDone;
    }
    return _editTF;
}

- (UIButton *)coverItem {
    
    if (!_coverItem) {
        
        _coverItem = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _coverItem;
}
- (UIButton *)publishItem {
    
    if (!_publishItem) {
        
        _publishItem = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_publishItem setTitle:@"发布" forState:UIControlStateNormal];
        
        [_publishItem setTitle:@"发布" forState:UIControlStateHighlighted];
        
        [_publishItem setTitleColor:[UIColor s_transformToColorByHexColorStr:@"#ffffff"] forState:UIControlStateNormal];
        
        [_publishItem setTitleColor:[UIColor s_transformToColorByHexColorStr:@"#ffffff"] forState:UIControlStateHighlighted];
        
        _publishItem.titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return _publishItem;
}

- (void)configOwnSubViews {
    
    [super configOwnSubViews];
    
    [self.tableView registerClass:[CATCommentRectangleTableViewCell class] forCellReuseIdentifier:@"rectangle"];
    
    [self.tableView registerClass:[CATCommentTotalTableViewCell class] forCellReuseIdentifier:@"total"];
    
    [self.tableView registerClass:[CATCommentNoMoreTableViewCell class] forCellReuseIdentifier:@"nomore"];
    
    [self.tableView registerClass:[CATCommentFailedTableViewCell class] forCellReuseIdentifier:@"failed"];
    
    [self.tableView registerClass:[CATCommentContentTableViewCell class] forCellReuseIdentifier:@"content"];
    
    [self.tableView registerClass:[CATCommentEmptyTableViewCell class] forCellReuseIdentifier:@"empty"];
    
    UIView *footer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KSSCREEN_WIDTH, BottomBar_Height)];
    
    self.tableView.tableFooterView = footer;
    
    self.bottomBar.frame = CGRectMake(0, CGRectGetHeight(self.view.bounds) - BottomBar_Height , CGRectGetWidth(self.view.bounds), BottomBar_Height);
    
    self.editTF.frame = CGRectMake(15, 0, CGRectGetWidth(self.view.bounds) - 45, 49);
    
    self.coverItem.frame = self.bottomBar.bounds;
    
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    
    self.publishItem.frame = CGRectMake(CGRectGetWidth(self.view.bounds) - 60, 0 , 40, 49);
}

- (UITableViewCell *)configTableViewCell:(id)data forIndexPath:(NSIndexPath *)ip {
    
    CATCommentBean *comment = (CATCommentBean *)data;
    
    if (comment.type == WLCommentTypeRectangle) {
        
        CATCommentRectangleTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"rectangle"];
        
        cell.bottomLineType = CATBottomLineTypeNone;
        
        return cell;
        
    } else if (comment.type == WLCommentTypeTotal ) {
        
        CATCommentTotalTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"total"];
        
        cell.bottomLineType = CATBottomLineTypeNormal;
        
        return cell;
        
    } else if (comment.type == WLCommentTypeEmpty ) {
        
        CATCommentEmptyTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"empty"];
        
        cell.bottomLineType = CATBottomLineTypeNormal;
        
        return cell;
        
    } else if (comment.type == WLCommentTypeFailed ) {
        
        CATCommentFailedTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"failed"];
        
        cell.bottomLineType = CATBottomLineTypeNormal;
        
        return cell;
        
    } else if (comment.type == WLCommentTypeNoMore ) {
        
        CATCommentNoMoreTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"nomore"];
        
        cell.bottomLineType = CATBottomLineTypeNormal;
        
        return cell;
    } else {
        
        CATCommentContentTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"content"];
        
        cell.comment = data;
        
        cell.bottomLineType = CATBottomLineTypeNormal;
        
        cell.mDelegate = self;
        
        return cell;
    }
}

- (CGFloat)caculateForCell:(id)data forIndexPath:(NSIndexPath *)ip {
    
    CATCommentBean *comment = (CATCommentBean *)data;
    
    if (comment.type == WLCommentTypeRectangle) {
        
        return 10;
        
    } else if (comment.type == WLCommentTypeTotal ) {
        
        return 48;
        
    } else if (comment.type == WLCommentTypeEmpty ) {
        
        return 60;
        
    } else if (comment.type == WLCommentTypeFailed ) {
        
        return 120;
        
    } else if (comment.type == WLCommentTypeNoMore ) {
        
        return 60;
    } else {
        
        CGFloat height = 60;
        
        CGFloat contnetHeight = [comment.content boundingRectWithSize:CGSizeMake(KSSCREEN_WIDTH - 60 - 40, 999) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{ NSFontAttributeName: [UIFont systemFontOfSize:13]} context:nil].size.height;
        
        height += contnetHeight;
        
        height += 20;
        
        return height ;
    }
}

- (void)configViewModel {
    
    self.bridge = [CATCommentBridge new];
    
    [self.bridge createComment:self encode:self.encode circle:self.circleBean];
    
    [self.tableView.mj_header beginRefreshing];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    [self.view addSubview:self.bottomBar];
    
    [self.bottomBar addSubview:self.editTF];
    
    [self.bottomBar addSubview:self.publishItem];
    
    [self.bottomBar addSubview:self.coverItem];
    
    [self.coverItem addTarget:self action:@selector(onCoverItemClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.publishItem addTarget:self action:@selector(onPublishItemClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@CATBackground]];
    
    background.frame = self.view.bounds;
    
    self.tableView.backgroundView = background;
}

- (void)onCoverItemClick:(UIButton *)sender {
    
    if ([[CATAccountCache shared] isLogin]) {
        
        [self.editTF becomeFirstResponder];
        
        sender.enabled = false;
    } else {
        
        self.block(self, CATCommentActionTypeUnLogin, self.circleBean);
    }
}

- (void)onPublishItemClick:(UIButton *)sender {
    
    __weak typeof(self) weakSelf = self;
    
    [self.bridge addComment:self.encode content:self.editTF.text commentAction:^(CATCommentBean * _Nullable commentBean, CATCircleBean * _Nonnull circleBean) {
       
        [weakSelf.editTF resignFirstResponder];

        weakSelf.editTF.text = @"";

        weakSelf.block(weakSelf, CATCommentActionTypeComment ,weakSelf.circleBean);
    }];
    
}

- (void)onReloadItemClick {
    [super onReloadItemClick];
    
    [self.tableView.mj_header beginRefreshing];
}

- (BOOL)canPanResponse {
    return true;
}
- (void)configNaviItem {
    
    self.title = @"评论列表";
}

- (void)tableViewSelectData:(id)data forIndexPath:(NSIndexPath *)ip {
    
    [self.view endEditing:true];
    
    CATCommentBean *comment = (CATCommentBean *)data;
    
    if (comment.type == WLCommentTypeFailed) {
        
        [self.tableView.mj_footer beginRefreshing];
    }
}

- (void)keyboardWillShow:(NSNotification *)noti {
    
    NSTimeInterval duration = [noti.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    CGRect frame = [noti.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    [UIView animateWithDuration:duration animations:^{
        
        self.bottomBar.frame = CGRectMake(0, frame.origin.y - 49 , CGRectGetWidth(self.view.bounds), 49);
        
    } completion:^(BOOL finished) {
        
        
    }];
}

- (void)keyboardWillHide:(NSNotification *)noti {
    
    NSTimeInterval duration = [noti.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    CGRect frame = [noti.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    CGFloat h = BottomBar_Height;
    
    [UIView animateWithDuration:duration animations:^{
        
        self.bottomBar.frame = CGRectMake(0, frame.origin.y - h , CGRectGetWidth(self.view.bounds), h);
        
        self.coverItem.enabled = true;
        
    } completion:^(BOOL finished) {
        
        
    }];
}

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    return true;
}

- (void)onMoreItemClick:(CATCommentBean *)comment {
    
    __weak typeof(self) weakSelf = self;
    
    [self jxt_showActionSheetWithTitle:@"操作" message:@"" appearanceProcess:^(JXTAlertController * _Nonnull alertMaker) {
        
        alertMaker.
        addActionCancelTitle(@"取消").
        addActionDefaultTitle(@"举报");
        
    } actionsBlock:^(NSInteger buttonIndex, UIAlertAction * _Nonnull action, JXTAlertController * _Nonnull alertSelf) {
        
        if ([action.title isEqualToString:@"取消"]) {
            
        }
        else if ([action.title isEqualToString:@"举报"]) {
            
            weakSelf.block(weakSelf, CATCommentActionTypeReport,weakSelf.circleBean);
            
        }
    }];
}
@end
