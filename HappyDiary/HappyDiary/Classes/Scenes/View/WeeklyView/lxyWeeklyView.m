//
//  lxyWeeklyView.m
//  EventController
//
//  Created by 刘翔宇 on 14-6-20.
//  Copyright (c) 2014年 lanou3g. All rights reserved.
//

#import "lxyWeeklyView.h"

#define WIDTHOFBUTTON 61.875
#define HEIGHTOFBUTTON1 20
#define HEIGHTOFBUTTON2 30
#define JIANJU 2
#define KONGBAI 5

@implementation lxyWeeklyView

- (void)dealloc
{
    [_monthlyButton1 release];
    [_weeklyButton2 release];
    [_dailyButton1 release];
    [_personDataButton1 release];
    [_imageView release];
    [_imageViewTitle release];
//    [_scroller release];
    [_collection release];
    [_layout release];
    
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
    self.weeklyButton2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.dailyButton1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.personDataButton1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    //设置button的位置和大小
    _monthlyButton1.frame = CGRectMake(49, 8, WIDTHOFBUTTON, HEIGHTOFBUTTON1);
    _weeklyButton2.frame = CGRectMake(_monthlyButton1.frame.origin.x + WIDTHOFBUTTON + JIANJU, _monthlyButton1.frame.origin.y, WIDTHOFBUTTON, HEIGHTOFBUTTON2);
    _dailyButton1.frame = CGRectMake(_weeklyButton2.frame.origin.x + WIDTHOFBUTTON + JIANJU, _weeklyButton2.frame.origin.y, WIDTHOFBUTTON, HEIGHTOFBUTTON1);
    _personDataButton1.frame = CGRectMake(_dailyButton1.frame.origin.x + WIDTHOFBUTTON + JIANJU, _dailyButton1.frame.origin.y, WIDTHOFBUTTON, HEIGHTOFBUTTON1);
    
    //设置每个button的背景图片
    [_monthlyButton1 setBackgroundImage:[UIImage imageNamed:@"monthlyBtn.png"] forState:UIControlStateNormal];
    [_weeklyButton2 setBackgroundImage:[UIImage imageNamed:@"weeklyBtn@2x.png"] forState:UIControlStateNormal];
    [_dailyButton1 setBackgroundImage:[UIImage imageNamed:@"dailyBtn.png"] forState:UIControlStateNormal];
    [_personDataButton1 setBackgroundImage:[UIImage imageNamed:@"personDataBtn.png"] forState:UIControlStateNormal];
    
    //设置每个button的文字
    [_monthlyButton1 setTitle:@"monthly" forState:UIControlStateNormal];
    [_weeklyButton2 setTitle:@"weekly" forState:UIControlStateNormal];
    [_dailyButton1 setTitle:@"daily" forState:UIControlStateNormal];
    [_personDataButton1 setTitle:@"person" forState:UIControlStateNormal];
    
    
    //设置每个button的字体样式
    _monthlyButton1.titleLabel.font = [UIFont fontWithName:@"LiDeBiao-Xing-3.0" size:19.f];
    _weeklyButton2.titleLabel.font = [UIFont fontWithName:@"LiDeBiao-Xing-3.0" size:19.f];
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
    [_imageViewTitle addSubview:_monthlyButton1];
    [_imageViewTitle addSubview:_weeklyButton2];
    [_imageViewTitle addSubview:_dailyButton1];
    [_imageViewTitle addSubview:_personDataButton1];
    
    
    
    //给每个button设置阴影效果
    _monthlyButton1.layer.shadowColor = [[UIColor grayColor] CGColor];
    _monthlyButton1.layer.shadowOffset = CGSizeMake(3.f, 3.f);
    _monthlyButton1.layer.shadowOpacity = 2.f;
    _monthlyButton1.layer.shadowRadius = 3.f;
    
    _weeklyButton2.layer.shadowColor = [[UIColor grayColor] CGColor];
    _weeklyButton2.layer.shadowOffset = CGSizeMake(3.f, 3.f);
    _weeklyButton2.layer.shadowOpacity = 2.f;
    _weeklyButton2.layer.shadowRadius = 3.f;
    
    _dailyButton1.layer.shadowColor = [[UIColor grayColor] CGColor];
    _dailyButton1.layer.shadowOffset = CGSizeMake(3.f, 3.f);
    _dailyButton1.layer.shadowOpacity = 2.f;
    _dailyButton1.layer.shadowRadius = 3.f;
    
    _personDataButton1.layer.shadowColor = [[UIColor grayColor] CGColor];
    _personDataButton1.layer.shadowOffset = CGSizeMake(3.f, 3.f);
    _personDataButton1.layer.shadowOpacity = 2.f;
    _personDataButton1.layer.shadowRadius = 3.f;
    
    
    
    
    
//    //在book图片上添加scroller
//    self.layout = [[UICollectionViewFlowLayout alloc] init];
//    _layout.itemSize = CGSizeMake(50, 50);
////    self.collection = [[UICollectionView alloc] initWithFrame:CGRectMake(49, 32.5, 253.5, 419.5)];
//    self.collection = [[[UICollectionView alloc] initWithFrame:CGRectMake(49, 32.5, 253.5, 419.5)] collectionViewLayout:_layout];
////    _collection.backgroundColor = [UIColor magentaColor];
////    [_imageView addSubview:_collection];
    
    
    
    
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
