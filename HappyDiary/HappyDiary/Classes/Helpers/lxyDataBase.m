//
//  lxyDataBase.m
//  DataBase
//
//  Created by 刘翔宇 on 14-6-17.
//  Copyright (c) 2014年 lanou3g. All rights reserved.
//

#import "lxyDataBase.h"
#import <sqlite3.h>

#import "lxySandTimerModel.h"
#import "lxyCommonDiaryModel.h"
#import "lxyAlonePersonModel.h"
#import "lxyBackGroundImageModel.h"

static sqlite3 *db;
lxyDataBase *_dataBase = nil;

@implementation lxyDataBase

//获得类对象
+ (lxyDataBase *)shareLxyDataBase
{
    if (nil == _dataBase) {
        _dataBase = [[lxyDataBase alloc] init];
    }
    return _dataBase;
}




//打开数据库
- (void)openDataBase
{
    //获取document路径
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    
    //获取该document文件下数据库的路径
    self.dataPath = [documentPath stringByAppendingString:@"data.sqlite"];
    
    //打开数据库（判断数据库的状态）
    int result = sqlite3_open(_dataPath.UTF8String, &db);
    
    if (result == SQLITE_OK) {
        NSLog(@"数据库代开成功");
    } else {
        NSLog(@"数据库代开失败");
    }
}
//关闭数据库
- (void)closeDataBase
{
    int result = sqlite3_close(db);
    
    if (result == SQLITE_OK) {
        NSLog(@"关闭数据库成功");
    } else {
        NSLog(@"关闭数据库失败");
    }
}







#pragma mark - 沙漏表的创建和操作(sandTimerTable)
//字段（ID：ID  风格：style   背景音乐:backGroundMusic     人名：peopleName）

//创建一个沙漏表（sandTimerTable）
- (void)createSandTimerTable
{
    [self openDataBase];
    
    //创建的sql语句
    NSString *sql = @"create table sandTimerTable (ID integer primary key not null,style text, backGroundMusic text, peopleName text, time text)";
    
    int result = sqlite3_exec(db, sql.UTF8String, NULL, NULL, NULL);
    
    if (result == SQLITE_OK) {
        NSLog(@"数据表sandTimerTable创建成功");
    } else {
        NSLog(@"数据表sandTimerTable创建失败");
    }
    
    [self closeDataBase];
}

//在沙漏表（sandTimerTable）中添加一个沙漏（sandTimerModel）
- (void)insertToSandTimerTableWithOneSandTimerModel:(lxySandTimerModel *)sandTimerModel
{
    [self openDataBase];
    
    NSInteger ID = [sandTimerModel.ID integerValue];
    NSString *style = sandTimerModel.style;
    NSString *backGroundMusic = sandTimerModel.backGroundMusic;
    NSString *peopleName = sandTimerModel.peopleName;
    NSString *time = sandTimerModel.time;
    
    NSString *sql = [NSString stringWithFormat:@"insert into sandTimerTable(ID,style, backGroundMusic, peopleName, time)values('%d' , '%@', '%@', '%@', '%@')", ID , style , backGroundMusic , peopleName , time];
    
    int result = sqlite3_exec(db, sql.UTF8String, NULL, NULL, NULL);
    
    if (result == SQLITE_OK) {
        NSLog(@"插入sandTimerModel成功");
    } else {
        NSLog(@"插入sandTimerModel失败");
    }
    
    [self closeDataBase];
}

//在沙漏表（sandTimerTable）中删除一个沙漏（sandTimerModel）
- (void)deleteOneSandTimerModel:(lxySandTimerModel *)sandTimerModel
{
    [self openDataBase];
    
    NSInteger ID = [sandTimerModel.ID integerValue];
    
    NSString *sql = [NSString stringWithFormat:@"delete from sandTimerTable where ID = '%d'", ID];
    
    int result = sqlite3_exec(db, sql.UTF8String, NULL, NULL, NULL);
    
    if (result == SQLITE_OK) {
        NSLog(@"删除sandTimerModel成功");
    } else {
        NSLog(@"删除sandTimerTable失败");
    }
    
    [self closeDataBase];
}

//在沙漏表（sandTimerTable）中修改一个沙漏（sandTimerModel）
- (void)alertOneSandTimerModelByStyle:(lxySandTimerModel *)sandTimerModel
{
    [self openDataBase];
    
    NSString *style = sandTimerModel.style;
    NSInteger ID = [sandTimerModel.ID integerValue];
    
    NSString *sql = [NSString stringWithFormat:@"update sandTimerTable set style = '%@' where ID = '%d'", style , ID];
    
    int result = sqlite3_exec(db, sql.UTF8String, NULL, NULL, NULL);
    
    if (result == SQLITE_OK) {
        NSLog(@"修改sandTimerModel的style成功");
    } else {
        NSLog(@"修改sandTimerModel的style失败");
    }
    
    [self closeDataBase];
}

//在沙漏表（sandTimerTable）中查询一个沙漏（sandTimerModel）
- (lxySandTimerModel *)searchOneSandTimerModel:(NSInteger)sandTimerModelID
{
    [self openDataBase];
    
    //创建一个lxySandTimerModel对象
    lxySandTimerModel *sandTimerModel = [[lxySandTimerModel alloc] init];
    
    //准备存储值的对象
    sqlite3_stmt *stmt = nil;
    
    //准备sql语句
    NSString *sql = [NSString stringWithFormat:@"select ID, style, backGroundMusic, peopleName from sandTimerTable where ID = ?"];
    
    //判断sql语句是否正确
    int result = sqlite3_prepare_v2(db, sql.UTF8String, -1, &stmt, NULL);
    
    if (result == SQLITE_OK) {
        
        //绑定要查找的ID
        sqlite3_bind_int(stmt, 1, sandTimerModelID);
        
        //单步执行，查询表
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            
            //取ID
            NSInteger ID = sqlite3_column_int(stmt, 0);
            
            //取style
            NSString *style = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 1)];
            
            //取backGroundMusic
            NSString *backGroundMusic = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 2)];
            
            //取peopleName
            NSString *peopleName = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 3)];
            
            //取time
            NSString *time = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 4)];
            
            sandTimerModel.ID = [NSString stringWithFormat:@"%d", ID];
            sandTimerModel.style = style;
            sandTimerModel.backGroundMusic = backGroundMusic;
            sandTimerModel.peopleName = peopleName;
            sandTimerModel.time = time;
            
            //清空存值对象
            sqlite3_finalize(stmt);
        }
    }
    
    //清空存值对象
    sqlite3_finalize(stmt);
    
    
    [self closeDataBase];
    
    return sandTimerModel;
}

//查询表（sandTimerTable）中的所有数据
- (NSMutableArray *)searchAllDataFromSandTimerTable
{
    [self openDataBase];
    
    //准备返回的可变数组
    NSMutableArray *array = [ NSMutableArray array];
    
    //准备sql语句
    NSString *sql = @"select * from sandTimerTable";
    
    //准备存储值对象
    sqlite3_stmt *stmt = nil;
    
    sqlite3_prepare(db, sql.UTF8String, -1, &stmt, NULL);
    
    //判断是否可以往下读取
    while (sqlite3_step(stmt) == SQLITE_ROW) {
        
        //准备sandTimerModel对象
        lxySandTimerModel *sandTimerModel = [[lxySandTimerModel alloc] init];
        
        //获取ID
        NSInteger ID = sqlite3_column_int(stmt, 0);
        
        //获取style
        NSString *style = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 1)];
        
        //取backGroundMusic
        NSString *backGroundMusic = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 2)];
        
        //取peopleName
        NSString *peopleName = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 3)];
        
        //取time
        NSString *time = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 4)];
        
        sandTimerModel.ID = [NSString stringWithFormat:@"%d", ID];
        sandTimerModel.style = style;
        sandTimerModel.backGroundMusic = backGroundMusic;
        sandTimerModel.peopleName = peopleName;
        sandTimerModel.time = time;
        
        [array addObject:sandTimerModel];
    }
    
    //清空存储值对象
    sqlite3_finalize(stmt);
    
    [self closeDataBase];
    
    return array;
}









#pragma mark - 密码表的创建和操作（passWordTable）
//字段（字段ID：ID    密码：passWord）

//创建密码表（passWordTable）
- (void)createPassWordTable
{
    [self openDataBase];
    
    //创建的sql语句
    NSString *sql = @"create table passWordTable (ID integer primary key not null,passWord text)";
    
    int result = sqlite3_exec(db, sql.UTF8String, NULL, NULL, NULL);
    
    if (result == SQLITE_OK) {
        NSLog(@"数据表passWordTable创建成功");
    } else {
        NSLog(@"数据表passWordTable创建失败");
    }
    
    [self closeDataBase];
}

//在密码表中插入一个密码（passWord）
- (void)insertToPassWordTableWithOnePassWord:(NSString *)passWord
{
    [self openDataBase];
    
    NSInteger i = 1;
    
    NSString *sql = [NSString stringWithFormat:@"insert into passWordTable(ID, passWord)values('%d' , '%@')", i , passWord];
    
    int result = sqlite3_exec(db, sql.UTF8String, NULL, NULL, NULL);
    
    if (result == SQLITE_OK) {
        NSLog(@"插入密码成功");
    } else {
        NSLog(@"插入密码失败");
    }
    
    [self closeDataBase];
}

//删除表中的密码（passWord）
- (void)deleteAllDataFromPassWordTable
{
    [self openDataBase];
    
    NSString *sql = [NSString stringWithFormat:@"delete from sandTimerTable where ID = 1"];
    
    int result = sqlite3_exec(db, sql.UTF8String, NULL, NULL, NULL);
    
    if (result == SQLITE_OK) {
        NSLog(@"删除passWord成功");
    } else {
        NSLog(@"删除passWord失败");
    }
    
    [self closeDataBase];
}

//修改密码
- (void)alertPassWordWithNewPassWord:(NSString *)passWord
{
    
    [self openDataBase];
    
    NSInteger i = 1;
    
    NSString *sql = [NSString stringWithFormat:@"update passWordTable set passWord = '%@' where ID = '%d'", passWord, i];
    
    int result = sqlite3_exec(db, sql.UTF8String, NULL, NULL, NULL);
    
    if (result == SQLITE_OK) {
        NSLog(@"修改密码成功");
    } else {
        NSLog(@"修改密码失败");
    }
    
    
    [self closeDataBase];
    
}







#pragma mark - 背景图片表的创建和操作(backGroundImageTable)
//字段（ID:ID    图片路径：imagePath）

//创建一个背景图片表（backGroundImageTable）
- (void)createBackGroundImageTable
{
    [self openDataBase];
    
    //创建的sql语句
    NSString *sql = @"create table backGroundImageTable (ID integer primary key autoincrement,imagePath text not null)";
    
    int result = sqlite3_exec(db, sql.UTF8String, NULL, NULL, NULL);
    
    if (result == SQLITE_OK) {
        NSLog(@"数据表backGroundImageTable创建成功");
    } else {
        NSLog(@"数据表backGroundImageTable创建失败");
    }
    
    [self closeDataBase];
}

//在背景图片表（backGroundImageTable）中插入一张图片
- (void)insertToBackGroundImageTableWithOneImage:(lxyBackGroundImageModel *)backGroundImageModel
{
    [self openDataBase];
    
    NSInteger ID = [backGroundImageModel.ID integerValue];
    NSString *imagePath = backGroundImageModel.imagePath;
    
    NSString *sql = [NSString stringWithFormat:@"insert into backGroundImageTable (imagePath, ID)values('%@', '%d')", imagePath , ID];
    
    int result = sqlite3_exec(db, sql.UTF8String, NULL, NULL, NULL);
    
    if (result == SQLITE_OK) {
        NSLog(@"插入imagePath成功");
    } else {
        NSLog(@"插入imagePath失败");
    }
    
    [self closeDataBase];
}

//在背景图片表（backGroundImageTable）中删除一张图片
- (void)deleteOneImageWithImageName:(lxyBackGroundImageModel *)backGroundImageModel
{
    [self openDataBase];
    
    NSInteger ID = [backGroundImageModel.ID integerValue];
    
    NSString *sql = [NSString stringWithFormat:@"delete from backGroundImageModel where ID = '%d'", ID];
    
    int result = sqlite3_exec(db, sql.UTF8String, NULL, NULL, NULL);
    
    if (result == SQLITE_OK) {
        NSLog(@"删除backGroundImageModel成功");
    } else {
        NSLog(@"删除backGroundImageModel失败");
    }
    
    [self closeDataBase];
}

//查询表（backGroundImageTable）中的所有数据
- (NSMutableArray *)searchAllDataFrombackGroundImageTable
{
    [self openDataBase];
    
    //准备返回的可变数组
    NSMutableArray *array = [ NSMutableArray array];
    
    //准备sql语句
    NSString *sql = @"select * from backGroundImageTable";
    
    //准备存储值对象
    sqlite3_stmt *stmt = nil;
    
    sqlite3_prepare(db, sql.UTF8String, -1, &stmt, NULL);
    
    //判断是否可以往下读取
    while (sqlite3_step(stmt) == SQLITE_ROW) {
        
        //准备backGroundImageModel对象
        lxyBackGroundImageModel *backGroundImageModel = [[lxyBackGroundImageModel alloc] init];
        
        //获取ID
        NSInteger ID = sqlite3_column_int(stmt, 0);
        
        //获取style
        NSString *imagePath = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 1)];
        
        backGroundImageModel.ID = [NSString stringWithFormat:@"%d", ID];
        backGroundImageModel.imagePath = imagePath;
        
        [array addObject:backGroundImageModel];
    }
    
    //清空存储值对象
    sqlite3_finalize(stmt);
    
    [self closeDataBase];
    
    return array;

}

- (lxyBackGroundImageModel *)searchOneDataFromBackGroundImageTableByID:(NSInteger)ID
{
    [self openDataBase];
    
    //创建一个lxyBackGroundImageModel对象
    lxyBackGroundImageModel *backGroundImageModel = [[lxyBackGroundImageModel alloc] init];
    
    //准备存储值的对象
    sqlite3_stmt *stmt = nil;
    
    //准备sql语句
    NSString *sql = [NSString stringWithFormat:@"select ID, imagePath from backGroundImageTable where ID = ?"];
    
    //判断sql语句是否正确
    int result = sqlite3_prepare_v2(db, sql.UTF8String, -1, &stmt, NULL);
    
    if (result == SQLITE_OK) {
        
        //绑定要查找的ID
        sqlite3_bind_int(stmt, 1, ID);
        
        //单步执行，查询表
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            
            //取ID
            NSInteger ID = sqlite3_column_int(stmt, 0);
            
            //取imagePath
            NSString *imagePath = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 1)];
            
            backGroundImageModel.ID = [NSString stringWithFormat:@"%d", ID];
            backGroundImageModel.imagePath = imagePath;
            
            //清空存值对象
            sqlite3_finalize(stmt);
        }
    }
    
    //清空存值对象
    sqlite3_finalize(stmt);
    
    
    [self closeDataBase];
    
    return backGroundImageModel;

}








#pragma mark - 创建一个个人记录表（alonePersonTable）
//字段（ID:ID  人名：name    记录的时间：time  记录的内容：content   背景图片：backGroundImage  记录时的天气：weather）

//创建一个个人记录表（alonePersonTable）
- (void)createAlonePersonTable
{
    [self openDataBase];
    
    //创建的sql语句
    NSString *sql = @"create table alonePersonTable (ID integer primary key autoincrement not null,name text not null,time text not null,content text,backGroundImage text,weather text)";
    
    int result = sqlite3_exec(db, sql.UTF8String, NULL, NULL, NULL);
    
    if (result == SQLITE_OK) {
        NSLog(@"数据表alonePersonTable创建成功");
    } else {
        NSLog(@"数据表alonePersonTable创建失败");
    }
    
    [self closeDataBase];
}

//在该个人记录表（alonePersonTable）中插入一条数据
- (void)insertToAlonePersonTableWithOneAlonePersonModel:(lxyAlonePersonModel *)alonePersonModel
{
    [self openDataBase];
    
    NSString *name = alonePersonModel.name;
    NSInteger ID = [alonePersonModel.ID integerValue];
    NSString *time = alonePersonModel.time;
    NSString *content = alonePersonModel.content;
    NSString *backGroundImage = alonePersonModel.backGroundImage;
    NSString *weather = alonePersonModel.weather;
    
    NSString *sql = [NSString stringWithFormat:@"insert into alonePersonTable (ID, name, time, content, backGroundImage, weather)values('%d', '%@', '%@', '%@', '%@', '%@')", ID , name , time , content , backGroundImage , weather];
    
    int result = sqlite3_exec(db, sql.UTF8String, NULL, NULL, NULL);
    
    if (result == SQLITE_OK) {
        NSLog(@"插入alonePersonModel成功");
    } else {
        NSLog(@"插入alonePersonModel失败");
    }
    
    [self closeDataBase];
}

//在该个人记录表（alonePersonTable）中删除一条数据
- (void)deleteOneAlonePersonModel:(lxyAlonePersonModel *)alonePersonModel
{
    [self openDataBase];
    
    NSInteger ID = [alonePersonModel.ID integerValue];
    
    NSString *sql = [NSString stringWithFormat:@"delete from alonePersonTable where ID = '%d'", ID];
    
    int result = sqlite3_exec(db, sql.UTF8String, NULL, NULL, NULL);
    
    if (result == SQLITE_OK) {
        NSLog(@"删除alonePersonModel成功");
    } else {
        NSLog(@"删除alonePersonModel失败");
    }
    
    [self closeDataBase];
}

//在该个人记录表（alonePersonTable）中查询一条数据
- (lxyAlonePersonModel *)searchOneAlonePersonModelByAlonePersonModelName:(NSString *)name
{
    [self openDataBase];
    
    //创建一个lxySandTimerModel对象
    lxyAlonePersonModel *alonePersonModel = [[lxyAlonePersonModel alloc] init];
    
    //准备存储值的对象
    sqlite3_stmt *stmt = nil;
    
    //准备sql语句
    NSString *sql = [NSString stringWithFormat:@"select ID, name, time, content, backGroundImage, weather from %@ where name = ?", name];
    
    //判断sql语句是否正确
    int result = sqlite3_prepare_v2(db, sql.UTF8String, -1, &stmt, NULL);
    
    if (result == SQLITE_OK) {
        
        //绑定要查找的ID
        sqlite3_bind_text(stmt, 1, name.UTF8String, strlen(name.UTF8String), SQLITE_STATIC);
        
        //单步执行，查询表
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            
            //取ID
            NSInteger ID = sqlite3_column_int(stmt, 0);
            
            //取name
            NSString *name = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 1)];
            
            //取time
            NSString *time = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 2)];
            
            //取content
            NSString *content = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 3)];
            
            //取backGroundImage
            NSString *backGroundImage = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 4)];
            
            //取weather
            NSString *weather = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 5)];
            
            alonePersonModel.ID = [NSString stringWithFormat:@"%d", ID];
            alonePersonModel.name = name;
            alonePersonModel.time = time;
            alonePersonModel.content = content;
            alonePersonModel.backGroundImage = backGroundImage;
            alonePersonModel.weather = weather;
            
            //清空存值对象
            sqlite3_finalize(stmt);
        }
    }
    
    //清空存值对象
    sqlite3_finalize(stmt);
    
    
    [self closeDataBase];
    
    return alonePersonModel;

}

//查询表（alonePersonTable）中的所有数据
- (NSMutableArray *)searchAllDataFromalonePersonTable
{
    [self openDataBase];
    
    //准备返回的可变数组
    NSMutableArray *array = [ NSMutableArray array];
    
    //准备sql语句
    NSString *sql = [NSString stringWithFormat:@"select * from alonePersonTable"];
    
    //准备存储值对象
    sqlite3_stmt *stmt = nil;
    
    sqlite3_prepare(db, sql.UTF8String, -1, &stmt, NULL);
    
    //判断是否可以往下读取
    while (sqlite3_step(stmt) == SQLITE_ROW) {
        
        //准备backGroundImageModel对象
        lxyAlonePersonModel *alonePersonModel = [[lxyAlonePersonModel alloc] init];
        
        //获取ID
        NSInteger ID = sqlite3_column_int(stmt, 0);
        
        //获取name
        NSString *name = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 1)];
        
        //获取time
        NSString *time = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 2)];
        
        //获取content
        NSString *content = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 3)];
        
        //获取backGroundImage
        NSString *backGroundImage = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 4)];
        
        //获取weather
        NSString *weather = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 5)];
        
        alonePersonModel.ID = [NSString stringWithFormat:@"%d", ID];
        alonePersonModel.name = name;
        alonePersonModel.time = time;
        alonePersonModel.content = content;
        alonePersonModel.backGroundImage = backGroundImage;
        alonePersonModel.weather = weather;
        
        [array addObject:alonePersonModel];
    }
    
    //清空存储值对象
    sqlite3_finalize(stmt);
    
    [self closeDataBase];
    
    return array;
}









#pragma mark - 创建一个存放普通日记的表（commonDiaryTable）
//字段（ID:ID  日记内容：content   日记时间：time    天气：weather  背景图片：backGroundImage    心情：mood）

//创建一个普通日记表（commonDiaryTable）
- (void)createCommonDiaryTable
{
    [self openDataBase];
    
    //创建的sql语句
    NSString *sql = @"create table commonDiaryTable (ID integer primary key autoincrement not null,content text not null,time text not null, weather text, backGroundImage text, mood text)";
    
    int result = sqlite3_exec(db, sql.UTF8String, NULL, NULL, NULL);
    
    if (result == SQLITE_OK) {
        NSLog(@"数据表commonDiaryTable创建成功");
    } else {
        NSLog(@"数据表commonDiaryTable创建失败");
    }
    
    [self closeDataBase];
}

//在该普通日记表（commonDiaryTable）中插入一条数据
- (void)insertToCommonDiaryTableWithOneCommonDiaryModel:(lxyCommonDiaryModel *)commonDiaryModel
{
    [self openDataBase];
    
    NSInteger ID = [commonDiaryModel.ID integerValue];
    NSString *content = commonDiaryModel.content;
    NSString *time = commonDiaryModel.time;
    NSString *weather = commonDiaryModel.weather;
    NSString *backGroundImage = commonDiaryModel.backGroundImage;
    NSString *mood = commonDiaryModel.mood;
    
    NSString *sql = [NSString stringWithFormat:@"insert into commonDiaryTable (ID, content, time, weather, backGroundImage, mood)values('%d', '%@', '%@', '%@', '%@', '%@')", ID , time , content , weather , backGroundImage , mood];
    
    int result = sqlite3_exec(db, sql.UTF8String, NULL, NULL, NULL);
    
    if (result == SQLITE_OK) {
        NSLog(@"插入commonDiaryModel成功");
    } else {
        NSLog(@"插入commonDiaryModel失败");
    }
    
    [self closeDataBase];
}

//在该普通日记表（commonDiaryTable）中删除一条数据
- (void)deleteOneCommonDiaryModel:(lxyCommonDiaryModel *)commonDiaryModel
{
    [self openDataBase];
    
    NSInteger ID = [commonDiaryModel.ID integerValue];
    
    NSString *sql = [NSString stringWithFormat:@"delete from commonDiaryTable where ID = '%d'", ID];
    
    int result = sqlite3_exec(db, sql.UTF8String, NULL, NULL, NULL);
    
    if (result == SQLITE_OK) {
        NSLog(@"删除commonDiaryModel成功");
    } else {
        NSLog(@"删除commonDiaryModel失败");
    }
    
    [self closeDataBase];
}

//在该普通日记表（commonDiaryTable）中查询一条数据
- (lxyCommonDiaryModel *)searchOneCommonDiaryModelByTime:(NSString *)time
{
    [self openDataBase];
    
    //创建一个lxySandTimerModel对象
    lxyCommonDiaryModel *commonDiaryModel = [[lxyCommonDiaryModel alloc] init];
    
    //准备存储值的对象
    sqlite3_stmt *stmt = nil;
    
    //准备sql语句
    NSString *sql = [NSString stringWithFormat:@"select ID, content, time, weather, backGroundImage, mood from commonDiaryTable where time = ?"];
    
    //判断sql语句是否正确
    int result = sqlite3_prepare_v2(db, sql.UTF8String, -1, &stmt, NULL);
    
    if (result == SQLITE_OK) {
        
        //绑定要查找的ID
        sqlite3_bind_text(stmt, 1, time.UTF8String, strlen(time.UTF8String), SQLITE_STATIC);
        
        //单步执行，查询表
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            
            //取ID
            NSInteger ID = sqlite3_column_int(stmt, 0);
            
            //取content
            NSString *content = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 1)];
            
            //取time
            NSString *time = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 2)];
            
            //取weather
            NSString *weather = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 3)];
            
            //取backGroundImage
            NSString *backGroundImage = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 4)];
            
            //取mood
            NSString *mood = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 5)];
            
            commonDiaryModel.ID = [NSString stringWithFormat:@"%d", ID];
            commonDiaryModel.time = time;
            commonDiaryModel.content = content;
            commonDiaryModel.weather = weather;
            commonDiaryModel.backGroundImage = backGroundImage;
            commonDiaryModel.mood = mood;
            
            //清空存值对象
            sqlite3_finalize(stmt);
        }
    }
    
    //清空存值对象
    sqlite3_finalize(stmt);
    
    
    [self closeDataBase];
    
    return commonDiaryModel;
}

//查询表（commonDiaryTable）中的所有数据
- (NSMutableArray *)searchAllDataFromcommonDiaryTable
{
    [self openDataBase];
    
    //准备返回的可变数组
    NSMutableArray *array = [ NSMutableArray array];
    
    //准备sql语句
    NSString *sql = @"select * from commonDiaryTable";
    
    //准备存储值对象
    sqlite3_stmt *stmt = nil;
    
    sqlite3_prepare(db, sql.UTF8String, -1, &stmt, NULL);
    
    //判断是否可以往下读取
    while (sqlite3_step(stmt) == SQLITE_ROW) {
        
        //准备backGroundImageModel对象
        lxyCommonDiaryModel *commonDiaryModel = [[lxyCommonDiaryModel alloc] init];
        
        //获取ID
        NSInteger ID = sqlite3_column_int(stmt, 0);
        
        //获取time
        NSString *time = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 2)];
        
        //获取content
        NSString *content = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 1)];
        
        //获取weather
        NSString *weather = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 3)];
        
        //获取backGroundImage
        NSString *backGroundImage = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 4)];
        
        //获取mood
        NSString *mood = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 5)];
        
        
        commonDiaryModel.ID = [NSString stringWithFormat:@"%d", ID];
        commonDiaryModel.time = time;
        commonDiaryModel.content = content;
        commonDiaryModel.weather = weather;
        commonDiaryModel.backGroundImage = backGroundImage;
        commonDiaryModel.mood = mood;
        
        [array addObject:commonDiaryModel];
    }
    
    //清空存储值对象
    sqlite3_finalize(stmt);
    
    [self closeDataBase];
    
    return array;
}




#pragma mark - 个人表
- (void)createTableWithPeopleNameForTableName:(NSString *)tableName
{
    [self openDataBase];
    
    //创建的sql语句
    NSString *sql = [NSString stringWithFormat:@"create table %@ (ID integer primary key autoincrement not null,name text not null,time text not null,content text,backGroundImage text,weather text)", tableName];
    
    int result = sqlite3_exec(db, sql.UTF8String, NULL, NULL, NULL);
    
    if (result == SQLITE_OK) {
        NSLog(@"数据表alonePersonTable创建成功");
    } else {
        NSLog(@"数据表alonePersonTable创建失败");
    }
    
    [self closeDataBase];
}

//在该个个人表中插入一条数据
- (void)insertToAlonePersonTableWithOneAlonePersonModel:(lxyAlonePersonModel *)alonePersonModel
                                                 byName:(NSString *)tableName
{
    [self openDataBase];
    
    NSString *name = tableName;
    NSInteger ID = [alonePersonModel.ID integerValue];
    NSString *time = alonePersonModel.time;
    NSString *content = alonePersonModel.content;
    NSString *backGroundImage = alonePersonModel.backGroundImage;
    NSString *weather = alonePersonModel.weather;
    
    NSString *sql = [NSString stringWithFormat:@"insert into %@ (ID, name, time, content, backGroundImage, weather)values('%d', '%@', '%@', '%@', '%@', '%@')", tableName , ID , name , time , content , backGroundImage , weather];
    
    int result = sqlite3_exec(db, sql.UTF8String, NULL, NULL, NULL);
    
    if (result == SQLITE_OK) {
        NSLog(@"插入成功");
    } else {
        NSLog(@"插入失败");
    }
    
    [self closeDataBase];

}

//在该个人记录表中删除一条数据
- (void)deleteOneAlonePersonModel:(lxyAlonePersonModel *)alonePersonModel
                           byName:(NSString *)tableName
{
    [self openDataBase];
    
    NSInteger ID = [alonePersonModel.ID integerValue];
    
    NSString *sql = [NSString stringWithFormat:@"delete from %@ where ID = '%d'", tableName , ID];
    
    int result = sqlite3_exec(db, sql.UTF8String, NULL, NULL, NULL);
    
    if (result == SQLITE_OK) {
        NSLog(@"删除成功");
    } else {
        NSLog(@"删除失败");
    }
    
    [self closeDataBase];
}

//查询表中的所有数据
- (NSMutableArray *)searchAllDataFromalonePersonTableByPersonName:(NSString *)name
{
    [self openDataBase];
    
    //准备返回的可变数组
    NSMutableArray *array = [ NSMutableArray array];
    
    //准备sql语句
    NSString *sql = [NSString stringWithFormat:@"select * from %@", name];
    
    //准备存储值对象
    sqlite3_stmt *stmt = nil;
    
    sqlite3_prepare(db, sql.UTF8String, -1, &stmt, NULL);
    
    //判断是否可以往下读取
    while (sqlite3_step(stmt) == SQLITE_ROW) {
        
        //准备backGroundImageModel对象
        lxyAlonePersonModel *alonePersonModel = [[lxyAlonePersonModel alloc] init];
        
        //获取ID
        NSInteger ID = sqlite3_column_int(stmt, 0);
        
        //获取name
        NSString *name = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 1)];
        
        //获取time
        NSString *time = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 2)];
        
        //获取content
        NSString *content = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 3)];
        
        //获取backGroundImage
        NSString *backGroundImage = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 4)];
        
        //获取weather
        NSString *weather = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 5)];
        
        alonePersonModel.ID = [NSString stringWithFormat:@"%d", ID];
        alonePersonModel.name = name;
        alonePersonModel.time = time;
        alonePersonModel.content = content;
        alonePersonModel.backGroundImage = backGroundImage;
        alonePersonModel.weather = weather;
        
        [array addObject:alonePersonModel];
    }
    
    //清空存储值对象
    sqlite3_finalize(stmt);
    
    [self closeDataBase];
    
    return array;
}






@end
