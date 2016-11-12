//
//  DDifferentPageVC.m
//  UsingFrameworks
//
//  Created by Derek on 2016/11/12.
//  Copyright © 2016年 DXY. All rights reserved.
//

#import "DDifferentPageVC.h"
#import "DBeautyVC.h"
#import "DHandsomeVC.h"
#import "UIViewController+DXTransition.h"

@interface DDifferentPageVC ()

@property (weak, nonatomic) IBOutlet UIButton *beautyBtn;
@property (weak, nonatomic) IBOutlet UIButton *handsomeBtn;
@property (weak, nonatomic) IBOutlet UIView *containerView;

@property (nonatomic) UIViewController *beautyVC;
@property (nonatomic) UIViewController *handsomeVC;

@end

@implementation DDifferentPageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _beautyVC = [DBeautyVC new];
    _handsomeVC = [DHandsomeVC new];
    
    [_beautyBtn addTarget:self action:@selector(beautyBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [_handsomeBtn addTarget:self action:@selector(handsomeBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)beautyBtnClicked:(id)sender {
    [self transitionToViewController:_beautyVC viewControllerBaseView:_containerView duration:.3 options:UIViewAnimationOptionTransitionCrossDissolve animation:nil];
}

- (void)handsomeBtnClicked:(id)sender {
    [self transitionToViewController:_handsomeVC viewControllerBaseView:_containerView];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end