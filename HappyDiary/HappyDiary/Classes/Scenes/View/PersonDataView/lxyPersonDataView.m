//
//  lxyPersonDataView.m
//  EventController
//
//  Created by 刘翔宇 on 14-6-20.
//  Copyright (c) 2014年 lanou3g. All rights reserved.
//

#import "lxyPersonDataView.h"

#define WIDTHOFBUTTON 61.875
#define HEIGHTOFBUTTON1 20
#define HEIGHTOFBUTTON2 30
#define JIANJU 2


@implementation lxyPersonDataView

-(void)dealloc
{
    [_monthlyButton1 release];
    [_weeklyButton1 release];
    [_dailyButton1 release];
    [_personDataButton2 release];
    [_imageView release];
    [_imageViewTitle release];
//    [_scroller release];
    
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
    self.monthlyButton1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.weeklyButton1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.dailyButton1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.personDataButton2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    //设置button的位置和大小
    _monthlyButton1.frame = CGRectMake(49, 8, WIDTHOFBUTTON, HEIGHTOFBUTTON1);
    _weeklyButton1.frame = CGRectMake(_monthlyButton1.frame.origin.x + WIDTHOFBUTTON + JIANJU, _monthlyButton1.frame.origin.y, WIDTHOFBUTTON, HEIGHTOFBUTTON1);
    _dailyButton1.frame = CGRectMake(_weeklyButton1.frame.origin.x + WIDTHOFBUTTON + JIANJU, _weeklyButton1.frame.origin.y, WIDTHOFBUTTON, HEIGHTOFBUTTON1);
    _personDataButton2.frame = CGRectMake(_dailyButton1.frame.origin.x + WIDTHOFBUTTON + JIANJU, _dailyButton1.frame.origin.y, WIDTHOFBUTTON, HEIGHTOFBUTTON2);
    
    //设置每个button的背景图片
    [_monthlyButton1 setBackgroundImage:[UIImage imageNamed:@"monthlyBtn.png"] forState:UIControlStateNormal];
    [_weeklyButton1 setBackgroundImage:[UIImage imageNamed:@"weeklyBtn.png"] forState:UIControlStateNormal];
    [_dailyButton1 setBackgroundImage:[UIImage imageNamed:@"dailyBtn.png"] forState:UIControlStateNormal];
    [_personDataButton2 setBackgroundImage:[UIImage imageNamed:@"personDataBtn@2x.png"] forState:UIControlStateNormal];
    
    //设置每个button的文字
    [_monthlyButton1 setTitle:@"monthly" forState:UIControlStateNormal];
    [_weeklyButton1 setTitle:@"weekly" forState:UIControlStateNormal];
    [_dailyButton1 setTitle:@"daily" forState:UIControlStateNormal];
    [_personDataButton2 setTitle:@"person" forState:UIControlStateNormal];
    
    
    //设置每个button的字体样式
    _monthlyButton1.titleLabel.font = [UIFont fontWithName:@"LiDeBiao-Xing-3.0" size:19.f];
    _weeklyButton1.titleLabel.font = [UIFont fontWithName:@"LiDeBiao-Xing-3.0" size:19.f];
    _dailyButton1.titleLabel.font = [UIFont fontWithName:@"LiDeBiao-Xing-3.0" size:19.f];
    _personDataButton2.titleLabel.font = [UIFont fontWithName:@"LiDeBiao-Xing-3.0" size:19.f];
    
    
    
    
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
    [_imageViewTitle addSubview:_monthlyButton1];
    [_imageViewTitle addSubview:_weeklyButton1];
    [_imageViewTitle addSubview:_dailyButton1];
    [_imageViewTitle addSubview:_personDataButton2];
    
    
    
    
    //给每个button设置阴影效果
    _monthlyButton1.layer.shadowColor = [[UIColor grayColor] CGColor];
    _monthlyButton1.layer.shadowOffset = CGSizeMake(3.f, 3.f);
    _monthlyButton1.layer.shadowOpacity = 2.f;
    _monthlyButton1.layer.shadowRadius = 3.f;
    
    _weeklyButton1.layer.shadowColor = [[UIColor grayColor] CGColor];
    _weeklyButton1.layer.shadowOffset = CGSizeMake(3.f, 3.f);
    _weeklyButton1.layer.shadowOpacity = 2.f;
    _weeklyButton1.layer.shadowRadius = 3.f;
    
    _dailyButton1.layer.shadowColor = [[UIColor grayColor] CGColor];
    _dailyButton1.layer.shadowOffset = CGSizeMake(3.f, 3.f);
    _dailyButton1.layer.shadowOpacity = 2.f;
    _dailyButton1.layer.shadowRadius = 3.f;
    
    _personDataButton2.layer.shadowColor = [[UIColor grayColor] CGColor];
    _personDataButton2.layer.shadowOffset = CGSizeMake(3.f, 3.f);
    _personDataButton2.layer.shadowOpacity = 2.f;
    _personDataButton2.layer.shadowRadius = 3.f;
    
    
    
//    //在book图片上添加scroller
//    self.scroller = [[UIScrollView alloc] initWithFrame:CGRectMake(49, 32.5, 253.5, 419.5)];
//    _scroller.backgroundColor = [UIColor blueColor];
//    [_imageView addSubview:_scroller];
    
    //  添加编辑按钮
    self.editBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    _editBtn.frame = CGRectMake(230,ScreenHeight - 80, 60, 30);
    [self.editBtn setBackgroundImage:[UIImage imageNamed:@"intro_menu_brown"] forState:UIControlStateNormal];
    [self.editBtn setTitle:@"Edit" forState:UIControlStateNormal];
    self.editBtn.titleLabel.font = myZiti;
    [self.editBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self addSubview:_editBtn];
    
    //  头像
    self.headerIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"headIcon"]];
    self.headerIcon.frame = Rect(50, 60, 120, 120);
    [self addSubview:self.headerIcon];
    
    // 姓名 生日
    self.name = [[UITextField alloc] initWithFrame:Rect(MaxX(_headerIcon.frame) + 10, MinY(_headerIcon.frame) + 50, 100, 40)];
    self.name.text = @"熊博士";
    self.name.textAlignment = NSTextAlignmentCenter;
    self.name.font = myZiti;
    self.name.enabled = NO;
    [self addSubview:self.name];
    
    self.birthday = [[UITextField alloc] initWithFrame:Rect(MinX(_name.frame), MaxY(_name.frame), 100, 30)];
    self.birthday.text = @"1992.3.24";
    self.birthday.textAlignment = NSTextAlignmentCenter;
    self.birthday.font = myZiti;
    self.birthday.enabled = NO;
    [self addSubview:self.birthday];
    
    // 介绍
    self.introduce = [[UITextView alloc] initWithFrame:Rect(MinX(_headerIcon.frame), MaxY(_headerIcon.frame) + 30, 220, 230)];
    self.introduce.font = myZiti;
    self.introduce.editable = NO;
    self.introduce.text = @"好简单的愿望，我们小时候，愿望也是好简单，但是不能说。我们只能在作文里写到，我的愿望是做一个科学家······从小，我们就已经不单纯了。英文老师教小朋友们念社会栋梁一段，向，CEO，便是社会栋。";
    self.introduce.bounces = NO;
    [self addSubview:self.introduce];
    

    
    
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
