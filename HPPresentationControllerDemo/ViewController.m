//
//  ViewController.m
//  HPPresentationControllerDemo
//
//  Created by 马海平 on 2018/7/28.
//  Copyright © 2018年 马海平. All rights reserved.
//

#import "ViewController.h"
#import "prViewController.h"
#import "HPPresentationController.h"
#import "ViewController2.h"
@interface ViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 150, 50)];
    button.backgroundColor = [UIColor blueColor];
    [button setTitle:@"弹窗" forState:UIControlStateNormal];
    button.center = self.view.center;
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton * button2 = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 150, 50)];
    button2.backgroundColor = [UIColor blueColor];
    [button2 setTitle:@"跳转" forState:UIControlStateNormal];
    button2.center = CGPointMake(self.view.center.x, self.view.center.y + 100);
    [button2 addTarget:self action:@selector(buttonClick2:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    
}
- (void)buttonClick:(UIButton *)btn{
    prViewController *xw = [[prViewController alloc]init];
    xw.modalPresentationStyle = UIModalPresentationCustom;// 设置 动画样式
    xw.transitioningDelegate = self;
    [self presentViewController:xw animated:true completion:nil];
}
- (void)buttonClick2:(UIButton *)btn{
    ViewController2 * pushVC = [[ViewController2 alloc]init];
    [self.navigationController pushViewController:pushVC animated:true];
}
// 返回控制控制器弹出动画的对象
/**
 *  参数: presentedViewController     将要跳转到的目标控制器
 presentingViewController    跳转前的原控制器
 */
- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source{
    
    return [[HPPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
