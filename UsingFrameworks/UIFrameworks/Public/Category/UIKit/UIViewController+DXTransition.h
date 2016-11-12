//
//  UIViewController+DXTransition.h
//  UsingFrameworks
//
//  Created by Derek on 2016/11/12.
//  Copyright © 2016年 DXY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (DXTransition)

@property (nonatomic, readonly) UIViewController  * _Nullable currentChildViewController;

- (void)transitionToViewController:(UIViewController * _Nullable)toViewController
              viewControllerBaseView:(UIView * _Nullable)baseView;

- (void)transitionToViewController:(UIViewController * _Nullable)toViewController
            viewControllerBaseView:(UIView * _Nullable)baseView
                          duration:(NSTimeInterval)duration
                           options:(UIViewAnimationOptions)options
                         animation:(void (^ __nullable)(void))animations;

@end
