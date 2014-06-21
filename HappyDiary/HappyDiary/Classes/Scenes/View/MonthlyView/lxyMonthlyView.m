//
//  lxyMonthlyView.m
//  EventController
//
//  Created by 刘翔宇 on 14-6-20.
//  Copyright (c) 2014年 lanou3g. All rights reserved.
//

#import "lxyMonthlyView.h"

#define WIDTHOFBUTTON 61.875
#define HEIGHTOFBUTTON1 20
#define HEIGHTOFBUTTON2 30
#define JIANJU 2


@implementation lxyMonthlyView

- (void)dealloc
{
    [_monthlyButton2 release];
    [_weeklyButton1 release];
    [_dailyButton1 release];
    [_personDataButton1 release];
    [_imageView release];
    [_imageViewTitle release];
    [_scroller release];
    
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        [self addAllViews];
        
    }
    return self;
}

- (void)addAllViews
{
    self.monthlyButton2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.weeklyButton1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.dailyButton1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.personDataButton1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    //设置button的位置和大小
    _monthlyButton2.frame = CGRectMake(49, 8, WIDTHOFBUTTON, HEIGHTOFBUTTON2);
    _weeklyButton1.frame = CGRectMake(_monthlyButton2.frame.origin.x + WIDTHOFBUTTON + JIANJU, _monthlyButton2.frame.origin.y, WIDTHOFBUTTON, HEIGHTOFBUTTON1);
    _dailyButton1.frame = CGRectMake(_weeklyButton1.frame.origin.x + WIDTHOFBUTTON + JIANJU, _weeklyButton1.frame.origin.y, WIDTHOFBUTTON, HEIGHTOFBUTTON1);
    _personDataButton1.frame = CGRectMake(_dailyButton1.frame.origin.x + WIDTHOFBUTTON + JIANJU, _dailyButton1.frame.origin.y, WIDTHOFBUTTON, HEIGHTOFBUTTON1);
    
    //设置每个button的背景图片
    [_monthlyButton2 setBackgroundImage:[UIImage imageNamed:@"monthlyBtn@2x.png"] forState:UIControlStateNormal];
    [_weeklyButton1 setBackgroundImage:[UIImage imageNamed:@"weeklyBtn.png"] forState:UIControlStateNormal];
    [_dailyButton1 setBackgroundImage:[UIImage imageNamed:@"dailyBtn.png"] forState:UIControlStateNormal];
    [_personDataButton1 setBackgroundImage:[UIImage imageNamed:@"personDataBtn.png"] forState:UIControlStateNormal];
    
    //设置每个button的文字
    [_monthlyButton2 setTitle:@"monthly" forState:UIControlStateNormal];
    [_weeklyButton1 setTitle:@"weekly" forState:UIControlStateNormal];
    [_dailyButton1 setTitle:@"daily" forState:UIControlStateNormal];
    [_personDataButton1 setTitle:@"person" forState:UIControlStateNormal];
    
    //设置每个button的字体样式
    _monthlyButton2.titleLabel.font = [UIFont fontWithName:@"LiDeBiao-Xing-3.0" size:19.f];
    _weeklyButton1.titleLabel.font = [UIFont fontWithName:@"LiDeBiao-Xing-3.0" size:19.f];
    _dailyButton1.titleLabel.font = [UIFont fontWithName:@"LiDeBiao-Xing-3.0" size:19.f];
    _personDataButton1.titleLabel.font = [UIFont fontWithName:@"LiDeBiao-Xing-3.0" size:19.f];
    
    
    //添加背景图片
    UIImage *img = [UIImage imageNamed:@"book"];
    self.imageView = [[UIImageView alloc] initWithImage:img];
    _imageView.userInteractionEnabled = YES;
    _imageView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    [self addSubview:_imageView];
    
    UIImage *imgTitle = [UIImage imageNamed:@"title"];
    self.imageViewTitle = [[UIImageView alloc] initWithImage:imgTitle];
    _imageViewTitle.userInteractionEnabled = YES;
    _imageViewTitle.frame = CGRectMake(0, 0, self.frame.size.width, 54);
    [self addSubview:_imageViewTitle];
    
    
    //把所有的button添加到背景图片上
    [_imageViewTitle addSubview:_monthlyButton2];
    [_imageViewTitle addSubview:_weeklyButton1];
    [_imageViewTitle addSubview:_dailyButton1];
    [_imageViewTitle addSubview:_personDataButton1];
    
    
    
    //给每个button设置阴影效果
    _monthlyButton2.layer.shadowColor = [[UIColor grayColor] CGColor];
    _monthlyButton2.layer.shadowOffset = CGSizeMake(3.f, 3.f);
    _monthlyButton2.layer.shadowOpacity = 2.f;
    _monthlyButton2.layer.shadowRadius = 3.f;
    
    _weeklyButton1.layer.shadowColor = [[UIColor grayColor] CGColor];
    _weeklyButton1.layer.shadowOffset = CGSizeMake(3.f, 3.f);
    _weeklyButton1.layer.shadowOpacity = 2.f;
    _weeklyButton1.layer.shadowRadius = 3.f;
    
    _dailyButton1.layer.shadowColor = [[UIColor grayColor] CGColor];
    _dailyButton1.layer.shadowOffset = CGSizeMake(3.f, 3.f);
    _dailyButton1.layer.shadowOpacity = 2.f;
    _dailyButton1.layer.shadowRadius = 3.f;
    
    _personDataButton1.layer.shadowColor = [[UIColor grayColor] CGColor];
    _personDataButton1.layer.shadowOffset = CGSizeMake(3.f, 3.f);
    _personDataButton1.layer.shadowOpacity = 2.f;
    _personDataButton1.layer.shadowRadius = 3.f;
    
    
    
    
    
    
    //在book图片上添加scroller
    self.scroller = [[UIScrollView alloc] initWithFrame:CGRectMake(49, 32.5, 253.5, 419.5)];
    _scroller.backgroundColor = [UIColor greenColor];
    [_imageView addSubview:_scroller];
    
    
    
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
