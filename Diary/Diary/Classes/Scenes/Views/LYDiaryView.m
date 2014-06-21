//
//  LYDiaryView.m
//  Diary
//
//  Created by liuyu on 14-6-18.
//  Copyright (c) 2014年 lanou3g. All rights reserved.
//

#import "LYDiaryView.h"


@implementation LYDiaryView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    
        [self addAllViews];
    }
    return self;
}

- (void) addAllViews
{
    self.topView = [[UIView alloc] initWithFrame: Rect(0, 64, ScreenWidth, kHeaderHeight)];
    [self addSubview:_topView];
    
    UIImageView *topViewImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wallpaper-header"]];
    topViewImage.frame = Rect(0, 0, ScreenWidth, kHeaderHeight);
    [self.topView addSubview:topViewImage];
    
    self.weatherBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    _weatherBtn.frame = CGRectMake(0, 0, 50, kHeaderHeight);
    [_weatherBtn setBackgroundImage:[UIImage imageNamed:@"weather-2"] forState:UIControlStateNormal];
    [self.topView addSubview:self.weatherBtn];
    
    
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
