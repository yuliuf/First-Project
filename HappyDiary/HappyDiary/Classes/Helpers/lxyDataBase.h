//
//  lxyDataBase.h
//  DataBase
//
//  Created by 刘翔宇 on 14-6-17.
//  Copyright (c) 2014年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@class lxySandTimerModel;
@class lxyAlonePersonModel;
@class lxyCommonDiaryModel;
@class lxyBackGroundImageModel;

@interface lxyDataBase : NSObject


@property (nonatomic , copy) NSString *dataPath;        //存放数据库路径


//获得类对象
+ (lxyDataBase *)shareLxyDataBase;


//打开数据库
- (void)openDataBase;
//关闭数据库
- (void)closeDataBase;






#pragma mark - 沙漏表的创建和操作(sandTimerTable)
//字段（ID：ID  风格：style   背景音乐:backGroundMusic     人名：peopleName）

//创建一个沙漏表（sandTimerTable）
- (void)createSandTimerTable;

//在沙漏表（sandTimerTable）中添加一个沙漏（sandTimerModel）
- (void)insertToSandTimerTableWithOneSandTimerModel:(lxySandTimerModel *)sandTimerModel;

//在沙漏表（sandTimerTable）中删除一个沙漏（sandTimerModel）
- (void)deleteOneSandTimerModel:(lxySandTimerModel *)sandTimerModel;

//在沙漏表（sandTimerTable）中修改一个沙漏（sandTimerModel）
- (void)alertOneSandTimerModelByStyle:(lxySandTimerModel *)sandTimerModel;

//在沙漏表（sandTimerTable）中查询一个沙漏（sandTimerModel）
- (lxySandTimerModel *)searchOneSandTimerModel:(NSInteger)sandTimerModelID;

//查询表（sandTimerTable）中的所有数据
- (NSMutableArray *)searchAllDataFromSandTimerTable;












#pragma mark - 密码表的创建和操作（passWordTable）
//字段（字段ID：ID    密码：passWord）

//创建密码表（passWordTable）
- (void)createPassWordTable;

//在密码表中插入一个密码（passWord）
- (void)insertToPassWordTableWithOnePassWord:(NSString *)passWord;

//删除表中的密码（passWord）
- (void)deleteAllDataFromPassWordTable;

//修改密码
- (void)alertPassWordWithNewPassWord:(NSString *)passWord;








#pragma mark - 背景图片表的创建和操作(backGroundImageTable)
//字段（ID:ID    图片路径：imagePath）

//创建一个背景图片表（backGroundImageTable）
- (void)createBackGroundImageTable;

//在背景图片表（backGroundImageTable）中插入一张图片
- (void)insertToBackGroundImageTableWithOneImage:(lxyBackGroundImageModel *)backGroundImageModel;

//在背景图片表（backGroundImageTable）中删除一张图片
- (void)deleteOneImageWithImageName:(lxyBackGroundImageModel *)backGroundImageModel;

//查询表（backGroundImageTable）中的所有数据
- (NSMutableArray *)searchAllDataFrombackGroundImageTable;

//根据ID查询背景图片表中的一条数据
- (lxyBackGroundImageModel *)searchOneDataFromBackGroundImageTableByID:(NSInteger)ID;









#pragma mark - 创建一个个人记录表（alonePersonTable）
//字段（ID:ID  人名：name    记录的时间：time  记录的内容：content   背景图片：backGroundImage  记录时的天气：weather）

//创建一个个人记录表（alonePersonTable）
- (void)createAlonePersonTable;

//在该个人记录表（alonePersonTable）中插入一条数据
- (void)insertToAlonePersonTableWithOneAlonePersonModel:(lxyAlonePersonModel *)alonePersonModel;

//在该个人记录表（alonePersonTable）中删除一条数据
- (void)deleteOneAlonePersonModel:(lxyAlonePersonModel *)alonePersonModel;

//在该个人记录表（alonePersonTable）中查询一条数据
- (lxyAlonePersonModel *)searchOneAlonePersonModelByAlonePersonModelName:(NSString *)name;

//查询表（alonePersonTable）中的所有数据
- (NSMutableArray *)searchAllDataFromalonePersonTable;












#pragma mark - 创建一个存放普通日记的表（commonDiaryTable）
//字段（ID:ID  日记内容：content   日记时间：time    天气：weather  背景图片：backGroundImage    心情：mood）

//创建一个普通日记表（commonDiaryTable）
- (void)createCommonDiaryTable;

//在该普通日记表（commonDiaryTable）中插入一条数据
- (void)insertToCommonDiaryTableWithOneCommonDiaryModel:(lxyCommonDiaryModel *)commonDiaryModel;

//在该普通日记表（commonDiaryTable）中删除一条数据
- (void)deleteOneCommonDiaryModel:(lxyCommonDiaryModel *)commonDiaryModel;

//在该普通日记表（commonDiaryTable）中查询一条数据
- (lxyCommonDiaryModel *)searchOneCommonDiaryModelByTime:(NSString *)time;

//查询表（commonDiaryTable）中的所有数据
- (NSMutableArray *)searchAllDataFromcommonDiaryTable;






#pragma mark - 创建个人表
- (void)createTableWithPeopleNameForTableName:(NSString *)tableName;

//在该个个人表中插入一条数据
- (void)insertToAlonePersonTableWithOneAlonePersonModel:(lxyAlonePersonModel *)alonePersonModel
                                                 byName:(NSString *)tableName;

//在该个人记录表中删除一条数据
- (void)deleteOneAlonePersonModel:(lxyAlonePersonModel *)alonePersonModel
                           byName:(NSString *)tableName;

//查询表中的所有数据
- (NSMutableArray *)searchAllDataFromalonePersonTableByPersonName:(NSString *)name;





@end
