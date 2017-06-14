//
//  CallTest.m
//  YsAlert
//
//  Created by Sundear on 2017/6/13.
//  Copyright © 2017年 xiexin. All rights reserved.
//

#import "CallTest.h"

@implementation CallTest

-(void)test1{
    [[UIViewController new] CKAlertTitle:@"警告" SubTitle:@"删除这条信息?" Alignment:1 Items:@[@"取消", @"删除"] Click:^(int Dex) {
        if (Dex==0) return;//忽略取消
        NSLog(@"已删除!");
    }];
}

+(void)system1{
    [[UIViewController new] SystemAlerTitle:@"警告" SubTitle:@"删除这条信息?" Style:0 Items:@[@"删除"] Click:^(int Dex) {
        NSLog(@"system1:已删除!");
    } Cancel:nil];
}

@end
