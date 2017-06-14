# YsAlert

CKAlertViewController原作：https://github.com/Pr-Chen/CKAlertViewController

对一个布局优良的alert(CKAlertViewController)的封装与改进 以及对UIAlertController进行封装简化

优化内容： 

* 加入暗色背景
* 对"退出","禁用","关闭","停止","删除" 等关键字标签加红 同理对 “取消",@"放弃"等关键字标签淡化。
* 支持在任何地方调用CKAlert或系统AlertC 但需注意不能在调用时移除ROOT控制器
* 方法调用封装时已回到主线程 不会因系统协议导致线程异常等调用失效
* 当CKAlert只存在2个标签时，加入一条纵线 同时修复横线在动画中闪动的bug

调用示例：

```objective-c
[self CKAlertTitle:@"警告" SubTitle:@"删除这条信息" Alignment:1 Items:@[@"取消", @"删除"] Click:^(int Dex) {
    if (Dex==0) return;//忽略取消
    NSLog(@"已删除!");
}];
```
```objective-c

[[UIViewController new] SystemAlerTitle:@"警告" SubTitle:@"删除这条信息" Style:0 Items:@[@"删除"] Click:^(int Dex) {
    NSLog(@"system1:已删除!");
} Cancel:nil];
```
