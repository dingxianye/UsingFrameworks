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
#import "UsingFrameworks-Swift.h"

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
    
    
    // 可以实例为任何其它的controller，包括DDifferentPageVC，但是只是显示出来而已   TODO: why can't use DDifferentPageVC
    _beautyVC = [DBeautyVC new];
//    _beautyVC = [DXMainViewController new];   // just like DXMainViewController
    _handsomeVC = [DHandsomeVC new];
    
    
    [_beautyBtn addTarget:self action:@selector(beautyBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [_handsomeBtn addTarget:self action:@selector(handsomeBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self beautyBtnClicked:nil];
}

- (void)beautyBtnClicked:(id)sender {
    [self transitionToViewController:_beautyVC viewControllerBaseView:_containerView duration:.3 options:UIViewAnimationOptionTransitionCrossDissolve animation:nil];
}

- (void)handsomeBtnClicked:(id)sender {
    [self transitionToViewController:_handsomeVC viewControllerBaseView:_containerView duration:.3 options:UIViewAnimationOptionTransitionCrossDissolve animation:nil];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
