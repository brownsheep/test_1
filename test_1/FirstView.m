//
//  FirstView.m
//  test_1
//
//  Created by 吴疆 on 2018/5/23.
//  Copyright © 2018年 吴疆. All rights reserved.
//

#import "FirstView.h"
#import "SqlMemo.h"
@interface FirstView ()

@end

@implementation FirstView
{
    UITableView* tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //数据库传值
    NSLog(@"2:%@,%@",_username,_userpassword);
    SqlMemo* memo = [[SqlMemo alloc]init];
    memo.userMemo = _userMemo;
    
    //[memo test]; 新建测试表单
    
    tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    
    
    // Do any additional setup after loading the view from its nib.
}
//获取每组元素个数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

//获取组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return  3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString* cellid =@"cell";
    UITableViewCell* cell = [ tableView dequeueReusableCellWithIdentifier:cellid];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    NSString* str = [NSString stringWithFormat:@"第%ld行,第%ld列",indexPath.section,indexPath.row];
    cell.textLabel.text = str;
    return cell;
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
