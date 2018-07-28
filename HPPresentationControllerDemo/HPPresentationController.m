//
//  HPPresentationController.m
//  ToAppStore
//
//  Created by baidu on 2018/7/27.
//  Copyright © 2018年 马海平. All rights reserved.
//

#import "HPPresentationController.h"


@interface HPPresentationController()

@property (nonatomic,strong) UIVisualEffectView *visualView;

@end

@implementation HPPresentationController



#pragma mark -RW
//决定了弹出框的frame
- (CGRect)frameOfPresentedViewInContainerView{
    CGFloat windowH = [UIScreen mainScreen].bounds.size.height;
    CGFloat windowW = [UIScreen mainScreen].bounds.size.width;
    
    self.presentedView.frame = CGRectMake(0, windowH - 300, windowW, 300);
    
    return self.presentedView.frame;
}
//重写此方法可以在弹框即将显示时执行所需要的操作
- (void)presentationTransitionWillBegin{
    // 使用UIVisualEffectView实现模糊效果
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    _visualView = [[UIVisualEffectView alloc] initWithEffect:blur];
    _visualView.frame = self.containerView.bounds;
    _visualView.alpha = 0.4;
    UITapGestureRecognizer * ges = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closed)];
    [_visualView addGestureRecognizer:ges];
    _visualView.backgroundColor = [UIColor blackColor];
    self.containerView.backgroundColor = [UIColor blueColor];
    
    [self.containerView addSubview:_visualView];
}
- (void)closed{
    [self.presentingViewController dismissViewControllerAnimated:true completion:nil];
}
//重写此方法可以在弹框显示完毕时执行所需要的操作
- (void)presentationTransitionDidEnd:(BOOL)completed{
    // 如果呈现没有完成，那就移除背景 View
    if (!completed) {
        [_visualView removeFromSuperview];
    }
}
//重写此方法可以在弹框即将消失时执行所需要的操作
- (void)dismissalTransitionWillBegin{
    _visualView.alpha = 0.0;
}
//重写此方法可以在弹框消失之后执行所需要的操作
- (void)dismissalTransitionDidEnd:(BOOL)completed{
    if (completed) {
        [_visualView removeFromSuperview];
    }
}
//- (instancetype)initWithPresentedViewController:(UIViewController *)presentedViewController presentingViewController:(nullable UIViewController *)presentingViewController{
//    return nil;
//}


@end
