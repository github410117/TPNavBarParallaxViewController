//
//  UIViewController+TPCustomNavBarTransition.h
//  TPNavBarParallaxViewController
//
//  Created by Tpphha on 2017/6/8.
//  Copyright © 2017年 Tpphha. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, TPNavigationBarStyle) {
    TPNavigationBarStyleOrigin = 1,
    TPNavigationBarStyleParallax,
    // customs something
};



@interface UIViewController (TPCustomNavBarTransition)
@property (nonatomic) TPNavigationBarStyle barStyle;
@property (nonatomic) TPNavigationBarStyle previousBarStyle;
@property (nonatomic) TPNavigationBarStyle nextBarStyle;

@end
