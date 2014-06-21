//
//  LYRootViewController.m
//  Diary
//
//  Created by liuyu on 14-6-17.
//  Copyright (c) 2014年 lanou3g. All rights reserved.
//

#import "LYRootViewController.h"
//#import "LYMemoryViewController.h"
//#import "LYHourglassViewController.h"
//#import "LYDiaryViewController.h"
//#import "LYPrivateViewController.h"
//#import "LYTabBarController.h"
#import "Header.h"


@interface LYRootViewController ()



@end

@implementation LYRootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor yellowColor];
    
    
    [self addAllViews];

}
- (void)addAllViews
{
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn1.frame = CGRectMake(100 ,100, 100, 30);
    [btn1 setTitle:@"日记" forState:UIControlStateNormal];
    btn1.tag = 1;
    [btn1 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn2.frame = CGRectMake(100 ,200, 100, 30);
    btn2.tag = 2;
    [btn2 setTitle:@"日历" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:btn2];
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn3.frame = CGRectMake(100 ,300, 100, 30);
    btn3.tag = 3;
    [btn3 setTitle:@"沙漏" forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:btn3];
    
    UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn4.frame = CGRectMake(100 ,400, 100, 30);
    btn4.tag = 4;
    [btn4 setTitle:@"设置" forState:UIControlStateNormal];
    [btn4 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn4];

    
    
}

- (void)btnAction:(UIButton *)sender
{
    LYDiaryViewController *diaryVC = [LYDiaryViewController new];
    UINavigationController *diaryNC = [[UINavigationController alloc] initWithRootViewController:diaryVC];
    
    LYMemoryViewController *memoryVC = [LYMemoryViewController new];
     UINavigationController *memoryNC = [[UINavigationController alloc] initWithRootViewController:memoryVC];
    
    LYHourglassViewController *hourglassVC = [LYHourglassViewController new];
     UINavigationController *hourglassNC = [[UINavigationController alloc] initWithRootViewController:hourglassVC];
    
    LYPrivateViewController *privateVC = [LYPrivateViewController new];
     UINavigationController *privateNC = [[UINavigationController alloc] initWithRootViewController:privateVC];
    
    LYTabBarController *tabBar = [LYTabBarController new];
    tabBar.viewControllers = @[diaryNC, memoryNC, hourglassNC, privateNC];
    tabBar.selectedIndex = ((UIButton *)sender).tag - 1;
    
    tabBar.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentViewController:tabBar animated:YES completion:nil];
//    [self.navigationController pushViewController:tabBar animated:YES];
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
