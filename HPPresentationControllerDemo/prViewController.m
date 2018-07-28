//
//  prViewController.m
//  ToAppStore
//
//  Created by baidu on 2018/7/27.
//  Copyright © 2018年 马海平. All rights reserved.
//

#import "prViewController.h"
//#import "HPPresentationController.h"
@interface prViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation prViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event ];
    [self dismissViewControllerAnimated:true completion:nil];
}



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
