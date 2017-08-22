//
//  FFGenView.h
//  FireFinancial
//
//  Created by rxj on 2017/6/14.
//  Copyright © 2017年 Yonglibao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    FSGenViewTypeSuccess,
    FSGenViewTypeNoMsg,
    FSGenViewTypeFail
} FSGenViewType;

typedef void(^clickBlock)(void);

@interface FFGenView : UIView

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *centerY;
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet FFButton *btn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topImgWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topImgheight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topImgCenterX;
@property (weak, nonatomic) IBOutlet UIImageView *topImgView;
@property (weak, nonatomic) IBOutlet UILabel *tipsLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tipsTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *btnTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *btnHeight;


+ (instancetype)instanceNoMsgInView:(UIView *)view;
+ (instancetype)instanceFailWithErrorMsg:(NSString *)errorMsg
                                 inView:(UIView *)view
                             clickBlock:(clickBlock)clickBlock;

+ (instancetype)instanceWithType:(FSGenViewType)type
                         message:(NSString *)message
                          inView:(UIView *)view
                      clickBlock:(clickBlock)clickBlock;
/**
 查找该view上是否存在genview有的话隐藏
 
 @param view 需要移除genview的view
 */
+ (void)hideInView:(UIView *)view;
+ (void)hideNoMsgInView:(UIView *)view;

@end
