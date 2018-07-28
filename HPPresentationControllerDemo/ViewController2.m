//
//  ViewController2.m
//  HPPresentationControllerDemo
//
//  Created by 马海平 on 2018/7/28.
//  Copyright © 2018年 马海平. All rights reserved.
//

#import "ViewController2.h"
#import "prViewController.h"
@interface ViewController2 ()<UIPopoverPresentationControllerDelegate>
@property (nonatomic,strong) UIButton *popViewButton;
@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:self.popViewButton];
    
    
}
#pragma mark - Lazy
- (UIButton *)popViewButton{
    
    if (!_popViewButton) {
        _popViewButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 150, 50)];
        _popViewButton.backgroundColor = [UIColor redColor];
        [_popViewButton setTitle:@"POP" forState:UIControlStateNormal];
        [_popViewButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        _popViewButton.center = self.view.center;
    }
    return _popViewButton;
    
}
- (void)buttonClick:(UIButton *)btn{
    prViewController * test = [[prViewController alloc]init];
    test.preferredContentSize = CGSizeMake(300, 200);//设置浮窗的宽高
    test.modalPresentationStyle = UIModalPresentationPopover;
    
    /* Get the popover presentation controller and configure it. */
    
    //获取TestViewController的UIPopoverPresentationController
    UIPopoverPresentationController * popover = [test popoverPresentationController];
    popover.delegate = self;
    popover.permittedArrowDirections = UIPopoverArrowDirectionUp;//设置箭头位置
    popover.sourceView = self.popViewButton;//设置目标视图
    popover.sourceRect = self.popViewButton.bounds;//弹出视图显示位置
    popover.backgroundColor = [UIColor redColor];//设置弹窗背景颜色(效果图里红色区域)
    [self presentViewController:test animated:YES completion:nil];

    /*
     默认情况下
     只要UIPopoverController显示在屏幕上，UIPopoverController背后的所有控件默认是不能跟用户进行正常交互的
     点击UIPopoverController区域外的控件，UIPopoverController默认会消失
     要想点击UIPopoverController区域外的控件时不让UIPopoverController消失，解决办法是设置passthroughViews属性
     @property (nonatomic, copy) NSArray *passthroughViews;
     这个属性是设置当UIPopoverController显示出来时，哪些控件可以继续跟用户进行正常交互。这样的话，点击区域外的控件就不会让UIPopoverController消失了
     */
}

#pragma mark --  实现代理方法
//默认返回的是覆盖整个屏幕，需设置成UIModalPresentationNone。
- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller{
    return UIModalPresentationNone;
}

//点击蒙版是否消失，默认为yes；
// Called on the delegate when the popover controller will dismiss the popover. Return NO to prevent the
// dismissal of the view.
-(BOOL)popoverPresentationControllerShouldDismissPopover:(UIPopoverPresentationController *)popoverPresentationController{
    NSLog(@"是否允许弹窗消失");
    return YES;
}

//弹框消失时调用的方法
// Called on the delegate when the user has taken action to dismiss the popover. This is not called when the popover is dimissed programatically.
-(void)popoverPresentationControllerDidDismissPopover:(UIPopoverPresentationController *)popoverPresentationController{
    
    NSLog(@"弹框已经消失");
    
}
- (void)prepareForPopoverPresentation:(UIPopoverPresentationController *)popoverPresentationController{
    NSLog(@"弹窗准备出现");
}
 //popoverController的位置改变的时候调用（如竖屏变横屏）
// -popoverPresentationController:willRepositionPopoverToRect:inView: is called on your delegate when the
// popover may require a different view or rectangle.
- (void)popoverPresentationController:(UIPopoverPresentationController *)popoverPresentationController willRepositionPopoverToRect:(inout CGRect *)rect inView:(inout UIView  * __nonnull * __nonnull)view{
    
    
}







/*另外一种创建方式
//1.新建一个popoverController并设置其内容控制器
     YYMenuViewController *menuVc=[[YYMenuViewController alloc]init];
     self.popover=[[UIPopoverController alloc]initWithContentViewController:menuVc];

     //2.显示
     //2.1第一种方式
 //    [self.popover presentPopoverFromBarButtonItem:<#(UIBarButtonItem *)#> permittedArrowDirections:<#(UIPopoverArrowDirection)#> animated:<#(BOOL)#>];
     //2.2第二种方式
     [self.popover presentPopoverFromRect:sender.bounds inView:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
     //说明：popover会指向sender.bounds这一块矩形框，这块矩形框以sender的左上角为坐标原点
     //注意：注意sender.frame和sender.bounds的区别
*/






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
