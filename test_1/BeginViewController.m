//
//  BeginViewController.m
//  test_1
//
//  Created by 吴疆 on 2018/5/16.
//  Copyright © 2018年 吴疆. All rights reserved.
//

#import "BeginViewController.h"
#import "LoginView.h"
@interface BeginViewController ()

@end

@implementation BeginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
  
    //显示图片
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView transitionWithView:self.imageView duration:0.3 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
            
            _imageView.image = [UIImage imageNamed:@"1.jpg"];
            
        } completion:nil];
        _loading.text = @"龙猫历险记";
    });
    //慢镜头放大
    [UIView animateWithDuration:4 animations:^{
        self.imageView.transform = CGAffineTransformMakeScale(1.1, 1.1);
        
    }];

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //未生效
    NSTimer* time = [[NSTimer alloc]init];
    time = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(countdown:) userInfo:nil repeats:NO];
    NSLog(@"点击1");
    
    LoginView* login = [[LoginView alloc]init];
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:login];
    UIWindow* window = [[UIApplication sharedApplication]keyWindow];
    login.title = @"~OvO~";
    window.rootViewController = nav;
    
   
    
}
-(void)countdown:(NSTimer*)time{
    NSLog(@"定时器启动");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidAppear:(BOOL)animated{
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
