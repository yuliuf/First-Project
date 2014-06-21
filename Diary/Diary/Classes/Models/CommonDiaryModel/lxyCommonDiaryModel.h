//
//  lxyCommonDiaryModel.h
//  DataBase
//
//  Created by 刘翔宇 on 14-6-17.
//  Copyright (c) 2014年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface lxyCommonDiaryModel : NSObject

@property (nonatomic , copy) NSString *content;     //日记内容
@property (nonatomic , copy) NSString *time;        //写日记时间
@property (nonatomic , copy) NSString *ID;          //ID



//初始化方法(时间、内容)
- (instancetype)initWithContent:(NSString *)content
                          andID:(NSString *)ID
                        andTime:(NSString *)time;

@end
