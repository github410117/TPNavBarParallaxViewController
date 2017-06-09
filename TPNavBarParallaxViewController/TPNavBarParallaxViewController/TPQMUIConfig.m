//
//  TPQMUIConfig.m
//  TPNavBarParallaxViewController
//
//  Created by Tpphha on 2017/6/8.
//  Copyright © 2017年 Tpphha. All rights reserved.
//

#import "TPQMUIConfig.h"
#import <QMUIKit.h>

@implementation TPQMUIConfig
+ (void)setup {
//    [UINavigationBar appearance].translucent = NO;
    QMUICMI.navBarBackgroundImage = [UIImage qmui_imageWithColor:[UIColor qmui_randomColor]];
    QMUICMI.navBarTintColor = UIColorBlack;
    QMUICMI.navBarBarTintColor = nil;
//    QMUICMI.navBarShadowImage = [UIImage new];
    QMUICMI.navBarShadowImage = [UIImage qmui_imageWithColor:UIColorGrayLighten size:CGSizeMake(SCREEN_WIDTH, PixelOne) cornerRadius:0];
    QMUICMI.navBarTitleColor = NavBarTintColor;                                 // NavBarTitleColor : UINavigationBar 的标题颜色，以及 QMUINavigationTitleView 的默认文字颜色
    QMUICMI.navBarTitleFont = UIFontBoldMake(17);                               // NavBarTitleFont : UINavigationBar 的标题字体，以及 QMUINavigationTitleView 的默认字体
    QMUICMI.navBarBackButtonTitlePositionAdjustment = UIOffsetZero;             // NavBarBarBackButtonTitlePositionAdjustment : 导航栏返回按钮的文字偏移
    QMUICMI.navBarBackIndicatorImage = [UIImage qmui_imageWithShape:QMUIImageShapeNavBack size:CGSizeMake(12, 20) tintColor:NavBarTintColor];                                     // NavBarBackIndicatorImage : 导航栏的返回按钮的图片
}

@end
