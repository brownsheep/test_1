//
//  FirstView.h
//  test_1
//
//  Created by 吴疆 on 2018/5/23.
//  Copyright © 2018年 吴疆. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstView : UIViewController
<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,copy)NSString* username;
@property(nonatomic,copy)NSString* userpassword;
@property(nonatomic,copy)NSString* userMemo;


@end
