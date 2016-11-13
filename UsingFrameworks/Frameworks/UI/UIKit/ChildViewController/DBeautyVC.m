//
//  DBeautyVC.m
//  UsingFrameworks
//
//  Created by Derek on 2016/11/12.
//  Copyright © 2016年 DXY. All rights reserved.
//

#import "DBeautyVC.h"

@interface DBeautyVC ()

@property (nonatomic) UIRefreshControl *refreshControl;

@end

@implementation DBeautyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:scrollView];
    
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1000);
    
    _refreshControl = [UIRefreshControl new];
    [_refreshControl addTarget:self action:@selector(refreshControlValueChanged:) forControlEvents:UIControlEventValueChanged];
    [scrollView addSubview:_refreshControl];
}

- (void)refreshControlValueChanged:(id)sender {
    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakSelf.refreshControl endRefreshing];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
