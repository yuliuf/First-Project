//
//  LYHelper.h
//  Diary
//
//  Created by liuyu on 14-6-18.
//  Copyright (c) 2014年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYHelper : NSObject

#pragma mark 获取系统的时间参数 年 月 日 星期几 时 分 秒
+ (NSString *)getSystemDate;
#pragma mark 获取系统的星期几
+ (NSString *)getSystemDay;
#pragma mark 获取系统的时分
+ (NSString *)getSystemTime;

@end
