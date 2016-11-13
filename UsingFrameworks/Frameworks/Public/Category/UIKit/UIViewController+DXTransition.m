//
//  UIViewController+DXTransition.m
//  UsingFrameworks
//
//  Created by Derek on 2016/11/12.
//  Copyright © 2016年 DXY. All rights reserved.
//

#import "UIViewController+DXTransition.h"
#import <objc/runtime.h>

// FIXME: Unbalanced calls to begin/end appearance transitions for <DBeautyVC: 0x7f8a25502e10>

@implementation UIViewController (DXTransition)

- (void)transitionToViewController:(UIViewController * _Nullable)toViewController
            viewControllerBaseView:(UIView * _Nullable)baseView {
    [self transitionToViewController:toViewController viewControllerBaseView:baseView duration:0 options:UIViewAnimationOptionTransitionNone animation:nil];
}

- (void)transitionToViewController:(UIViewController * _Nullable)toViewController
            viewControllerBaseView:(UIView * _Nullable)baseView
                          duration:(NSTimeInterval)duration
                           options:(UIViewAnimationOptions)options
                         animation:(void (^ __nullable)(void))animations {
    
    if (!toViewController || !baseView) {
        return;
    }
    
    if (toViewController == [self currentChildViewController]) {
        return;
    }
    
    if (![self.childViewControllers containsObject:toViewController]) {
        [self addChildViewController:toViewController];
        [baseView addSubview:toViewController.view];
        toViewController.view.frame = baseView.bounds;
        toViewController.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    
    UIViewController *fromViewController = [self currentChildViewController];
    
    if (!fromViewController || fromViewController.parentViewController != self) {
        [toViewController didMoveToParentViewController:self];
        [self setCurrentChildViewController_dx_transition_02f4daef2710477abaebf13a4393fd30:toViewController];
    }
    else {
        [fromViewController willMoveToParentViewController:nil];
        __weak typeof(self) weakSelf = self;
        [self transitionFromViewController:fromViewController
                          toViewController:toViewController
                                  duration:duration
                                   options:options
                                animations:animations
                                completion:^(BOOL finished) {
                                    
                                    [toViewController didMoveToParentViewController:weakSelf];
                                    [fromViewController removeFromParentViewController];
                                    [weakSelf setCurrentChildViewController_dx_transition_02f4daef2710477abaebf13a4393fd30:toViewController];
                                }];
    }
}

- (UIViewController *)currentChildViewController {
    return [self currentChildViewController_dx_transition_02f4daef2710477abaebf13a4393fd30];
}

#pragma mark - current child view controller

- (UIViewController *)currentChildViewController_dx_transition_02f4daef2710477abaebf13a4393fd30 {
    return objc_getAssociatedObject(self, @selector(currentChildViewController_dx_transition_02f4daef2710477abaebf13a4393fd30));
}

- (void)setCurrentChildViewController_dx_transition_02f4daef2710477abaebf13a4393fd30:(UIViewController *)currentVC {
    objc_setAssociatedObject(self, @selector(currentChildViewController_dx_transition_02f4daef2710477abaebf13a4393fd30), currentVC, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
