//
//  TPFacade.m
//  TPNavBarParallaxViewController
//
//  Created by Tpphha on 2017/6/8.
//  Copyright © 2017年 Tpphha. All rights reserved.
//

#import "TPFacade.h"
#import "UIApplication+TPTopViewController.h"
#import "UIViewController+TPCustomNavBarTransition.h"
#import <QMUIKit.h>

@implementation TPFacade

+ (UINavigationController *)currentNavigationController {
    return [self currentViewController].navigationController;
}

+ (UIViewController *)currentViewController {
    return [[UIApplication sharedApplication] topViewController];
}


+ (void)pushViewController:(UIViewController*)viewController animated:(BOOL)animated completion:(void (^)(void))completion {
    UINavigationController* curr = [self currentNavigationController];
    
    UIViewController *currViewController = [self currentViewController];
    
    currViewController.nextBarStyle = viewController.barStyle;
    
    viewController.previousBarStyle = currViewController.barStyle;
    
    if([curr isKindOfClass:[QMUINavigationController class]]) {
        QMUINavigationController *currNav = (QMUINavigationController *)curr;
        NSNumber* isViewControllerTransiting = (NSNumber *)[currNav valueForKey:@"isViewControllerTransiting"];;
        if (isViewControllerTransiting.boolValue) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [currNav pushViewController:viewController animated:animated];
                !completion ? : completion();
            });
        }else {
            [currNav pushViewController:viewController animated:animated];
            !completion ? : completion();
        }
    }
    else if(curr){
        [curr pushViewController:viewController animated:animated];
        !completion ? : completion();
    }
    
}


@end
