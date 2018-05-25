//
//  LoginView.m
//  test_1
//
//  Created by 吴疆 on 2018/5/16.
//  Copyright © 2018年 吴疆. All rights reserved.
//

#import "LoginView.h"
#import "SqlUse.h"
#import "FirstView.h"
@interface LoginView ()

@end

@implementation LoginView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [_login addTarget:self action:@selector(pressLogin:) forControlEvents:UIControlEventTouchDown];
    [_userRegister addTarget:self action:@selector(pressRegister:) forControlEvents:UIControlEventTouchDown];
    _userName.placeholder = @"请输入用户名...";
    _userPassword.placeholder = @"请输入密码...";
    _userPassword.keyboardType = UIKeyboardTypeNamePhonePad;
    _userPassword.secureTextEntry = YES;
    _userPassword.delegate = self;
    //初始化数据库
    SqlUse* user = [[SqlUse alloc]init];
    if (user) {
        NSLog(@"数据库初始化成功");
    }else{
        NSLog(@"数据库初始化失败");
    }
    
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    if (_userPassword.text.length <= 8) {
        return YES;
    }else{
        UIAlertController* acSecceed = [UIAlertController alertControllerWithTitle:@"密码超过长度限制" message:nil preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:acSecceed animated:YES completion:^{
            
        }];
        UIAlertAction* a1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"点击确定");
        }];
        [acSecceed addAction:a1];
        return NO;
    }
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //回收键盘
    [_userPassword resignFirstResponder];
    [_userName resignFirstResponder];
    
    SqlUse* userin = [[SqlUse alloc]init];
    if ([userin test]) {
        NSLog(@"成功查找数据");
    }
}
//点击登陆按钮
-(void)pressLogin:(UIButton*)btn{
    NSLog(@"1");
    
    
    SqlUse* userin = [[SqlUse alloc]init];
    
    userin.userName = _userName.text;
    userin.userPassword = _userPassword.text;
    
    if ([userin LoginUser]) {
        UIAlertController* acSecceed = [UIAlertController alertControllerWithTitle:@"登陆成功" message:nil preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:acSecceed animated:YES completion:^{
            
        }];
        //警告框按钮
        UIAlertAction* a1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"点击确定");
            FirstView* fv = [[FirstView alloc]init];
            fv.username = _userName.text;
            fv.userpassword = _userPassword.text;
            fv.userMemo = userin.userMemo;
            NSLog(@"1:%@.%@",fv.username,fv.userpassword);
            fv.title = fv.userMemo;
            UINavigationController* nav = [[UINavigationController alloc]initWithRootViewController:fv];
            //[self.navigationController pushViewController:fv animated:YES];
            [self presentViewController:nav animated:YES completion:^{
                
            }];
            
        }];
        
        UIAlertAction* a2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"点击取消");
        }];
        [acSecceed addAction:a1];
        [acSecceed addAction:a2];
    }else{
        UIAlertController* acSecceed = [UIAlertController alertControllerWithTitle:@"用户名或密码不正确请重新输入！" message:nil preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:acSecceed animated:YES completion:^{
            
        }];
        //警告框按钮
        UIAlertAction* a1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"点击确定");
            
            //推出主界面
            
        }];
        
        UIAlertAction* a2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"点击取消");
            
        }];
        [acSecceed addAction:a1];
        [acSecceed addAction:a2];
    }
    
    
    
    
    
}



-(void)pressRegister:(UIButton*)btn{
    NSLog(@"2");
    
    UIAlertController* al = [UIAlertController alertControllerWithTitle:@"注册" message:@"请填写用户名和密码" preferredStyle:UIAlertControllerStyleAlert];
    //UIAlertControllerStyleActionSheet 从下方弹出的警告窗；
    //UIAlertControllerStyleAlert 正常弹出的警告窗；
    
    [al addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"请输入用户名";
    }];
    
    [al addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"请输入密码";
    }];
    
    UIAlertAction* a2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击取消");
    }];
    [al addAction:a2];
    
    UIAlertAction* a1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击确定");
        SqlUse* user = [[SqlUse alloc]init];
        user.userName = al.textFields.firstObject.text;
        user.userPassword = al.textFields.lastObject.text;
        if ( [user RegisterUser]) {
            NSLog(@"注册成功");
            
        }else{
            NSLog(@"注册失败");
        }
        
      
        
        
    }];
    
    [al addAction:a1];
    [self presentViewController:al animated:YES completion:^{
        
    }];
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
