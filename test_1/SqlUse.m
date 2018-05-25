//
//  SqlUse.m
//  test_1
//
//  Created by 吴疆 on 2018/5/21.
//  Copyright © 2018年 吴疆. All rights reserved.
//

#import "SqlUse.h"
#import "FMDB.h"
@implementation SqlUse
{
    FMDatabase* _db;
}
-(instancetype)init{
    if (self = [super init]) {
        NSString* sp = [NSHomeDirectory() stringByAppendingString:@"/Documents/user.db"];
        _db = [FMDatabase databaseWithPath:sp];
        NSString* sqlIn = @"create table if not exists user (id integer primary key , username varchar(20) , userpassword varchar(20) ,memo text );";
        [_db open];
        BOOL isIn = [_db executeUpdate:sqlIn];
//        NSString* test = @"insert into user values (2,'test2','123456')";
//        if ([_db executeUpdate:test]) {
//            NSLog(@"插入成功");
//        }
        if (isIn) {
            NSLog(@"数据库创建成功");
            [_db close];
        }
    }
    return self;
}
-(BOOL)LoginUser {
    NSString* username = _userName;
    NSString* userpassword = _userPassword;
    NSString* sql = [NSString stringWithFormat: @"select * from user where username = '%@'",username];
    //NSString* sql = @"select * from user";
    NSLog(@"%@",sql);
    
    
    if ([_db open]) {
        FMResultSet* result = [_db executeQuery:sql];
        NSLog(@"%d",result.columnCount);
        while ([result next]) {
            userpassword =[result stringForColumn:@"userpassword"];
            
            NSLog(@"%@",userpassword);
            if (_userPassword == userpassword) {
                _userMemo = [result stringForColumn:@"memo"];
                [_db close];
                return YES;
            }
        }
    }
    [_db close];
    return NO;
}
-(BOOL)RegisterUser {
    NSString* username = _userName;
    NSString* userpassword = _userPassword;
    NSString* queryname = [NSString stringWithFormat:@"select * from user where username = '%@' ;",username];
    if ([_db executeQuery:queryname]) {
        return NO;
    }
    
    NSString* sql = [NSString stringWithFormat: @"insert into user values (null,'%@','%@',null)",username,userpassword ];
    [_db open];
    if ([_db executeUpdate:sql]) {
       
        NSString* sql1 =[NSString stringWithFormat: @"select * from user where username = '%@' and userpassword = '%@';",_userName,_userPassword];
        FMResultSet* ruslt1 = [_db executeQuery:sql1];
        if (ruslt1) {
            while ([ruslt1 next]) {
                NSString* memo = [NSString stringWithFormat:@"%d%@%@",[ruslt1 intForColumn:@"id"],_userName,_userPassword];
                NSString* sql2 = [NSString stringWithFormat: @"update user set memo = '%@' where id = %d",memo,[ruslt1 intForColumn:@"id"]];
                if ([_db executeUpdate:sql2]) {
                    NSLog(@"存储memo成功");
                    
                }
            }
        }
        NSLog(@"插入成功");
        [_db close];
        return YES;
        
    }else{
        [_db close];
        return  NO;
    }
    
}




-(BOOL)test{
    [_db open];
    
    if (YES) {
//        NSString* insql = [NSString stringWithFormat:@"insert into user values (null,'3','3','我爱北京天安门天安门上红旗飘');"];
//        if ([_db executeUpdate:insql]) {
//            NSLog(@"插入成功！！！");
//        }
//        NSString* outsql = @"select * from user ;";
        FMResultSet* ruslt =   [_db executeQuery:@"SELECT * FROM user;"];
        NSLog(@"%@",ruslt);
        while ([ruslt next]) {
            NSLog(@"%@",[ruslt stringForColumn:@"memo"]);
            NSLog(@"%d",[ruslt intForColumn:@"id"]);
            NSLog(@"%@ + %@",[ruslt stringForColumn:@"username"],[ruslt stringForColumn:@"userpassword"]);
            
        }
        return YES;
    }
    
    
    
    return NO;
}

@end
