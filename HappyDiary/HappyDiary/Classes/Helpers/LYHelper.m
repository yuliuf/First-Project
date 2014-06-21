//
//  LYHelper.m
//  Diary
//
//  Created by liuyu on 14-6-18.
//  Copyright (c) 2014年 lanou3g. All rights reserved.
//

#import "LYHelper.h"

@implementation LYHelper

#pragma mark 获取系统的时间参数 年 月 日 星期几 时 分 秒
+ (NSString *)getSystemDateWithFormat:(NSInteger)format
{
    
    NSDate *date = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps;
    
    // 年月日获得
    comps = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit)
                        fromDate:date];
    NSInteger year = [comps year];
    NSInteger month = [comps month];
    NSInteger day = [comps day];
    NSLog(@"year: %d month: %d, day: %d", year, month, day);

//    NSString *yearStr = [NSString stringWithFormat:@"%ld年", year];
//    NSString *monthStr = [NSString stringWithFormat:@"%ld月", month];
//    NSString *dayStr = [NSString stringWithFormat:@"%ld日", day];
    if (0 == format) {
    return [NSString stringWithFormat:@"%d年%d月%d日",year, month, day];
    }
    return [NSString stringWithFormat:@"%d/%d/%d", year, month, day];
    
}

#pragma mark 获取系统的星期几
+ (NSString *)getSystemDay
{
    NSDate *date = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps;
    
    comps = [calendar components:(NSWeekCalendarUnit | NSWeekdayCalendarUnit | NSWeekdayOrdinalCalendarUnit)
                        fromDate:date];
//    NSInteger week = [comps week]; // 今年的第几周
    NSInteger weekday = [comps weekday]; // 星期几（注意，周日是“1”，周一是“2”。。。。）
//    NSInteger weekdayOrdinal = [comps weekdayOrdinal]; // 这个月的第几周
    
    return [self week:weekday];
    
    
}
#pragma mark 获取系统的时分
+ (NSString *)getSystemTime
{
    NSDate *date = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps;
    
    comps = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit)
                        fromDate:date];
    comps = [calendar components:(NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit)
                        fromDate:date];
    NSInteger hour = [comps hour];
    NSInteger minute = [comps minute];

    return [NSString stringWithFormat:@"%d:%d", hour, minute];


}

#pragma mark 转成周几的字符串
 + (NSString*)week:(NSInteger)week
{
    NSString*weekStr=nil;
    if(week==1)
    {
        weekStr=@"周日";
    }else if(week==2){
        weekStr=@"周一";
        
    }else if(week==3){
        weekStr=@"周二";
        
    }else if(week==4){
        weekStr=@"周三";
        
    }else if(week==5){
        weekStr=@"周四";
        
    }else if(week==6){
        weekStr=@"周五";
        
    }else if(week==7){
        weekStr=@"周六";
        
    }
    return weekStr;
}

@end
