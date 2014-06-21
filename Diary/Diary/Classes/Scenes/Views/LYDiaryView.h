//
//  LYDiaryView.h
//  Diary
//
//  Created by liuyu on 14-6-18.
//  Copyright (c) 2014年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYDiaryView : UIView

@property (nonatomic, strong) UIView *topView;       //  顶部view
@property (nonatomic, strong) UIButton *weatherBtn; //  天气按钮
@property (nonatomic, strong) UIButton *dateButton; //  时间按钮
@property (nonatomic, strong) UIButton *addButton;  //  添加按钮
@end
