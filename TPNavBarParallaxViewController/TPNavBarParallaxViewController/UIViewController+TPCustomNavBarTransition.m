//
//  UIViewController+TPCustomNavBarTransition.m
//  TPNavBarParallaxViewController
//
//  Created by Tpphha on 2017/6/8.
//  Copyright © 2017年 Tpphha. All rights reserved.
//

#import "UIViewController+TPCustomNavBarTransition.h"
#import <objc/runtime.h>

@implementation UIViewController (TPCustomNavBarTransition)

- (void)setBarStyle:(TPNavigationBarStyle)barStyle {
    objc_setAssociatedObject(self, _cmd, @(barStyle), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (TPNavigationBarStyle)barStyle {
    return [(NSNumber *)objc_getAssociatedObject(self, @selector(setBarStyle:)) unsignedIntegerValue];
}

- (void)setPreviousBarStyle:(TPNavigationBarStyle)previousBarStyle {
    objc_setAssociatedObject(self, _cmd, @(previousBarStyle), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (TPNavigationBarStyle)previousBarStyle {
    return [(NSNumber *)objc_getAssociatedObject(self, @selector(setPreviousBarStyle:)) unsignedIntegerValue];
}

- (void)setNextBarStyle:(TPNavigationBarStyle)nextBarStyle {
    objc_setAssociatedObject(self, _cmd, @(nextBarStyle), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (TPNavigationBarStyle)nextBarStyle {
    return [(NSNumber *)objc_getAssociatedObject(self, @selector(setNextBarStyle:)) unsignedIntegerValue];
}


@end
