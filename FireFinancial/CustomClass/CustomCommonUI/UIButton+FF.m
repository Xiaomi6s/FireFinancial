//
//  UIButton+FF.m
//  FireFinancial
//
//  Created by 任晓健 on 2017/8/23.
//  Copyright © 2017年 rxj. All rights reserved.
//

#import "UIButton+FF.h"

@implementation UIButton (FF)

- (void)setshadowWithColor:(UIColor *)color {
    self.layer.shadowColor = color.CGColor;
    self.layer.shadowOffset = CGSizeMake(0, 4);
    self.layer.shadowOpacity = 0.64;
    self.layer.shadowRadius = 4;
}

- (void)setshadowWithColor:(UIColor *)color opacity:(CGFloat)opacity {
    self.layer.shadowColor = color.CGColor;
    self.layer.shadowOffset = CGSizeMake(0, 4);
    self.layer.shadowOpacity = opacity;
    self.layer.shadowRadius = 4;
}

- (void)setshadowWithView:(UIView *)view color:(UIColor *)color {
    view.layer.shadowColor = color.CGColor;
    view.layer.shadowOffset = CGSizeMake(0, 4);
    view.layer.shadowOpacity = 1;
    view.layer.shadowRadius = 4;
}


- (void)redBtn {
    self.enabled = YES;
    self.layer.cornerRadius = self.frame.size.height / 2;
    self.backgroundColor = [UIColor clearColor];
    [self setBackgroundImage:[self radiusImgWithcolor:[UIColor redBtnColor]] forState:UIControlStateNormal];
    [self setBackgroundImage:[self radiusImgWithcolor:[UIColor redBtnHighlightedColor]] forState:UIControlStateHighlighted];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}

- (void)pinkBtn {
    self.enabled = YES;
    self.layer.cornerRadius = self.frame.size.height / 2;
    self.backgroundColor = [UIColor clearColor];
    [self setBackgroundImage:[self radiusImgWithcolor:[UIColor PinkBtnColor]] forState:UIControlStateNormal];
    [self setBackgroundImage:[self radiusImgWithcolor:[UIColor PinkBtnHighlightedColor]] forState:UIControlStateHighlighted];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}

- (void)goldenyellowBtn {
    self.enabled = YES;
    self.layer.cornerRadius = self.frame.size.height / 2;
    self.backgroundColor = [UIColor clearColor];
    [self setBackgroundImage:[self radiusImgWithcolor:[UIColor goldenyellowBtnColor]] forState:UIControlStateNormal];
    [self setBackgroundImage:[self radiusImgWithcolor:[UIColor goldenyellowBtnHighlightedColor]] forState:UIControlStateHighlighted];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}

- (void)redWithShadowBtn {
    self.enabled = YES;
    self.layer.cornerRadius = self.frame.size.height / 2;
    self.layer.masksToBounds = YES;
    [self setBackgroundImage:[UIImage imgWithColor:[UIColor redBtnColor]] forState:UIControlStateNormal];
    [self setBackgroundImage:[UIImage imgWithColor:[UIColor redBtnHighlightedColor]] forState:UIControlStateHighlighted];
    
}

- (void)goldenyellowWithShadowBtn {
    self.enabled = YES;
    self.layer.cornerRadius = self.frame.size.height / 2;
    self.layer.masksToBounds = YES;
    [self setBackgroundImage:[UIImage imgWithColor:[UIColor goldenyellowBtnColor]] forState:UIControlStateNormal];
    [self setBackgroundImage:[UIImage imgWithColor:[UIColor goldenyellowBtnHighlightedColor]] forState:UIControlStateHighlighted];
}
- (void)redborderBtn {
    self.enabled = YES;
    self.backgroundColor = [UIColor clearColor];
    self.layer.cornerRadius = self.frame.size.height / 2;
    self.layer.borderColor = [UIColor redBtnColor].CGColor;
    self.layer.borderWidth = 0.5;
    [self setBackgroundImage:[[UIImage imgWithColor:[UIColor whiteColor] size:self.frame.size] imageWithCornerRadius:self.frame.size.height / 2] forState:UIControlStateNormal];
    [self setBackgroundImage:[[UIImage imgWithColor:[UIColor lightPinkColor] size:self.frame.size] imageWithCornerRadius:self.frame.size.height / 2] forState:UIControlStateHighlighted];
    [self setTitleColor:[UIColor redBtnColor] forState:UIControlStateNormal];
    
}

- (void)gradientRedBtn {
    self.enabled = YES;
    self.backgroundColor = [UIColor clearColor];
    self.layer.cornerRadius = self.frame.size.height / 2;
    NSArray *colors = @[((id)[UIColor colorWithHex:@"ff5855"].CGColor), ((id)[UIColor colorWithHex:@"ff384d"].CGColor)];
    [self setBackgroundImage:[self gradientImgwithColors:colors] forState:UIControlStateNormal];
    [self setBackgroundImage:[self radiusImgWithcolor:[UIColor redBtnHighlightedColor]] forState:UIControlStateHighlighted];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self setshadowWithColor:[UIColor colorWithHex:@"FCA9A9"]opacity:1];
}

- (void)gradientRedRectBtn {
    self.enabled = YES;
    self.backgroundColor = [UIColor clearColor];
    NSArray *colors = @[((id)[UIColor colorWithHex:@"ff5855"].CGColor), ((id)[UIColor colorWithHex:@"ff384d"].CGColor)];
    [self setBackgroundImage:[self gradientRectImgwithColors:colors] forState:UIControlStateNormal];
    [self setBackgroundImage:[self rectImgWithColor:[UIColor redBtnHighlightedColor]] forState:UIControlStateHighlighted];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //    [self setshadowWithColor:[UIColor redBtnColor]];
}

- (UIImage *)gradientImgwithColors:(NSArray *)colors {
    UIView *gradientView = [UIView new];
    gradientView.frame = self.bounds;
    gradientView.layer.cornerRadius = self.bounds.size.height / 2;
    CAGradientLayer *gLayer = [CAGradientLayer new];
    gLayer.frame = self.bounds;
    gLayer.cornerRadius = self.bounds.size.height / 2;
    gLayer.colors = colors;
    gLayer.locations = @[@(0.5), @(1)];
    gLayer.startPoint = CGPointMake(0, 0);
    gLayer.endPoint = CGPointMake(1, 1);
    [gradientView.layer addSublayer:gLayer];
    return [self imageFromViewWithView:gradientView];
}

- (UIImage *)gradientRectImgwithColors:(NSArray *)colors {
    UIView *gradientView = [UIView new];
    gradientView.frame = self.bounds;
    CAGradientLayer *gLayer = [CAGradientLayer new];
    gLayer.frame = self.bounds;
    gLayer.colors = colors;
    gLayer.locations = @[@(0.5), @(1)];
    gLayer.startPoint = CGPointMake(0, 0);
    gLayer.endPoint = CGPointMake(1, 1);
    [gradientView.layer addSublayer:gLayer];
    return [self imageFromViewWithView:gradientView];
}

- (UIImage *)radiusImgWithcolor:(UIColor *)color {
    return [self gradientImgwithColors:@[((id)color.CGColor),((id)color.CGColor)]];
}

- (UIImage *)rectImgWithColor:(UIColor *)color {
    return [self gradientRectImgwithColors:@[((id)color.CGColor),((id)color.CGColor)]];
}

- (UIImage *)imageFromViewWithView:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, [UIScreen mainScreen].scale);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage*image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)disabledBtn {
    self.layer.shadowColor = nil;
    self.layer.shadowOffset = CGSizeZero;
    self.layer.shadowOpacity = 0;
    self.layer.shadowRadius = 0;
    self.layer.cornerRadius = self.frame.size.height / 2;
    self.backgroundColor = [UIColor clearColor];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self setBackgroundImage:[[UIImage imgWithColor:[UIColor separatorColor] size:self.frame.size] imageWithCornerRadius:self.frame.size.height / 2] forState:UIControlStateDisabled];
    self.enabled = NO;
    
}

- (void)disabledRectBtn {
    self.layer.shadowColor = nil;
    self.layer.shadowOffset = CGSizeZero;
    self.layer.shadowOpacity = 0;
    self.layer.shadowRadius = 0;
    self.backgroundColor = [UIColor clearColor];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self setBackgroundImage:[UIImage imgWithColor:[UIColor separatorColor]
                                              size:self.frame.size]
                    forState:UIControlStateDisabled];
    self.enabled = NO;
}

@end
