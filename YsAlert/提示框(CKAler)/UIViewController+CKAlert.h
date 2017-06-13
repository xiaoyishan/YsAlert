//
//  UIViewController+CKAlert.h
//  YunBu
//
//  Created by Sundear on 2017/6/8.
//  Copyright © 2017年 谢鑫. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CKAlertViewController.h"



@interface UIViewController (CKAlert)

-(void)CKAlertTitle:(NSString*)title SubTitle:(NSString *)subtitle Alignment:(NSTextAlignment)Alignment Items:(NSArray *)items Click:(void(^)(int Dex))confirm;


//封装系统AlerC
-(void)SystemAlerTitle:(NSString*)title SubTitle:(NSString *)subtitle Style:(UIAlertControllerStyle)style Items:(NSArray *)items Click:(void(^)(int Dex))confirm Cancel:(void(^)())cancel;

@end
