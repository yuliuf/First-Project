//
//  lxySandTimerModel.h
//  DataBase
//
//  Created by 刘翔宇 on 14-6-17.
//  Copyright (c) 2014年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface lxySandTimerModel : NSObject

@property (nonatomic , copy) NSString *ID;      //沙漏的ID
@property (nonatomic , copy) NSString *style;   //沙漏的风格



//初始化一个沙漏（沙漏的ID：ID  沙漏的风格：style）
- (instancetype)initWithID:(NSString *)ID
                  andStyle:(NSString *)style;

@end
