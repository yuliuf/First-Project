//
//  LYAppDelegate.h
//  Diary
//
//  Created by liuyu on 14-6-17.
//  Copyright (c) 2014年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYDiaryViewController.h"

@interface LYAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) LYDiaryViewController *diaryVC;
@property (weak, nonatomic) UIButton *selectBtn;
@end
