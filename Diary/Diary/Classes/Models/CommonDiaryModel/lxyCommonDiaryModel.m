//
//  lxyCommonDiaryModel.m
//  DataBase
//
//  Created by 刘翔宇 on 14-6-17.
//  Copyright (c) 2014年 lanou3g. All rights reserved.
//

#import "lxyCommonDiaryModel.h"

@implementation lxyCommonDiaryModel


//初始化方法（时间、内容）
- (instancetype)initWithContent:(NSString *)content
                          andID:(NSString *)ID
                        andTime:(NSString *)time
{
    if (self = [super init]) {
        self.ID = ID;
        self.content = content;
        self.time = time;
    }
    return self;
}

@end
