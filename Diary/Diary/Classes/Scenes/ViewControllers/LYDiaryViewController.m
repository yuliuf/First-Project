//
//  LYDiaryViewController.m
//  Diary
//
//  Created by liuyu on 14-6-17.
//  Copyright (c) 2014年 lanou3g. All rights reserved.
//

#import "LYDiaryViewController.h"
#import "LYDiaryView.h"
#import "LYAppDelegate.h"
#import "LYSelectViewController.h"


@interface LYDiaryViewController ()

@property (nonatomic, strong) LYDiaryView *diaryView;

//-(void)loadMenu;
//-(void)btn;
//-(void)tap:(id)sender;

@end

@implementation LYDiaryViewController {
//      __strong SGSelectViewController *_sg;
//    UILabel *_iconLbl;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"日记" image:[UIImage imageNamed:@"diary"] tag:10];
        
    }
    return self;
}
-(void)loadView
{
    self.diaryView = [[LYDiaryView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view = self.diaryView;
}


- (void)viewDidLoad
{
    
//    _sg = [[SGSelectViewController alloc]init];
//    
//    [self loadMenu];
//    [self btn];
    
//    
//    LYAppDelegate *appDelegate;
//    appDelegate = (LYAppDelegate*)[[UIApplication sharedApplication] delegate];
//    appDelegate.selectBtn = self.diaryView.weatherBtn;
    
    
    [super viewDidLoad];
    
    [self.diaryView.weatherBtn addTarget:self action:@selector(weatherBtnAction:) forControlEvents:UIControlEventTouchUpInside];
 
    
    
}
//-(void)loadMenu{
//    
//    [self.diaryView addSubview:_sg.view];
//}
//
//-(void)tap:(id)sender{
//    
//    [_sg sgViewAppear];
//}
//-(void)btn{
//    
//    _selectBtn = [UIButton  buttonWithType:UIButtonTypeCustom];
//    [_selectBtn setFrame:CGRectMake(100, 100, 44, 44)];
//    [_selectBtn setBackgroundImage:[UIImage imageNamed:@"choseBtn.png"] forState:UIControlStateNormal];
//    [_selectBtn addTarget:self action:@selector(tap:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:_selectBtn];
//    
//}

- (void) weatherBtnAction:(UIButton *)sender
{
    LYSelectViewController *selectVC = [LYSelectViewController new];
    selectVC.point = CGPointMake(MinX( _diaryView.weatherBtn.frame), MaxY( _diaryView.weatherBtn.frame) + 60);
    [self.diaryView addSubview:selectVC.view];
    
}

- (void)buttonAction:(UIButton *)sender
{
    self.tabBarController.tabBar.hidden = YES;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
