//
//  ViewController.m
//  YsAlert
//
//  Created by Sundear on 2017/6/13.
//  Copyright © 2017年 xiexin. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+CKAlert.h"

#import "CallTest.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    for (UIButton *btn in _Buttuns) {
        [btn addTarget:self action:NSSelectorFromString(btn.titleLabel.text) forControlEvents:UIControlEventTouchUpInside];
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [CallTest system1];//处理空控制器 以rootview作为容器 请避免在这种情况下调用时remove rootVC
}


-(void)test1{
    [self CKAlertTitle:@"警告" SubTitle:@"删除这条信息?" Alignment:1 Items:@[@"取消", @"删除"] Click:^(int Dex) {
        if (Dex==0) return;//忽略取消
        NSLog(@"已删除!");
    }];
}

-(void)test2{
    [self CKAlertTitle:@"发现新版本！" SubTitle:@"本次更新修复：\n1: xxx\n2: xxx\n3: xxx" Alignment:9 Items:@[@"取消", @"更新"] Click:^(int Dex) {
        if (Dex==0) return;//忽略取消
        NSLog(@"更新");
    }];
}

-(void)test3{
    NSArray *Allways=@[@"百度地图", @"高德地图", @"腾讯地图", @"苹果地图", @"谷歌地图",@"取消"];
    [self CKAlertTitle:@"选择一种打开方式" SubTitle:nil Alignment:1 Items:Allways Click:^(int Dex) {
        if (Allways.count == Dex+1) return;//忽略取消
        NSLog(@"选择: %@",Allways[Dex]);
    }];
}



-(void)system1{
    [self SystemAlerTitle:@"警告" SubTitle:@"删除这条信息?" Style:0 Items:@[@"删除"] Click:^(int Dex) {
        NSLog(@"system1:已删除!");
    } Cancel:nil];

}

-(void)system2{
    [self SystemAlerTitle:@"警告" SubTitle:@"删除这条信息?" Style:1 Items:@[@"删除"] Click:^(int Dex) {
        NSLog(@"system2:已删除!");
    } Cancel:^{
        NSLog(@"system2:放弃删除!");
    }];
}

-(void)system3{
    NSArray *Allways=@[@"百度地图", @"高德地图", @"腾讯地图", @"苹果地图", @"谷歌地图"];
    [self SystemAlerTitle:@"选择一种打开方式" SubTitle:nil Style:1 Items:Allways Click:^(int Dex) {
        NSLog(@"选择: %@",Allways[Dex]);
    } Cancel:^{
        NSLog(@"system3:放弃选择!");
    }];

}

@end
