//
//  ViewController.m
//  TPNavBarParallaxViewController
//
//  Created by Tpphha on 2017/6/8.
//  Copyright © 2017年 Tpphha. All rights reserved.
//

#import "ViewController.h"
#import "TPFacade.h"
#import "TPTestViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *switcher;

@end

static BOOL isRandomColor;

@implementation ViewController
#pragma mark - initialization
- (void)didInitialized {
    [super didInitialized];
    self.barStyle = TPNavigationBarStyleOrigin;
}

#pragma mark - livf cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.switcher.on = isRandomColor;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setNavigationItemsIsInEditMode:(BOOL)isInEditMode animated:(BOOL)animated {
    [super setNavigationItemsIsInEditMode:isInEditMode animated:animated]; 
    self.title = @"title";
}

#pragma mark - action
- (IBAction)nextOrigin:(id)sender {
    ViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ViewController"];
    if (self.switcher.isOn) {
        vc.navBarBackgroundImage = [UIImage qmui_imageWithColor:[UIColor qmui_randomColor]];
        vc.barStyle = TPNavigationBarStyleParallax;
    }else {
        self.barStyle = TPNavigationBarStyleOrigin;
        vc.navBarBackgroundImage = self.navBarBackgroundImage;
    }
    
    [TPFacade pushViewController:vc animated:YES completion:nil];
}


- (IBAction)nextParallaxNormal:(id)sender {
    TPTestViewController *testVc = [TPTestViewController new];
    [TPFacade pushViewController:testVc animated:YES completion:nil];
}

- (IBAction)nextPrallaxBlur:(id)sender {
    TPTestViewController *testVc = [TPTestViewController new];
    testVc.isBlurStyle = YES;
    [TPFacade pushViewController:testVc animated:YES completion:nil];
}

- (IBAction)swichterValueChanged:(UISwitch *)sender {
    isRandomColor = sender.isOn;
}

@end
