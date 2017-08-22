//
// FFAlert.m
//  FireFinancial
//
//  Created by 任晓健 on 2017/3/6.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import "FFAlert.h"

#define margin_moneyMargin (14 * FF_Scale)
#define margin_labelMargin (16 * FF_Scale)
#define margin_maxTop (40 * FF_Scale)
#define margin_maxMargin (30 * FF_Scale)
#define margin_top (25 * FF_Scale)
#define margin_left (27 * FF_Scale)
#define margin_right (27 * FF_Scale)
#define margin_btnLeft (22 * FF_Scale)
#define margin_btnRight (22 * FF_Scale)
#define margin_btnMargin (17 * FF_Scale)
#define margin_bottom (25 * FF_Scale)
#define margin_bg (37 * FF_Scale)
#define margin_cornerRad 3
#define margin_TopHeight (70 * FF_Scale)
#define margin_btnHeight (35 * FF_Scale)

@interface FFAlert ()

@property(nonatomic, strong) UIView *bgView;
@property(nonatomic, strong) UIImageView *bgImgView;
@property(nonatomic, strong) UIImageView *topImgView;

@property(nonatomic, strong) UILabel *titleLabel;
@property(nonatomic, strong) UILabel *messageLabel;
@property(nonatomic, strong) UILabel *upLabel;
@property(nonatomic, strong) UILabel *updesLabel;
@property(nonatomic, strong) UILabel *downLabel;
@property(nonatomic, strong) UILabel *downdesLabel;
@property(nonatomic, strong) UILabel *thirdLabel;
@property(nonatomic, strong) UILabel *thirddesLabel;


@property(nonatomic, copy) BtnClickBlock btnCilckBlock;
@property(nonatomic, assign) AlertType type;


@end

@implementation FFAlert

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.backgroundColor = [UIColor whiteColor];
        _bgView.layer.cornerRadius = 10;
    }
    return _bgView;
}

- (UIImageView *)bgImgView {
    if (!_bgImgView) {
        _bgImgView = [UIImageView new];
        _bgImgView.userInteractionEnabled = YES;
    }
    return _bgImgView;
}

- (UIImageView *)topImgView {
    if (!_topImgView) {
        _topImgView = [UIImageView new];
        _topImgView.backgroundColor = [UIColor purpleColor];
    }
    return _topImgView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont boldSystemFontOfSize:20 * FF_Scale];
        _titleLabel.textColor = [UIColor colorWithRed:56 / 255.0 green:64 / 255.0 blue:75 / 255.0 alpha:1];
    }
    return _titleLabel;
}

- (UILabel *)upLabel {
    if (!_upLabel) {
        _upLabel = [UILabel new];
        _upLabel.font = [UIFont systemFontOfSize:14 * FF_Scale];
        _upLabel.textColor = [UIColor colorWithRed:56 / 255.0 green:64 / 255.0 blue:75 / 255.0 alpha:1];
    }
    return _upLabel;
}

- (UILabel *)updesLabel {
    if (!_updesLabel) {
        _updesLabel = [UILabel new];
        _updesLabel.font = [UIFont systemFontOfSize:18 * FF_Scale];
        _updesLabel.textColor = [UIColor colorWithRed:56 / 255.0 green:64 / 255.0 blue:75 / 255.0 alpha:1];
    }
    return _updesLabel;
}

- (UILabel *)downLabel {
    if (!_downLabel) {
        _downLabel = [UILabel new];
        _downLabel.font = [UIFont systemFontOfSize:14 * FF_Scale];
        _downLabel.textColor = [UIColor colorWithRed:56 / 255.0 green:64 / 255.0 blue:75 / 255.0 alpha:1];
    }
    return _downLabel;
}

- (UILabel *)downdesLabel {
    if (!_downdesLabel) {
        _downdesLabel = [UILabel new];
        _downdesLabel.font = [UIFont systemFontOfSize:18 * FF_Scale];
        _downdesLabel.textColor = [UIColor colorWithRed:56 / 255.0 green:64 / 255.0 blue:75 / 255.0 alpha:1];
    }
    return _downdesLabel;
}

- (UILabel *)thirdLabel {
    if (!_thirdLabel) {
        _thirdLabel = [UILabel new];
        _thirdLabel.font = [UIFont systemFontOfSize:14 * FF_Scale];
        _thirdLabel.textColor = [UIColor colorWithRed:56 / 255.0 green:64 / 255.0 blue:75 / 255.0 alpha:1];
    }
    return _thirdLabel;
}

- (UILabel *)thirddesLabel {
    if (!_thirddesLabel) {
        _thirddesLabel = [UILabel new];
        _thirddesLabel.font = [UIFont systemFontOfSize:18 * FF_Scale];
        _thirddesLabel.textColor = [UIColor colorWithRed:56 / 255.0 green:64 / 255.0 blue:75 / 255.0 alpha:1];
    }
    return _thirddesLabel;
}

- (UILabel *)messageLabel {
    if (!_messageLabel) {
        _messageLabel = [UILabel new];
        _messageLabel.numberOfLines = 0;
        _messageLabel.textAlignment = self.messageTextAlignment;
        _messageLabel.font = [UIFont systemFontOfSize:17 * FF_Scale];
        _messageLabel.textColor = [UIColor colorWithRed:56 / 255.0 green:64 / 255.0 blue:75 / 255.0 alpha:1];
    }
    return _messageLabel;
}

- (UIButton *)leftBtn {
    if (!_leftBtn) {
        _leftBtn = [UIButton new];
        _leftBtn.tag = 1;
        _leftBtn.titleLabel.font = [UIFont systemFontOfSize:15 * FF_Scale];
        [_leftBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftBtn;
}

- (UIButton *)rightBtn {
    if (!_rightBtn) {
        _rightBtn = [UIButton new];
        _rightBtn.tag = 2;
        _rightBtn.titleLabel.font = [UIFont systemFontOfSize:15 * FF_Scale];
        [_rightBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightBtn;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.frame = [UIScreen mainScreen].bounds;
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        self.alpha = 0;
    }
    return self;
}

+ (instancetype)alertWithAlertType:(AlertType)alertType
                        setupBlock:(SetupBlock)setupBlock
                       buttonClick:(BtnClickBlock)buttonClick{
    FFAlert *alert = [[self alloc] init];
    alert.btnCilckBlock = buttonClick;
    alert.type = alertType;
    [alert setupAlert:setupBlock];
    return alert;
}
- (void)setupAlert:(SetupBlock)setupBlock {
    setupBlock(self);
    [self setupUI];
}

- (void)setupUI {
    [self setupBg];
    
}

- (void)setupBg {
    [self addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(margin_bg);
        make.right.mas_equalTo(-margin_bg);
        make.centerY.mas_equalTo(self);
    }];
    
    [self.bgView addSubview:self.bgImgView];
    [self.bgImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.bgView);
    }];
    if (self.type == AlertTypeMoney) {
        [self setupMoneyContent];
        
    } else if (self.type == AlertTypeTransfer) {
        [self setupTransfer];
    } else {
         [self setupContent];
    }
   
}

- (void)setupMoneyContent {
    [self.bgImgView addSubview:self.titleLabel];
    
    self.titleLabel.text = self.title;
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.title ? margin_top: margin_maxMargin);
        make.centerX.mas_equalTo(self.bgImgView);
        
    }];
    
    UIView *upView =[UIView new];
    UIView *downView = [UIView new];
    [self.bgImgView addSubview:upView];
    [self.bgImgView addSubview:downView];
   
     CGFloat top = self.title ? margin_btnLeft: 0;
    [upView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(top);
        if (self.downTitle == nil || self.downTitleDes == nil) {
            make.centerX.mas_equalTo(self);
        } else {
            make.left.mas_equalTo(downView);
        }
        
    }];
    [downView mas_makeConstraints:^(MASConstraintMaker *make) {
        if (self.downTitle == nil || self.downTitleDes == nil) {
           make.top.mas_equalTo(upView.mas_bottom).offset(0);
        } else {
            make.top.mas_equalTo(upView.mas_bottom).offset(margin_moneyMargin);
        }
        make.centerX.mas_equalTo(self.titleLabel);
    }];
    
    self.upLabel.text = self.upTitle;
    self.updesLabel.text = self.upTitleDes;
    self.downLabel.text = self.downTitle;
    self.downdesLabel.text = self.downTitleDes;
    self.updesLabel.textColor = self.upDesColor;
    self.downdesLabel.textColor = self.downDesColor;
    
    [upView addSubview:self.upLabel];
    [upView addSubview:self.updesLabel];
    [downView addSubview:self.downLabel];
    [downView addSubview:self.downdesLabel];
    
    
    [self.upLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.bottom.mas_equalTo(0);
    }];
    [self.updesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.upLabel.mas_right);
        make.top.bottom.mas_equalTo(0);
        make.right.mas_equalTo(0);
    }];
    
    [self.downLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.bottom.mas_equalTo(0);
    }];
    [self.downdesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.downLabel.mas_right);
        make.top.bottom.mas_equalTo(0);
        make.right.mas_equalTo(0);
    }];

    if (self.leftTitle && self.rightTitle) {
        [self.leftBtn setTitle:self.leftTitle forState:UIControlStateNormal];
        [self.rightBtn setTitle:self.rightTitle forState:UIControlStateNormal];
        [self.bgImgView addSubview:self.leftBtn];
        [self.bgImgView  addSubview:self.rightBtn];
        
        [self.leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(downView.mas_bottom).offset(margin_btnLeft);
            make.left.mas_equalTo(margin_btnLeft);
            make.height.mas_equalTo(margin_btnHeight);
        }];
        [self.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.leftBtn.mas_right).offset(margin_btnMargin);
            make.top.mas_equalTo(self.leftBtn.mas_top);
            make.right.mas_equalTo(-margin_btnRight);
            make.bottom.mas_equalTo(-margin_bottom);
            make.height.mas_equalTo(self.leftBtn);
            make.width.mas_equalTo(self.leftBtn.mas_width);
        }];
    } else {
        if (self.leftTitle) {
            [self.leftBtn setTitle:self.leftTitle forState:UIControlStateNormal];
        }
        if (self.rightTitle) {
            [self.leftBtn setTitle:self.rightTitle forState:UIControlStateNormal];
        }
        [self.bgImgView addSubview:self.leftBtn];
        [self.leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(downView.mas_bottom).offset(margin_btnLeft);
            make.left.mas_equalTo(margin_maxMargin);
            make.right.mas_equalTo(-margin_maxMargin);
            make.height.mas_equalTo(margin_btnHeight);
            make.bottom.mas_equalTo(-margin_bottom);
        }];
    }
    [self layoutIfNeeded];
    [self.leftBtn redborderBtn];
    [self.rightBtn redBtn];
}

- (void)setupContent {
    [self.bgImgView addSubview:self.topImgView];
    [self.bgImgView addSubview:self.titleLabel];
    [self.bgImgView addSubview:self.messageLabel];
    self.topImgView.image = self.topImg;
    [self.topImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(margin_top);
        make.centerX.mas_equalTo(self.bgImgView);
        make.width.height.mas_equalTo(self.topImg ? margin_TopHeight: 0);
    }];
    CGFloat titleTop = self.topImg ? margin_btnLeft: 0;
    self.titleLabel.text = self.title;
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.topImgView.mas_bottom).offset(titleTop);
        make.centerX.mas_equalTo(self.topImgView);
    }];
    self.messageLabel.text = self.message;
    CGFloat messageTop = self.title ? margin_labelMargin: 0;
    if (!self.message) {
        messageTop = 0;
        if (self.title) {
            [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(margin_maxTop);
                make.centerX.mas_equalTo(self.topImgView);
            }];
        }
    }
    [self.messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(messageTop);
        make.left.mas_equalTo(margin_left);
        make.right.mas_equalTo(-margin_right);
        
    }];
    CGFloat top = self.message ? margin_btnLeft: margin_maxMargin;
    if (self.leftTitle && self.rightTitle) {
        [self.leftBtn setTitle:self.leftTitle forState:UIControlStateNormal];
        [self.rightBtn setTitle:self.rightTitle forState:UIControlStateNormal];
     
        [self.bgImgView addSubview:self.leftBtn];
        [self.bgImgView  addSubview:self.rightBtn];
        
        [self.leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.messageLabel.mas_bottom).offset(top);
            make.left.mas_equalTo(margin_btnLeft);
            make.height.mas_equalTo(margin_btnHeight);
        }];
        [self.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.leftBtn.mas_right).offset(margin_btnMargin);
            make.top.mas_equalTo(self.leftBtn.mas_top);
            make.right.mas_equalTo(-margin_btnRight);
            make.bottom.mas_equalTo(-margin_bottom);
            make.height.mas_equalTo(self.leftBtn);
            make.width.mas_equalTo(self.leftBtn.mas_width);
        }];
    } else {
        if (self.leftTitle) {
            [self.rightBtn setTitle:self.leftTitle forState:UIControlStateNormal];
        }
        if (self.rightTitle) {
            [self.rightBtn setTitle:self.rightTitle forState:UIControlStateNormal];
        }
        [self.bgImgView addSubview:self.rightBtn];
        [self.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.messageLabel.mas_bottom).offset(top);
            make.left.mas_equalTo(margin_maxMargin);
            make.right.mas_equalTo(-margin_maxMargin);
            make.height.mas_equalTo(margin_btnHeight);
            make.bottom.mas_equalTo(-margin_bottom);
        }];
    }
    [self layoutIfNeeded];
    [self.leftBtn redborderBtn];
    [self.rightBtn redBtn];
}

- (void)setupTransfer {
    
    [self.bgImgView addSubview:self.titleLabel];
    
    self.titleLabel.text = self.title;
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.title ? margin_top: margin_maxMargin);
        make.centerX.mas_equalTo(self.bgImgView);
        
    }];
    
    UIView *upView =[UIView new];
    UIView *centerView = [UIView new];
    UIView *downView = [UIView new];
    [self.bgImgView addSubview:upView];
    [self.bgImgView addSubview:downView];
    [self.bgImgView addSubview:centerView];
    
    CGFloat top = self.title ? margin_btnLeft: 0;
    [upView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(top);
        make.centerX.mas_equalTo(self);
    }];
    
    [centerView mas_makeConstraints:^(MASConstraintMaker *make) {
        if (self.downTitle == nil || self.downTitleDes == nil) {
            make.top.mas_equalTo(upView.mas_bottom).offset(0);
        } else {
            make.top.mas_equalTo(upView.mas_bottom).offset(margin_moneyMargin);
        }
        make.centerX.mas_equalTo(self.titleLabel);
    }];
    
    [downView mas_makeConstraints:^(MASConstraintMaker *make) {
        if (self.thirdTitle == nil || self.thirdTitleDes == nil) {
            make.top.mas_equalTo(centerView.mas_bottom).offset(0);
        } else {
            make.top.mas_equalTo(centerView.mas_bottom).offset(margin_moneyMargin);
        }
        make.centerX.mas_equalTo(self.bgImgView);
    }];
    
    self.upLabel.text = self.upTitle;
    self.updesLabel.text = self.upTitleDes;
    self.downLabel.text = self.downTitle;
    self.downdesLabel.text = self.downTitleDes;
    self.thirdLabel.text = self.thirdTitle;
    self.thirddesLabel.text = self.thirdTitleDes;
    self.updesLabel.textColor = self.upDesColor;
    self.downdesLabel.textColor = self.downDesColor;
    self.thirddesLabel.textColor = self.thirdTitleDesColor;
    
    [upView addSubview:self.upLabel];
    [upView addSubview:self.updesLabel];
    [centerView addSubview:self.downLabel];
    [centerView addSubview:self.downdesLabel];
    [downView addSubview:self.thirdLabel];
    [downView addSubview:self.thirddesLabel];

    [self.upLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.bottom.mas_equalTo(0);
    }];
    [self.updesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.upLabel.mas_right);
        make.top.bottom.mas_equalTo(0);
        make.right.mas_equalTo(0);
    }];
    
    [self.downLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.upLabel);
        make.top.bottom.mas_equalTo(0);
    }];
    [self.downdesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.downLabel.mas_right);
        make.top.bottom.mas_equalTo(0);
        make.right.mas_equalTo(0);
    }];
    [self.thirdLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.downLabel);
        make.top.bottom.mas_equalTo(0);
    }];
    [self.thirddesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.thirdLabel.mas_right);
        make.top.bottom.mas_equalTo(0);
        make.right.mas_equalTo(0);
    }];
    
    if (self.leftTitle && self.rightTitle) {
        [self.leftBtn setTitle:self.leftTitle forState:UIControlStateNormal];
        [self.rightBtn setTitle:self.rightTitle forState:UIControlStateNormal];
        [self.bgImgView addSubview:self.leftBtn];
        [self.bgImgView  addSubview:self.rightBtn];
        
        [self.leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(downView.mas_bottom).offset(margin_btnLeft);
            make.left.mas_equalTo(margin_btnLeft);
            make.height.mas_equalTo(margin_btnHeight);
        }];
        [self.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.leftBtn.mas_right).offset(margin_btnMargin);
            make.top.mas_equalTo(self.leftBtn.mas_top);
            make.right.mas_equalTo(-margin_btnRight);
            make.bottom.mas_equalTo(-margin_bottom);
            make.height.mas_equalTo(self.leftBtn);
            make.width.mas_equalTo(self.leftBtn.mas_width);
        }];
    } else {
        if (self.leftTitle) {
            [self.leftBtn setTitle:self.leftTitle forState:UIControlStateNormal];
        }
        if (self.rightTitle) {
            [self.leftBtn setTitle:self.rightTitle forState:UIControlStateNormal];
        }
        [self.bgImgView addSubview:self.leftBtn];
        [self.leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(downView.mas_bottom).offset(margin_btnLeft);
            make.left.mas_equalTo(margin_maxMargin);
            make.right.mas_equalTo(-margin_maxMargin);
            make.height.mas_equalTo(margin_btnHeight);
            make.bottom.mas_equalTo(-margin_bottom);
        }];
    }
    [self layoutIfNeeded];
    [self.leftBtn redborderBtn];
    [self.rightBtn redBtn];
}

- (void)btnClick:(UIButton *)btn {
    if (self.btnCilckBlock) {
        self.btnCilckBlock(btn.tag);
    }
    [self dismiss];
}

- (void)show {
    self.bgView.transform = CGAffineTransformMakeScale(0, 0);
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self];
    
    [UIView animateWithDuration:0.1 animations:^{
        self.alpha = 1;
    }];
    
    [UIView animateWithDuration:0.35 delay:0.05 usingSpringWithDamping:0.8 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.bgView.transform = CGAffineTransformMakeScale(1, 1);
        
    } completion:^(BOOL finished) {
        
    }];
    
}

- (void)dismiss {
    [UIView animateWithDuration:0.35 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.bgView.transform = CGAffineTransformMakeScale(0.1, 0.1);
        self.bgView.alpha = 0;
        
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
    
}
@end
