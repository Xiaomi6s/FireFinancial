//
//  FFScrollSliderView.h
//  FireFinancial
//
//  Created by rxj on 15/8/17.
//  Copyright (c) 2015年 rxj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FFSilderButton : UIButton

@property (assign, nonatomic) CGFloat currentTransformSx;

@end

typedef NS_ENUM(NSInteger,SceneType) {
    /**
     *  白字蓝底灰背景）
     */
    SceneTypeGray,
    /**
     *  白字蓝底白背景）
     */
    SceneTypeWhite,
    /**
     *  蓝字白底
     */
    SceneTypeBlue,
    /**
     *  活利宝
     */
    SceneTypeHlb
};

typedef void (^ItemClickBlock)(NSInteger index);

@interface FFScrollSliderView : UIView

@property(nonatomic, weak) UIViewController *parentVC;
@property (nonatomic, strong) NSArray *viewControllers;
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UICollectionView *collectionView;

-(instancetype)initWithFrame:(CGRect)frame sceneType:(SceneType)type;

/**
 *  当前选中的按钮 从1开始
 */
@property (nonatomic, assign) NSInteger evSelectedIndex;

/**
 *  选中回调
 */
@property (nonatomic, copy) ItemClickBlock itemBlock;

@end
