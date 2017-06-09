//
//  TPTestViewController.m
//  TPNavBarParallaxViewController
//
//  Created by Tpphha on 2017/6/8.
//  Copyright © 2017年 Tpphha. All rights reserved.
//

#import "TPTestViewController.h"
#import "TPFacade.h"
#import "ViewController.h"

@interface TPTestViewController () <
QMUITableViewDelegate,
QMUITableViewDataSource
>
@property (nonatomic, strong) QMUITableView *tableView;
@end

@implementation TPTestViewController

#pragma mark - initialization
- (void)didInitialized {
    [super didInitialized];
    self.barStyle = TPNavigationBarStyleParallax;
    self.automaticallyAdjustsScrollViewInsets = NO;
}

#pragma mark - livf cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"parallax";
}


- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.tableView.frame = self.view.bounds;
}

- (void)initSubviews {
    [super initSubviews];
    [self.view addSubview:self.tableView];
    
    if (self.isBlurStyle) {
        UIImageView *imgView = [[UIImageView alloc] initWithImage:UIImageMake(@"beautiful")];
        self.tableView.tableHeaderView = imgView;
    }
}

- (UIView *)navigationBarParallaxTargetView {
    return self.tableView.tableHeaderView;
}

- (CGFloat)navigationBarParallaxProgress {
    CGFloat offsetY = self.tableView.contentOffset.y;
    if (offsetY <= 0) {
        return 0;
    }else if (offsetY > 0 && offsetY < NavigationContentTop) {
        CGFloat progress = offsetY / (CGFloat)NavigationContentTop;
        return progress;
    }else {
        return 1;
    }
}

#pragma mark - scroll view delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self updateNavigationBarByParallaxProgress];
}

#pragma mark - table dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    QMUITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseId" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"QMUI_DEMO_%@", @(indexPath.row)];
    return cell;
}


#pragma mark - table delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView qmui_clearsSelection];
    ViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ViewController"];
    [TPFacade pushViewController:vc animated:YES completion:nil];
}

#pragma mark - lazy
- (QMUITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[QMUITableView alloc] initWithFrame:self.view.bounds];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[QMUITableViewCell class] forCellReuseIdentifier:@"reuseId"];
    }
    return _tableView;
}


@end
