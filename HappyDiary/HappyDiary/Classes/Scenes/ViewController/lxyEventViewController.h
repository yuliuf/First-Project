//
//  lxyEventViewController.h
//  EventController
//
//  Created by 刘翔宇 on 14-6-20.
//  Copyright (c) 2014年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>

@class lxyMonthlyView;
@class lxyWeeklyView;
@class lxyDailyView;
@class lxyPersonDataView;
@class lxyBaseView;

@interface lxyEventViewController : UIViewController

@property (nonatomic , retain) lxyMonthlyView *monthlyView;
@property (nonatomic , retain) lxyWeeklyView *weeklyView;
@property (nonatomic , retain) lxyDailyView *dailyView;
@property (nonatomic , retain) lxyPersonDataView *personDataView;

@property (nonatomic , retain) lxyBaseView *baseView;

@end
