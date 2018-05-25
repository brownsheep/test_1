//
//  LoginView.h
//  test_1
//
//  Created by 吴疆 on 2018/5/16.
//  Copyright © 2018年 吴疆. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginView : UIViewController
<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *userPassword;
@property (weak, nonatomic) IBOutlet UIButton *login;
@property (weak, nonatomic) IBOutlet UIButton *userRegister;


@end
