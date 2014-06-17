//
//  LYDiaryViewController.m
//  Diary
//
//  Created by liuyu on 14-6-17.
//  Copyright (c) 2014年 lanou3g. All rights reserved.
//

#import "LYDiaryViewController.h"


@interface LYDiaryViewController ()

@end

@implementation LYDiaryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"日记" image:[UIImage imageNamed:@"diary"] tag:10];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor magentaColor];
    UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"首页" style:UIBarButtonItemStylePlain target:self action:@selector(backBarButtonItemAction:)];
    self.navigationItem.leftBarButtonItem = backBarButtonItem;
}

- (void)backBarButtonItemAction:(UIBarButtonItem *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
