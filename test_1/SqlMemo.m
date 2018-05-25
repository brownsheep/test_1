//
//  SqlMemo.m
//  test_1
//
//  Created by 吴疆 on 2018/5/24.
//  Copyright © 2018年 吴疆. All rights reserved.
//

#import "SqlMemo.h"
#import "FMDatabase.h"
@implementation SqlMemo
{
    FMDatabase* _db;
}
-(instancetype)init{
    if (self = [super init]) {
        NSString* sp = [NSHomeDirectory() stringByAppendingString:@"/Documents/user.db"];
        _db = [FMDatabase databaseWithPath:sp];
        if ([_db open]) {
            [_db close];
        }
        
    }
    return self;
}
-(void)test{
    NSString* sp = [NSHomeDirectory() stringByAppendingString:@"/Documents/user.db"];
    _db = [FMDatabase databaseWithPath:sp];
    NSString* sqlIn = @"create table if not exists usermemo (id integer primary key , uuid varchar(20) , memo text );";
    [_db open];
    BOOL isIn = [_db executeUpdate:sqlIn];
    NSString* test1 = [NSString stringWithFormat: @"insert into usermemo values (1,'%@','我在马路边捡到一分钱');",_userMemo];
    if ([_db executeUpdate:test1]) {
        NSLog(@"插入成功1");
    }
    NSString* test2 = [NSString stringWithFormat: @"insert into usermemo values (null,'%@','把它交给警察叔叔手里边');",_userMemo];
    if ([_db executeUpdate:test2]) {
        NSLog(@"插入成功2");
    }
    NSString* test3 = [NSString stringWithFormat: @"insert into usermemo values (null,'%@','警察叔叔问我还有没有得钱');",_userMemo];
    if ([_db executeUpdate:test3]) {
        NSLog(@"插入成功3");
    }
    NSString* sql =[NSString stringWithFormat: @"select * from usermemo where uuid = '%@';",_userMemo];
    FMResultSet* result = [_db executeQuery:sql];
    if (result) {
        while ([result next]) {
            NSLog(@"id = %d",[result intForColumn:@"id"]);
            NSLog(@"uuid = %@",[result stringForColumn:@"uuid"]);
            NSLog(@"memo = %@",[result stringForColumn:@"memo"]);
        }
    }
    if (isIn) {
        NSLog(@"数据表创建成功");
        [_db close];
    }
}
@end
