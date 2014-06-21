//
//  lxyBaseView.m
//  EventController
//
//  Created by 刘翔宇 on 14-6-20.
//  Copyright (c) 2014年 lanou3g. All rights reserved.
//

#import "lxyBaseView.h"

@implementation lxyBaseView

- (void)dealloc
{
    [_bookImageView release];
    [_titleImageView release];
    
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
