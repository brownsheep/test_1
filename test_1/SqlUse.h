//
//  SqlUse.h
//  test_1
//
//  Created by 吴疆 on 2018/5/21.
//  Copyright © 2018年 吴疆. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SqlUse : NSObject
@property(nonatomic,copy)NSString* userName;
@property(nonatomic,copy)NSString* userPassword;
@property(nonatomic,copy)NSString* userMemo;

-(BOOL)LoginUser;
-(BOOL)RegisterUser;

-(BOOL)test;

@end
