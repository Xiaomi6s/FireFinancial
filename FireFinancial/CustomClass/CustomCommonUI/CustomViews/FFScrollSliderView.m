//
//  ScrollSliderView.m
//  FireFinancial
//
//  Created by rxj on 15/8/17.
//  Copyright (c) 2015年 rxj. All rights reserved.
//

#import "FFScrollSliderView.h"

#define Width (self.frame.size.width)
#define Height (self.frame.size.height)
#define redColor [UIColor colorWithPatternImage:[UIImage imageNamed:@"fs_nav_red"]]
#define whiteColor [UIColor whiteColor]
#define selectFont [UIFont systemFontOfSize:15]
#define deselectFont [UIFont systemFontOfSize:13]

static  const CGFloat  bigScale = 1.0;
static  const CGFloat  normalScale = 0.86;

@implementation FFSilderButton

- (instancetype)init {
    if (self = [super initWithFrame:CGRectZero]) {
        self.currentTransformSx = 1.0;
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.currentTransformSx = 1.0;
        
    }
    
    return self;
}

- (void)setCurrentTransformSx:(CGFloat)currentTransformSx {
    _currentTransformSx = currentTransformSx;
    self.transform = CGAffineTransformMakeScale(currentTransformSx, currentTransformSx);
}

@end

@interface FFScrollSliderView ()<UIScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource>


/**
 三角图片
 */
@property (nonatomic, strong) UIImageView *sliderImageView;

/**
 用来区分顶部的不同颜色的设置
 */
@property (nonatomic, assign) SceneType type;

/**
 存储顶部按钮的数组
 */
@property (nonatomic, strong) NSMutableArray *buttonsArray;

/**
 上次选中的按钮的索引 默认为1
 */
@property (nonatomic, assign) NSInteger evOldSelectedIndex;

/**
 上次contentview的水平偏移量
 */
@property (nonatomic, assign) CGFloat oldOffSetX;
// 当这个属性设置为YES的时候 就不用处理 scrollView滚动的计算

/**
 * 用以判断当前操作是点击顶部按钮还是主动左右滑动，以此来处理字体大小变化
 * 默认为no 左右主动滑动
 */
@property (assign, nonatomic) BOOL forbidTouchToAdjustPosition;

@end

@implementation FFScrollSliderView

- (void)dealloc
{
    
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
        [self initTopView];
        [self initCollectionView];
        [self addSubview:self.topView];
        //默认选中第一个标签
        _evSelectedIndex = 1;
        _evOldSelectedIndex = 1;
        _oldOffSetX = 0.0;
        self.forbidTouchToAdjustPosition = NO;
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame sceneType:(SceneType)type{
    self.type = type;
    self = [self initWithFrame:frame];
    if (self) {
        
        if (self.type == SceneTypeBlue) {
            self.backgroundColor = redColor;
        }else if (self.type == SceneTypeWhite){
            self.backgroundColor = whiteColor;
        }else if (self.type == SceneTypeHlb){
            self.backgroundColor = redColor;
        }else{
            self.backgroundColor = redColor;
        }
    }
    return self;
}

#pragma mark - 顶部按钮点击事件
- (void)btnAction:(UIButton *)btn {
    [self selectedIndex:btn.tag];
}

- (void)selectedIndex:(NSInteger)index {
    
    FFSilderButton *btn = (FFSilderButton *)[self.topView viewWithTag:index];
    //设置选择的标签index
    if (self.evSelectedIndex != btn.tag) {
        _evSelectedIndex = btn.tag;
    }
    [self setContentOffSet:CGPointMake(self.frame.size.width * (btn.tag - 1), 0) animated:YES];
    
    [self changeFontWhenBtnOnClickWithCurrentIndex];
    
}

- (void)setContentOffSet:(CGPoint)offset animated:(BOOL)animated {
    self.forbidTouchToAdjustPosition = YES;
    [self.collectionView setContentOffset:offset animated:YES];
}

#pragma mark - 点击顶部按钮时候  文字大小处理
-(void)changeFontWhenBtnOnClickWithCurrentIndex {
    if (_evOldSelectedIndex == _evSelectedIndex) {
        return;
    }
    FFSilderButton *oldButton = (FFSilderButton *)self.buttonsArray[_evOldSelectedIndex - 1];
    FFSilderButton *currentButton = (FFSilderButton *)self.buttonsArray[_evSelectedIndex - 1];
    
    [UIView animateWithDuration:0.3 animations:^{
        oldButton.currentTransformSx = normalScale;
        currentButton.currentTransformSx = bigScale;
    }];
    
    _evOldSelectedIndex = _evSelectedIndex;
}

#pragma mark - 左右滑动时候 文字大小处理
//计算倍数
- (void)changeFontWhenScroll:(UIScrollView *)scrollView {
    
    if (self.forbidTouchToAdjustPosition) {
        return;
    }
    CGFloat offSetX = scrollView.contentOffset.x;
    CGFloat temp = offSetX / self.bounds.size.width;
    CGFloat progress = temp - floor(temp);
    
    if (offSetX < 0) {
        _evOldSelectedIndex =  1;
        _evSelectedIndex = 1;
        return;
    }
    
    if (offSetX - _oldOffSetX >= 0) {
        if (progress == 0.0) {
            return;
        }
        _evOldSelectedIndex = (offSetX/self.bounds.size.width) + 1;
        _evSelectedIndex = _evOldSelectedIndex + 1;
        if (_evSelectedIndex > self.viewControllers.count) {
            _evSelectedIndex = self.viewControllers.count -1;
            return;
        }
        
    } else {
        _evSelectedIndex = (offSetX / self.bounds.size.width) + 1;
        _evOldSelectedIndex = _evSelectedIndex + 1;
        if (_evOldSelectedIndex > self.viewControllers.count) {
            _evOldSelectedIndex = self.viewControllers.count - 1;
            return;
        }
        
        progress = 1.0 - progress;
        
    }
    
    [self contentViewDidMoveFromIndex:_evOldSelectedIndex toIndex:_evSelectedIndex progress:progress];

}

//改变大小
- (void)contentViewDidMoveFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex progress:(CGFloat)progress {
    _evOldSelectedIndex = toIndex;
    FFSilderButton *oldButton = (FFSilderButton *)self.buttonsArray[fromIndex - 1];
    FFSilderButton *currentButton = (FFSilderButton *)self.buttonsArray[toIndex - 1];
    
    CGFloat deltaScale = bigScale - normalScale;
    oldButton.currentTransformSx = bigScale - deltaScale * progress;
    currentButton.currentTransformSx = normalScale + deltaScale * progress;
    
}

#pragma mark - 改变文字颜色
- (void)changeBtnColorWithIndex:(NSInteger)index {
    for (int i=0; i<self.viewControllers.count; i++) {
        UIButton *btn = (UIButton *)[self.topView viewWithTag:i+1];
        if (self.type == SceneTypeBlue) {
            if (i + 1 == index) {
                [btn setTitleColor:whiteColor forState:UIControlStateNormal];
            } else {
                [btn setTitleColor:whiteColor forState:UIControlStateNormal];
            }
        } else if (self.type == SceneTypeHlb) {
            if (i + 1 == index) {
                [btn setTitleColor:whiteColor forState:UIControlStateNormal];
            } else {
                [btn setTitleColor:whiteColor forState:UIControlStateNormal];
            }
        } else{
            
        }
    }
    //设置选择的标签index
    if (index != self.evSelectedIndex) {
        _evSelectedIndex = index;
    }
    if (self.itemBlock) {
        self.itemBlock(index);
    }
    
    
}

#pragma mark - set
- (NSMutableArray *)buttonsArray {
    if (!_buttonsArray) {
        _buttonsArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _buttonsArray;
}

- (void)setEvSelectedIndex:(NSInteger)evSelectedIndex {
    _evSelectedIndex = evSelectedIndex;
    [self selectedIndex:evSelectedIndex];
    
}

- (void)setViewControllers:(NSArray *)viewControllers {
    _viewControllers = viewControllers;
    self.collectionView.contentSize = CGSizeMake(Width * self.viewControllers.count, 0);
    CGFloat btnWidth = Width / self.viewControllers.count;
    for (int i=0; i<viewControllers.count; i++) {
        FFSilderButton *btn = [FFSilderButton buttonWithType:UIButtonTypeCustom];
        
        btn.tag = i + 1;
        if (self.type == SceneTypeBlue) {
            if (i == 0) {
                [btn setTitleColor:whiteColor forState:UIControlStateNormal];
            } else {
                [btn setTitleColor:whiteColor forState:UIControlStateNormal];
            }
        } else if (self.type == SceneTypeHlb) {
            if (i == 0) {
                [btn setTitleColor:whiteColor forState:UIControlStateNormal];
            } else {
                [btn setTitleColor:whiteColor forState:UIControlStateNormal];
            }
        }
        
        btn.titleLabel.font = selectFont;
        [btn setTitle:self.titles[i] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        btn.frame = CGRectMake(btnWidth * i, 5, btnWidth, 54);
        
        [self.topView addSubview:btn];
        [self.buttonsArray addObject:btn];
        if (i == 0) {
            btn.currentTransformSx = bigScale;
        } else {
            btn.currentTransformSx = normalScale;
        }
    }
    
    
    //滚动视图
    UIImage *image = [UIImage imageNamed:@"tab_arrow_gray"];
    if (self.type == SceneTypeBlue) {
        image = [UIImage imageNamed:@"tab_cursor_white"];
    }else if (self.type == SceneTypeWhite){
        image = [UIImage imageNamed:@"tab_arrow"];
    } else if (self.type == SceneTypeHlb){
        image = [UIImage imageNamed:@"fs_sl_combinedShape"];
    }
    
    CGFloat sliderViewY = 0.0;
    if (self.type == SceneTypeWhite) {
        sliderViewY = CGRectGetHeight(self.topView.frame) -image.size.height;
    }else if (self.type == SceneTypeHlb){
        sliderViewY = CGRectGetHeight(self.topView.frame) -image.size.height + 0.5;
    }else if (self.type == SceneTypeBlue){
        sliderViewY = CGRectGetHeight(self.topView.frame) -image.size.height +0.5;
    }else{
        sliderViewY = CGRectGetHeight(self.topView.frame) -image.size.height ;
    }
    self.sliderImageView = [[UIImageView alloc] initWithImage:image];
    self.sliderImageView.frame = CGRectMake((Width / self.titles.count - image.size.width)/2.0, sliderViewY, image.size.width, image.size.height);
    [self.topView addSubview:self.sliderImageView];
    
    [self.topView bringSubviewToFront:self.sliderImageView];
}


#pragma mark - UICollectionView
//返回分区个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
//返回每个分区的item个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.viewControllers.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell * cell  = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionId" forIndexPath:indexPath];
    UIViewController *VC = self.viewControllers[indexPath.item];
    [self.parentVC addChildViewController:VC];
    UIView *view = VC.view;
    view.frame = CGRectMake(0, 0, ScreenWidth, self.collectionView.bounds.size.height);
    [cell addSubview:view];
    return cell;
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(ScreenWidth, Height - CGRectGetHeight(self.topView.frame) - 64);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 0,0);
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    _oldOffSetX = scrollView.contentOffset.x;
    self.forbidTouchToAdjustPosition = NO;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    int pageIndex = scrollView.contentOffset.x / self.frame.size.width;
    
    CGRect rect = self.sliderImageView.frame;
    //x轴动态偏移量
    CGFloat x1 = (scrollView.contentOffset.x - pageIndex *self.frame.size.width)/self.titles.count;
    
    //滚动图片的偏移量
    CGFloat x2 =  (Width/self.titles.count- self.sliderImageView.frame.size.width)/2.0 ;
    
    //当页固定的x轴偏移量
    CGFloat x3 = pageIndex * (self.frame.size.width/self.titles.count);
    
    rect.origin.x =x1+ x2 + x3;
    [UIView animateWithDuration:0.15 animations:^{
        self.sliderImageView.frame = rect;
    }];
    //只有pageIndex变化了才会更新按钮信息
    if (x1 == 0.0) {
        [self changeBtnColorWithIndex:pageIndex + 1];
    }
    
    [self changeFontWhenScroll:scrollView];

}

#pragma mark - init
- (void)initTopView {
    self.topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Width, 54)];
    if (self.type == SceneTypeBlue) {
        self.topView.backgroundColor = redColor;
    } else if (self.type == SceneTypeHlb) {
        self.topView.backgroundColor = redColor;
    } else{
        self.topView.backgroundColor = redColor;
    }
    
    //底部横线
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.topView.frame) - 0.5, Width, 0.5)];
    
    if (self.type == SceneTypeBlue) {
        label.backgroundColor = redColor;
    }else if (self.type == SceneTypeWhite){
        label.backgroundColor = whiteColor;
    }else if (self.type == SceneTypeHlb){
        label.backgroundColor = redColor;
    }else{
        label.backgroundColor = redColor;
    }
    [self.topView addSubview:label];
    
}

-(void)initCollectionView {
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumInteritemSpacing = 0.0;
    layout.minimumLineSpacing = 0.01; //上下的间距 可以设置0看下效果
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.topView.frame), ScreenWidth, ScreenHeight - CGRectGetHeight(self.topView.frame) - 64) collectionViewLayout:layout];
    self.collectionView.backgroundColor = whiteColor;
    self.collectionView.alwaysBounceVertical = NO;
    //代理设置
    self.collectionView.delegate=self;
    self.collectionView.dataSource=self;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.bounces = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    [self addSubview:self.collectionView];
    self.collectionView.contentSize = CGSizeMake(ScreenWidth * self.viewControllers.count, 0);
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"collectionId"];
    
}


@end
