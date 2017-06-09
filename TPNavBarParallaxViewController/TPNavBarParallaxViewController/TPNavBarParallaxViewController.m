//
//  TPNavBarParallaxViewController.m
//  TPNavBarParallaxViewController
//
//  Created by Tpphha on 2017/6/8.
//  Copyright © 2017年 Tpphha. All rights reserved.
//

#import "TPNavBarParallaxViewController.h"
#import "UIImage+YYAdd.h"

#define kNavBarParallaxBeginProgress 0.2

@interface TPNavBarParallaxViewController ()
@property (nonatomic, strong) UIView *currentParallaxTargetView;
@property (nonatomic, strong) UIImage *currentParallaxBlurImage;
@end

@implementation TPNavBarParallaxViewController

#pragma mark - initialization
- (void)didInitialized {
    [super didInitialized];
    _customNavBarTransition = YES;
    self.barStyle = TPNavigationBarStyleOrigin;
}

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - public
- (void)updateNavigationBarByParallaxProgress {
    
    [self shouldSetStatusBarStyleLight] ? [QMUIHelper renderStatusBarStyleLight] : [QMUIHelper renderStatusBarStyleDark];
    
    @autoreleasepool {
        UIColor *tintColor = [self navigationBarTintColor];
        [self.navigationController.navigationBar setBackgroundImage:[self navigationBarBackgroundImage] forBarMetrics:UIBarMetricsDefault];
        [self.navigationController.navigationBar setShadowImage:[self navigationBarShadowImage]];
        [self.navigationController.navigationBar setTintColor:tintColor];
        self.titleView.titleLabel.textColor = tintColor;
    }
    
}


- (void)setNeedsUpdateNavigationBarParallaxBlur {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.currentParallaxBlurImage = nil;
        [self updateNavigationBarByParallaxProgress];
    });
}


#pragma mark - utility
- (BOOL)hasParallaxTargetView {
    return [self respondsToSelector:@selector(navigationBarParallaxTargetView)] && [self navigationBarParallaxTargetView] != nil;
}



#pragma mark - delegate

- (CGFloat)navigationBarParallaxProgress {
    return 1.0f;
}

- (UIImage *)navigationBarBackgroundImage {
    UIImage *img = nil;
    CGFloat progress = [self navigationBarParallaxProgress];
    
    if ([self hasParallaxTargetView]) {
        
        if (progress < kNavBarParallaxBeginProgress) {
            img = UIImageMake(@"statusbar_mask");
            img = [img resizableImageWithCapInsets:UIEdgeInsetsZero resizingMode:UIImageResizingModeStretch];
            return img;
        }else {
            
            UIView *targetView = [self navigationBarParallaxTargetView];
            
            if (self.currentParallaxTargetView != targetView) {
                self.currentParallaxTargetView = targetView;
            }
            if (!self.currentParallaxBlurImage) {
                UINavigationBar *navBar = self.navigationController.navigationBar;
                UIImage *snapshotImage = [[UIImage qmui_imageWithView:targetView afterScreenUpdates:NO] qmui_imageWithScaleToSize:CGSizeMake(navBar.frame.size.width, navBar.frame.size.height + StatusBarHeight) contentMode:UIViewContentModeScaleToFill];
                
                self.currentParallaxBlurImage = [snapshotImage imageByBlurRadius:20 tintColor:[UIColor colorWithWhite:0.11 alpha:0.6] tintMode:kCGBlendModeNormal saturation:1.8 maskImage:nil];
            }
            
            return [self.currentParallaxBlurImage qmui_imageWithAlpha:progress];
        }
        
    }else {
        if (progress < kNavBarParallaxBeginProgress) {
            img = UIImageMake(@"statusbar_mask");
            img = [img resizableImageWithCapInsets:UIEdgeInsetsZero resizingMode:UIImageResizingModeStretch];
        }else {
            UIImage *navBarBgImg = self.navBarBackgroundImage ? : QMUICMI.navBarBackgroundImage;
            img = [navBarBgImg resizableImageWithCapInsets:UIEdgeInsetsMake(1, 1, 1, 1)];
            
            img = [img qmui_imageWithAlpha:progress];
        }
        
        return img;
    }
    
}

- (UIImage *)navigationBarShadowImage {
    UIImage *shadowImg = self.navBarShadowImage ? : QMUICMI.navBarShadowImage;
    CGFloat progress = [self navigationBarParallaxProgress];
    
    if (progress < kNavBarParallaxBeginProgress ||
        [self hasParallaxTargetView]) {
        return [shadowImg qmui_imageWithAlpha:0];
    }else {
        return [shadowImg qmui_imageWithAlpha:progress];
    }
}


- (UIColor *)navigationBarTintColor {
    if ([self hasParallaxTargetView]) {
        return [UIColor whiteColor];
    }else {
        return [[UIColor whiteColor] qmui_transitionToColor:QMUICMI.navBarTintColor progress:[self navigationBarParallaxProgress]];
    }
}

- (BOOL)shouldSetStatusBarStyleLight {
    if ([self navigationBarParallaxProgress] > 0.68 &&
        ![self hasParallaxTargetView]) {
        return NO;
    }else {
        return YES;
    }
}


#pragma mark - NavigationBarTransition

//- (BOOL)shouldCustomNavigationBarTransitionWhenPushAppearing {
//    return self.customNavBarTransition;
//}

- (BOOL)shouldCustomNavigationBarTransitionWhenPushDisappearing {
    BOOL value = self.customNavBarTransition &&
    (!(self.barStyle == TPNavigationBarStyleOrigin &&
       self.nextBarStyle == TPNavigationBarStyleOrigin));
    return value;
}

//- (BOOL)shouldCustomNavigationBarTransitionWhenPopAppearing {
//    return self.customNavBarTransition;
//}

- (BOOL)shouldCustomNavigationBarTransitionWhenPopDisappearing {
    BOOL value = self.customNavBarTransition &&
    (!(self.barStyle == TPNavigationBarStyleOrigin &&
       self.previousBarStyle == TPNavigationBarStyleOrigin));
    return value;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
