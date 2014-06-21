//
//  LYDiaryView.h
//  HappyDiary
//
//  Created by liuyu on 14-6-20.
//  Copyright (c) 2014年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYDiaryView : UIView

@property (nonatomic, retain) UIButton *weatherBtn; //  天气按钮
@property (nonatomic, retain) UILabel *timeLabel; //  时间
@property (nonatomic, retain) UILabel *weekLabel;  // 星期
@property (nonatomic, retain) UIButton *toolButton;  //  工具按钮
@property (nonatomic, retain) UITextView *content;  //  正文
@property (nonatomic, assign) UITapGestureRecognizer *tapGR;
@property (nonatomic, retain) UISlider *slider;  //  透明度

@property (nonatomic , retain) UIImageView *bookImageView;
@property (nonatomic , retain) UIImageView *titleImageView;

@end
