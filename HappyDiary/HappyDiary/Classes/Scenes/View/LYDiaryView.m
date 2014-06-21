//
//  LYDiaryView.m
//  HappyDiary
//
//  Created by liuyu on 14-6-20.
//  Copyright (c) 2014年 lanou3g. All rights reserved.
//

#import "LYDiaryView.h"

@implementation LYDiaryView
- (void)dealloc
{
    [_weatherBtn release];
    [_timeLabel release];
    [_toolButton release];
    [_content release];
//    [_tapGR release];
    
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addAllViews];
    }
    return self;
}

- (void)addAllViews
{
    
    
    //添加背景图书图片
    UIImage *bookImage = [UIImage imageNamed:@"book.png"];
    self.bookImageView = [[UIImageView alloc] initWithImage:bookImage];
    _bookImageView.userInteractionEnabled = YES;
    _bookImageView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    [self addSubview:_bookImageView];
    
    //添加背景title图片
    UIImage *titleImage = [UIImage imageNamed:@"title.png"];
    self.titleImageView = [[UIImageView alloc] initWithImage:titleImage];
    _titleImageView.userInteractionEnabled = YES;
    _titleImageView.frame = CGRectMake(0, 0, self.frame.size.width, 54);
    [self addSubview:_titleImageView];

    
    
    
    // 天气按钮
    self.weatherBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    _weatherBtn.frame = CGRectMake(40, kMargin, 50, 50);
    _weatherBtn.tag = 1;
    [_weatherBtn setBackgroundImage:[UIImage imageNamed:@"weather_cloudy"] forState:UIControlStateNormal];
    [self addSubview:self.weatherBtn];
    
    // 时间
   self.timeLabel = [[UILabel alloc] initWithFrame:Rect(80, kMargin + 3, 150, 25)];
    _timeLabel.text = [LYHelper getSystemDateWithFormat:0];
    _timeLabel.textAlignment = NSTextAlignmentCenter;
//    _timeLabel.backgroundColor = [UIColor grayColor];
    [self addSubview:_timeLabel];
    
    // 星期
    self.weekLabel = [[UILabel alloc] initWithFrame:Rect(MaxX(_timeLabel.frame) + 10, kMargin + 5, 50, 25)];
    _weekLabel.text = [LYHelper getSystemDay];
    _weekLabel.textAlignment = NSTextAlignmentCenter;
//    _weekLabel.backgroundColor = [UIColor grayColor];
    [self addSubview:_weekLabel];
    
 
    
    // 正文
    self.content = [[UITextView alloc] initWithFrame:Rect(edgeMagin * 2, MaxY(_timeLabel.frame) + kMargin, ScreenWidth - edgeMagin * 4, ScreenHeight - MaxY(_timeLabel.frame) - 130)];
    self.content.font = [UIFont systemFontOfSize:20.f];
    self.content.backgroundColor = myYellow;
    [self addSubview:self.content];
    
    // 工具按钮
    self.toolButton = [UIButton buttonWithType:UIButtonTypeSystem];
    _toolButton.frame = CGRectMake(ScreenWidth - 10 - 20 ,MaxY(_weekLabel.frame), 20, 20);
    [self.toolButton setBackgroundImage:[UIImage imageNamed:@"deco_hand_stroke_on"] forState:UIControlStateNormal];
    [self addSubview:_toolButton];

    // 透明度滑动条
    UILabel *label = [[UILabel alloc] initWithFrame:Rect(edgeMagin, MaxY(_content.frame), 60, 40)];
    label.text = @"opacity";
    _timeLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:label];

    self.slider = [[UISlider alloc] initWithFrame:Rect(MaxX(label.frame), MaxY(_content.frame), 200, 40)];
    [self addSubview:_slider];
    
    
}

#pragma mark 重写手势的getter
- (UITapGestureRecognizer *)tapGR
{
    if (_tapGR == nil) {
        _tapGR = [[[UITapGestureRecognizer alloc] init] autorelease];
        //  讲手势添加到view上
        [self.content addGestureRecognizer:_tapGR];
        [self addGestureRecognizer:_tapGR];
    }
    
    //  返回手势
    return [_tapGR retain];
}

@end
