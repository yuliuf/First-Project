//
//  lxyWeeklyView.h
//  EventController
//
//  Created by 刘翔宇 on 14-6-20.
//  Copyright (c) 2014年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface lxyWeeklyView : UIView

@property (nonatomic , retain) UIButton *monthlyButton1;

@property (nonatomic , retain) UIButton *weeklyButton2;

@property (nonatomic , retain) UIButton *dailyButton1;

@property (nonatomic , retain) UIButton *personDataButton1;

@property (nonatomic , retain) UIImageView *imageView;

@property (nonatomic , retain) UIImageView *imageViewTitle;

//@property (nonatomic , retain) UIScrollView *scroller;

@property (nonatomic, retain) UICollectionView *collection;

@property (nonatomic , retain) UICollectionViewFlowLayout *layout;

@end
