//
//  UIViewController+CKAlert.m
//  YunBu
//
//  Created by Sundear on 2017/6/8.
//  Copyright © 2017年 谢鑫. All rights reserved.
//

#import "UIViewController+CKAlert.h"

@implementation UIViewController (CKAlert)

-(void)CKAlertTitle:(NSString*)title SubTitle:(NSString *)subtitle Alignment:(NSTextAlignment)Alignment Items:(NSArray *)items Click:(void(^)(int Dex))confirm{

    //回到主线程 防止系统didselect等代理中线程混乱
//    dispatch_async(dispatch_queue_create(0, 0), ^{
    dispatch_async(dispatch_get_main_queue(), ^{

        CKAlertViewController *alertC = [CKAlertViewController alertControllerWithTitle:title message:subtitle];
        alertC.messageAlignment=Alignment;
        
        for (int k=0; k<items.count; k++) {
            CKAlertAction *Actions = [CKAlertAction actionWithTitle:items[k] handler:^(CKAlertAction *action) {
                if(confirm)confirm(k);
            }];
            [alertC addAction:Actions];
        }

        [self presentViewController:alertC animated:NO completion:nil];


        //处理空控制器 以rootview作为容器 请避免在这种情况下调用时remove rootVC
        if ([self.superclass isEqual:[UIResponder class]]) {
            [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertC animated:NO completion:nil];
        }

    });//});


}






//封装系统AlerC

-(void)SystemAlerTitle:(NSString*)title SubTitle:(NSString *)subtitle Style:(UIAlertControllerStyle)style Items:(NSArray *)items Click:(void(^)(int Dex))confirm Cancel:(void(^)())cancel{

    dispatch_async(dispatch_get_main_queue(), ^{

        UIAlertController *alertC = [UIAlertController alertControllerWithTitle:title message:subtitle preferredStyle:style];

        for (int k=0; k<items.count; k++) {
            
            NSInteger StyleNum=UIAlertActionStyleDefault;
            NSArray *RedKeys=@[@"退出", @"禁用", @"关闭", @"停止", @"删除"];
            if ([RedKeys containsObject:items[k]]) {
                StyleNum=UIAlertActionStyleDestructive;
            }
            UIAlertAction *Actions = [UIAlertAction actionWithTitle:items[k] style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                if(confirm)confirm(k);
            }];[alertC addAction:Actions];
        }

        UIAlertAction *cancelAct = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            if(cancel)cancel();
        }];[alertC addAction:cancelAct];

        [self presentViewController:alertC animated:YES completion:nil];

        //处理空控制器 以rootview作为容器  请避免在这种情况下调用时remove rootVC
        if ([self.superclass isEqual:[UIResponder class]]) {
            [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertC animated:NO completion:nil];
        }

    });
}
@end
