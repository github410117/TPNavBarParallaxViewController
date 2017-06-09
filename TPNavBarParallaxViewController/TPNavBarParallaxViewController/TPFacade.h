//
//  TPFacade.h
//  TPNavBarParallaxViewController
//
//  Created by Tpphha on 2017/6/8.
//  Copyright © 2017年 Tpphha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TPFacade : NSObject
+ (void)pushViewController:(UIViewController*)viewController animated:(BOOL)animated completion:(void (^)(void))completion;

@end
