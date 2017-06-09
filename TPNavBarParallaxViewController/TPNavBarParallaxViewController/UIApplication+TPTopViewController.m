//
//  UIApplication+TPTopViewController.m
//  TPNavBarParallaxViewController
//
//  Created by Tpphha on 2017/6/8.
//  Copyright © 2017年 Tpphha. All rights reserved.
//

#import "UIApplication+TPTopViewController.h"

@implementation UIApplication (TPTopViewController)


- (UIViewController *)topViewController
{
    return [self _visibleViewControllerFrom:self.keyWindow.rootViewController];
}


- (UIViewController *)_visibleViewControllerFrom:(UIViewController *)vc
{
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self _visibleViewControllerFrom:[((UINavigationController *) vc) visibleViewController]];
    }
    
    if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self _visibleViewControllerFrom:[((UITabBarController *) vc) selectedViewController]];
    }
    
    if (vc.presentedViewController) {
        return [self _visibleViewControllerFrom:vc.presentedViewController];
    }
    
    return vc;
    
}

@end
