//
//  TPNavBarParallaxViewController.h
//  TPNavBarParallaxViewController
//
//  Created by Tpphha on 2017/6/8.
//  Copyright © 2017年 Tpphha. All rights reserved.
//

#import <QMUIKit/QMUIKit.h>
#import "UIViewController+TPCustomNavBarTransition.h"

@protocol TPNavBarParallaxProtocol
@optional
- (CGFloat)navigationBarParallaxProgress;
- (UIView *)navigationBarParallaxTargetView;
@end

@interface TPNavBarParallaxViewController : QMUICommonViewController <TPNavBarParallaxProtocol>
@property(nonatomic, assign) BOOL customNavBarTransition;
@property (nonatomic, strong) UIImage *navBarBackgroundImage;
@property (nonatomic, strong) UIImage *navBarShadowImage;

- (void)updateNavigationBarByParallaxProgress;

- (void)setNeedsUpdateNavigationBarParallaxBlur;
@end
