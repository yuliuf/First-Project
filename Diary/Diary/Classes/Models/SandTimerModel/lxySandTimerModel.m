//
//  lxySandTimerModel.m
//  DataBase
//
//  Created by 刘翔宇 on 14-6-17.
//  Copyright (c) 2014年 lanou3g. All rights reserved.
//

#import "lxySandTimerModel.h"

@implementation lxySandTimerModel

//初始化一个沙漏（沙漏的ID：ID  沙漏的风格：style）
- (instancetype)initWithID:(NSString *)ID
                  andStyle:(NSString *)style
{
    if (self = [super init]) {
        self.ID = ID;
        self.style = style;
    }
    return  self;
}

@end
