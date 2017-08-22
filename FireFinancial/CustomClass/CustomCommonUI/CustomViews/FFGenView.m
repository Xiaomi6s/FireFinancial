//
//  FFGenView.m
//  FireFinancial
//
//  Created by rxj on 2017/6/14.
//  Copyright © 2017年 Yonglibao. All rights reserved.
//

#import "FFGenView.h"
#import "FFScrollSliderView.h"

typedef enum : NSUInteger {
    GenTypeBtn,
    GenTypeNomal,
} GenType;

@interface FFGenView ()



@property(nonatomic, copy) clickBlock clickBlock;
@property(nonatomic, assign)FSGenViewType genViewType;
@property(nonatomic, assign) GenType type;
@property(nonatomic, copy) NSDictionary *imgtips;
@property(nonatomic, copy) NSString *message;
@property(nonatomic, strong) UIImage *imgage;
@property(nonatomic, assign) BOOL isInSlider;
@property(nonatomic, assign) BOOL isRemoving; //正在执行remove动画

@end

@implementation FFGenView

+ (BOOL)isInSliderView:(UIView *)view {
    BOOL isIn = NO;
    if ([view.superview.superview isKindOfClass:[UICollectionView class]]) {
      UIView *collectionView = view.superview.superview;
        if (collectionView.frame.size.height < ScreenHeight) {
            isIn = YES;
        }
    }
    return isIn;
}

+ (FFGenView *)isConstrainInView:(UIView *)view {
    for (UIView *aView in view.subviews) {
        if ([aView isKindOfClass:[FFGenView class]]) {
            return (FFGenView *)aView;
        }
    }
    return nil;
}
+ (instancetype)instanceNoMsgInView:(UIView *)view {
    return [self instanceWithType:FSGenViewTypeNoMsg
                          message:@"空空如也~"
                           inView:view
                       clickBlock:nil];
}

+ (instancetype)instanceFailWithErrorMsg:(NSString *)errorMsg
                                  inView:(UIView *)view
                              clickBlock:(clickBlock)clickBlock {
    return [self instanceWithType:FSGenViewTypeFail
                          message:@"加载失败，请检查你的网络设置"
                           inView:view
                       clickBlock:clickBlock];
}

+ (instancetype)instanceWithType:(FSGenViewType)type
                         message:(NSString *)message
                          inView:(UIView *)view
                      clickBlock:(clickBlock)clickBlock {
    FFGenView *genView = [self isConstrainInView:view];
    if (genView.isRemoving == YES) {
        [genView removeFromSuperview];
        genView = nil;
    }
    if (!genView) {
        switch (type) {
            case FSGenViewTypeSuccess:
            {
                genView = [[self alloc] initWithType:FSGenViewTypeSuccess
                                             message:message
                                               image:[UIImage imageNamed:@"fs_pic_success"]
                                          clickBlock:clickBlock];
            }
                break;
            case FSGenViewTypeNoMsg:
            {
                genView = [[self alloc] initWithType:FSGenViewTypeNoMsg
                                             message:message
                                               image:[UIImage imageNamed:@"fs_pic_nothing"]
                                          clickBlock:clickBlock];
            }
                break;
            case FSGenViewTypeFail:
            {
                genView = [[self alloc] initWithType:FSGenViewTypeFail
                                             message:message
                                               image:[UIImage imageNamed:@"fs_pic_fail"]
                                          clickBlock:clickBlock];
            }
                break;
                
            default:
                break;
        }
        if ( [self isInSliderView:view]) {
            if (IsIphone4) {
               genView.centerY.constant = genView.centerY.constant + 20;
            }
            
        }
        if (type == FSGenViewTypeNoMsg) {
            genView.topImgCenterX.constant = 6;
        }
        genView.genViewType = type;
        genView.frame = view.bounds;
        [view addSubview:genView];
    }
    return genView;
}

- (id)initWithType:(FSGenViewType)type message:(NSString *)message image:(UIImage *)image
                      clickBlock:(clickBlock)clickBlock {
    self = [[[NSBundle mainBundle] loadNibNamed:@"FSGenView" owner:self options:nil] firstObject];
    if (self) {
//        self.frame = ScreenBounds;
        self.clickBlock = clickBlock;
        if (type == FSGenViewTypeSuccess || type == FSGenViewTypeNoMsg) {
            self.type = GenTypeNomal;
        } else {
            self.type = GenTypeBtn;
        }
        self.imgage = image;
        self.message = message;
         [self setupUI];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setupUI {
    if (self.type != GenTypeBtn) {
        self.tipsTop.constant = 17;
        self.btnTop.constant = 0;
        self.btnHeight.constant = 0;
        self.btn.hidden = YES;
    }
    [self setSacle];
    self.backgroundColor = [FFColor bgColor];
    self.bgView.backgroundColor = [FFColor bgColor];
    [self.btn redborderBtn];
    [self.btn setBackgroundImage:[[UIImage imgWithColor:[FFColor bgColor] size:self.btn.frame.size] imageWithCornerRadius:self.btn.frame.size.height / 2] forState:UIControlStateNormal];
    UIImage *img = self.imgage;
    self.topImgView.image = img;
    self.tipsLabel.text = self.message;
    
}

- (void)setSacle {
    [self.btnTop setAllScale];
    [self.tipsTop setAllScale];
    [self.topImgWidth setAllScale];
    [self.topImgheight setAllScale];
}

- (IBAction)btnclick:(id)sender {
    if (self.clickBlock) {
        self.clickBlock();
    }
}

+ (void)hideInView:(UIView *)view {
    FFGenView *aView = [self isConstrainInView:view];
    if (aView.genViewType == FSGenViewTypeFail) {
        if (aView) {
            aView.isRemoving = YES;
            [UIView animateWithDuration:0.25 animations:^{
                aView.alpha = 0;
            } completion:^(BOOL finished) {
                aView.isRemoving = NO;
                [aView removeFromSuperview];
            }];
        }
    }
   
    
}

+ (void)hideNoMsgInView:(UIView *)view {
    FFGenView *aView = [self isConstrainInView:view];
        if (aView) {
            aView.isRemoving = YES;
            [UIView animateWithDuration:0.25 animations:^{
                aView.alpha = 0;
            } completion:^(BOOL finished) {
                aView.isRemoving = NO;
                [aView removeFromSuperview];
            }];
        }
}

@end





