//
//  lxyEventViewController.m
//  EventController
//
//  Created by 刘翔宇 on 14-6-20.
//  Copyright (c) 2014年 lanou3g. All rights reserved.
//

#import "lxyEventViewController.h"

#import "lxyMonthlyView.h"
#import "lxyWeeklyView.h"
#import "lxyDailyView.h"
#import "lxyPersonDataView.h"
#import "lxyBaseView.h"

@interface lxyEventViewController ()

@end

@implementation lxyEventViewController

- (void)dealloc
{
    [_monthlyView release];
    [_weeklyView release];
    [_dailyView release];
    [_personDataView release];
    [_baseView release];
    
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"事件" image:nil tag:2];
    }
    return self;
}

- (void)loadView
{
    self.monthlyView = [[[lxyMonthlyView alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    self.weeklyView = [[[lxyWeeklyView alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    self.dailyView = [[[lxyDailyView alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    self.personDataView = [[[lxyPersonDataView alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
    
    self.baseView = [[[lxyBaseView alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
//    self.view = _baseView;
    
    [self weeklyButton1ForDailyViewAction:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    // ~~~~添加~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    //dailyView上button按钮的事件
    [_dailyView.monthlyButton1 addTarget:self action:@selector(monthlyButton1ForDailyViewAction:) forControlEvents:UIControlEventTouchUpInside];
    [_dailyView.weeklyButton1 addTarget:self action:@selector(weeklyButton1ForDailyViewAction:) forControlEvents:UIControlEventTouchUpInside];
    [_dailyView.personDataButton1 addTarget:self action:@selector(personDataButton1ForDailyViewAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //monthlyView上button按钮的事件
    [_monthlyView.weeklyButton1 addTarget:self action:@selector(weeklyButton1ForMonthlyViewAction:) forControlEvents:UIControlEventTouchUpInside];
    [_monthlyView.dailyButton1 addTarget:self action:@selector(dailyButton1ForMonthlyViewAction:) forControlEvents:UIControlEventTouchUpInside];
    [_monthlyView.personDataButton1 addTarget:self action:@selector(personDataButton1ForMonthlyViewAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //weeklyView上button按钮的事件
    [_weeklyView.monthlyButton1 addTarget:self action:@selector(monthlyButton1ForWeeklyViewAction:) forControlEvents:UIControlEventTouchUpInside];
    [_weeklyView.dailyButton1 addTarget:self action:@selector(dailyButton1ForWeeklyViewAction:) forControlEvents:UIControlEventTouchUpInside];
    [_weeklyView.personDataButton1 addTarget:self action:@selector(personDataButton1ForWeeklyViewAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //personDataView上button按钮的事件
    [_personDataView.monthlyButton1 addTarget:self action:@selector(monthlyButton1ForPersonDataViewAction:) forControlEvents:UIControlEventTouchUpInside];
    [_personDataView.weeklyButton1 addTarget:self action:@selector(weeklyButton1ForPersonDataViewAction:) forControlEvents:UIControlEventTouchUpInside];
    [_personDataView.dailyButton1 addTarget:self action:@selector(dailyButton1ForPersonDataViewAction:) forControlEvents:UIControlEventTouchUpInside];
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
    
    
    
    
    
    // ~~~~~~~个人信息页面~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
    [self.personDataView.editBtn addTarget:self action:@selector(personDataEditBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    
}


//personDataView上button按钮的事件
- (void)monthlyButton1ForPersonDataViewAction:(UIButton *)sender
{
    self.view = _monthlyView;
}
- (void)weeklyButton1ForPersonDataViewAction:(UIButton *)sender
{
    self.view = _weeklyView;
}
- (void)dailyButton1ForPersonDataViewAction:(UIButton *)sender
{
    self.view = _dailyView;
}


//dailyView上button按钮的事件
- (void)monthlyButton1ForDailyViewAction:(UIButton *)sender
{
    self.view = _monthlyView;
}
- (void)weeklyButton1ForDailyViewAction:(UIButton *)sender
{
    self.view = _weeklyView;
}
- (void)personDataButton1ForDailyViewAction:(UIButton *)sender
{
    self.view = _personDataView;
}

//monthlyView上button按钮的事件
- (void)weeklyButton1ForMonthlyViewAction:(UIButton *)sender
{
    self.view = _weeklyView;
}
- (void)dailyButton1ForMonthlyViewAction:(UIButton *)sender
{
    self.view = _dailyView;
}
- (void)personDataButton1ForMonthlyViewAction:(UIButton *)sender
{
    self.view = _personDataView;
}

//weeklyView上button按钮的事件
- (void)monthlyButton1ForWeeklyViewAction:(UIButton *)sender
{
    self.view = _monthlyView;
}
- (void)dailyButton1ForWeeklyViewAction:(UIButton *)sender
{
    self.view = _dailyView;
}
- (void)personDataButton1ForWeeklyViewAction:(UIButton *)sender
{
    self.view = _personDataView;
}




#pragma mark 隐藏导航栏上方系统时间、电池显示
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - 个人信息界面
- (void)personDataEditBtnAction:(UIButton *)sender
{
    if ([sender.currentTitle isEqualToString:@"Edit"]) {
        [sender setTitle:@"Save" forState:UIControlStateNormal];
        self.personDataView.name.enabled = YES;
        self.personDataView.birthday.enabled = YES;
        self.personDataView.introduce.editable = YES;
        
        self.personDataView.name.borderStyle = UITextBorderStyleRoundedRect;
        self.personDataView.birthday.borderStyle = UITextBorderStyleRoundedRect;
        self.personDataView.introduce.layer.borderWidth = 1.f;
        self.personDataView.introduce.layer.borderColor = [UIColor grayColor].CGColor;
        self.personDataView.introduce.layer.cornerRadius = 5;
        
        
    } else {
        [sender setTitle:@"Edit" forState:UIControlStateNormal];

    }
}

@end
