//
//  YCDiaryViewController.m
//  HappyDiary
//
//  Created by 孙震 on 14-6-20.
//  Copyright (c) 2014年 lanou3g. All rights reserved.
//

#import "YCDiaryViewController.h"
#import "LYDiaryView.h"
#import "lxyCommonDiaryModel.h"
#define BTN_SIZE 44

@interface YCDiaryViewController ()

- (void)initArrays;
- (void)tapGRAction:(UITapGestureRecognizer *)sender;
- (void)toolButtonAction:(UIButton *)sender;
- (void)buttonClicked:(UIButton *)button;

@end


@interface YCDiaryViewController ()
@property (nonatomic, retain) LYDiaryView *diaryView;  //  自定义视图
@property (nonatomic, retain) HYActivityView *wether_activityView;  //  第三方 天气选择
@property (nonatomic, retain) HYActivityView *activityView;  //  第三方 天气选择
@property (nonatomic, retain) lxyCommonDiaryModel *diary; //  普通日记模型
@property (nonatomic, assign) BOOL isKeyBoardVisible;  //  键盘是否可见
@property (nonatomic, retain) NSArray *weatherArray;  // 天气数组
@property (nonatomic, retain) NSArray *toolArray;   //  工具数组
@property (nonatomic, retain) LYToolView *toolView;  //  工具选择框
@property (nonatomic, retain) NSArray *duiqiArray;  //  文本对齐方式
@property (nonatomic, retain) NSArray *backgroundImage; //  信纸
@property (nonatomic, retain) NSArray *textColorArray;  //  文本颜色
@property (nonatomic, retain) NSArray *eventIconArray;  //  事件图标

@end

@implementation YCDiaryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
          self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"日记" image:[UIImage imageNamed:@"diary"] tag:1];
        [self initArrays];
    }
    return self;
}
- (void)loadView
{
    self.diaryView = [[[LYDiaryView alloc] initWithFrame:[UIScreen mainScreen].bounds] autorelease];
    
    self.view = self.diaryView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // 天气按钮添加事件
    [self.diaryView.weatherBtn sizeToFit];
    [self.diaryView.weatherBtn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    //  不知道这两行干吗用
//    self.diaryView.weatherBtn.translatesAutoresizingMaskIntoConstraints = NO;
//    [self.diaryView setNeedsUpdateConstraints];
    
    //  轻拍手势添加事件
    [self.diaryView.tapGR addTarget:self action:@selector(tapGRAction:)];
    
    // 工具按钮事件
    [self.diaryView.toolButton addTarget:self action:@selector(toolButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //  滑动条添加事件
    [self.diaryView.slider addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventTouchUpInside];
  
    
}

#pragma mark 隐藏导航栏上方系统时间、电池显示
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark 初始化数组
- (void)initArrays
{
    // 天气
    self.weatherArray = @[@"weather_cloudy", @"weather_snow", @"weather_thunder", @"weather_cloudy_later_rain", @"weather_cloudy_sometimes_snow", @"weather_rain", @"weather_sunny_sometimes_thunder_noon"];
    //  工具框
    self.toolArray = @[@"textColor",@"duiqi", @"photo", @"tuya",@"background"];
    //  字体颜色
    self.textColorArray = @[];
    //  文本对齐方式
    self.duiqiArray = @[@"deco_text_align_center", @"deco_text_align_left", @"deco_text_align_right"];
    //  信纸（背景图片）
    self.backgroundImage = @[@"deco_bg_popup_check10", @"deco_bg_popup_check11", @"deco_bg_popup_check12", @"deco_bg_popup_check13", @"deco_bg_popup_check14", @"deco_bg_popup_check15", @"deco_bg_popup_check16", @"deco_bg_popup_check17", @"deco_bg_popup_stripe15", @"deco_bg_popup_stripe17"];
    //  事件图标
    self.eventIconArray = @[@"event_icon0", @"event_icon1", @"event_icon2", @"event_icon3", @"event_icon4", @"event_icon5", @"event_icon6", @"event_icon7", @"event_icon8", @"event_icon9", @"event_icon10", @"event_icon11", @"event_icon11", @"event_icon12", @"event_icon13", @"event_icon14", @"event_icon15", @"event_icon16", @"event_icon17", @"event_icon18", @"event_icon19", @"event_icon20", @"event_icon21", @"event_icon22", @"event_icon23", @"event_icon24", @"event_icon25", @"event_icon26", @"event_icon27", @"event_icon27", @"event_icon28", @"event_icon29"];

}

#pragma mark 滑动改变背景的透明度
- (void)sliderAction:(UISlider *)sender
{
    NSLog(@"改变透明度");
}

#pragma mark 选择天气按钮事件
- (void)buttonClicked:(UIButton *)button
{
    
    if (!self.wether_activityView) {
        self.wether_activityView = [[HYActivityView alloc]initWithTitle:@"天气" referView:self.diaryView];
        
        //横屏会变成一行6个, 竖屏无法一行同时显示6个, 会自动使用默认一行4个的设置.
        self.wether_activityView.numberOfButtonPerLine = 6;
        
        for (int i = 0; i < _eventIconArray.count; i ++) {
            
            ButtonView *bv = [[ButtonView alloc]initWithText:nil image:[UIImage imageNamed:_eventIconArray[i]] handler:^(ButtonView *buttonView){
                [self.diaryView.weatherBtn setBackgroundImage:[UIImage imageNamed:_eventIconArray[i]] forState:UIControlStateNormal];
            }];
//            self.diary.weather = _weatherArray[i];
            [self.wether_activityView addButtonView:bv];
        }
        
    }
    [self.wether_activityView show];
    
}

#pragma mark 轻拍手势事件  收回键盘
- (void)tapGRAction:(UITapGestureRecognizer *)sender
{
    if (_isKeyBoardVisible == YES) {
        [self.diaryView.content endEditing:YES];
    } else {
        [self.diaryView.content becomeFirstResponder];
    }
    
}

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~工具框相关~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#pragma mark 工具按钮事件
- (void)toolButtonAction:(UIButton *)sender
{
    self.toolView = [[LYToolView alloc] initWithTitle:@"工具" withFrame:Rect(edgeMagin, kMargin, ScreenWidth - 2 *edgeMagin, 80)];
    [self addToolButtons];
    [_toolView.closeBtn addTarget:self action:@selector(closeToolView:) forControlEvents:UIControlEventTouchUpInside];
    self.toolView.alpha = 0.f;
    [self.diaryView addSubview:_toolView];
    
    
    //  过渡动画
    CATransition *transition = [CATransition animation];
    //  设置动画时间
    transition.duration = 0.3;
    //  设置动画样式
    transition.type = @"moveIn";
    //  设置动画方法
    transition.subtype = kCATransitionFromBottom;
    self.toolView.alpha = 1.f;
    //  添加动画到views
    [self.toolView.layer addAnimation:transition forKey:@"transition"];
    
    
    
}
- (void)closeToolView:(UIButton *)sender
{
    //  过渡动画
    CATransition *transition = [CATransition animation];
    //  设置动画时间
    transition.duration = 0.3;
    //  设置动画样式
    transition.type = @"reveal";
    //  设置动画方法
    transition.subtype = kCATransitionFromTop;
    self.toolView.alpha = 0.f;
    //  添加动画到views
    [self.toolView.layer addAnimation:transition forKey:@"transition"];
    
//    [self.toolView removeFromSuperview];
}

- (void)addToolButtons
{
    for (int i = 0; i < _toolArray.count; i ++) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        btn.frame = CGRectMake(10 * (i + 1) +  BTN_SIZE * i, 30, BTN_SIZE, BTN_SIZE);
        btn.tag = 20 + i;
        [btn setBackgroundImage:[UIImage imageNamed:_toolArray[i]] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(toolAction:) forControlEvents:UIControlEventTouchUpInside];
        [_toolView addSubview:btn];

    
}
}

- (void)toolAction:(UIButton *)sender
{
    
    
    switch (sender.tag) {
        case 20:
            [self selectView:@"字体颜色" :self.textColorArray];
            break;
        case 21:
            [self selectView:@"文本对齐" :self.duiqiArray];
            break;
        case 22:
        case 23:
            [self selectView:@"涂鸦" :self.weatherArray];
            break;
        case 24:
            [self selectView:@"信纸" :self.backgroundImage];
            break;
            
        default:
            break;
    }
    
}


- (void)selectView:(NSString *)title : (NSArray *)array
{
        self.activityView = [[HYActivityView alloc]initWithTitle:title referView:self.view];
        
        //横屏会变成一行6个, 竖屏无法一行同时显示6个, 会自动使用默认一行4个的设置.
        self.activityView.numberOfButtonPerLine = 6;
        
        //        self.weatherArray = @[@"weather_cloudy", @"weather_snow", @"weather_thunder", @"weather_cloudy_later_rain", @"weather_cloudy_sometimes_snow", @"weather_rain", @"weather_sunny_sometimes_thunder_noon"];
        
        for (int i = 0; i < array.count; i ++) {
            
            ButtonView *bv = [[ButtonView alloc]initWithText:nil image:[UIImage imageNamed:array[i]] handler:^(ButtonView *buttonView){
                if ([title isEqualToString:@"信纸"]) {
//                    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:array[i]]];
//                    imageView.frame = Rect(0, 0, Width(_diaryView.content.frame), Height(_diaryView.content.frame));
//                    [self.diaryView.content addSubview:imageView];
                    [self.diaryView.content setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:array[i]]]];
//                    [self.diaryView.content setBackgroundColor:myBlue];
                }
            }];
            [self.activityView addButtonView:bv];
        }
    
    [self.activityView show];

}

//~~~~~~~~~~~~~~~~~~~~~~~键盘弹起与回收~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#pragma mark 监听键盘的高度 设置content的偏移量
- (void)viewWillAppear:(BOOL)animated
{
    //注册通知，监听键盘出现
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(handleKeyboardDidShow:)
                                                name:UIKeyboardDidShowNotification
                                              object:nil];
    //注册通知，监听键盘消失事件
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(handleKeyboardDidHidden)
                                                name:UIKeyboardDidHideNotification
                                              object:nil];
    [super viewWillAppear:animated];
    
    
}

#pragma mark 页面消失时释放观察者
-(void)viewWillDisappear:(BOOL)animated
{
    //解除键盘出现通知
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name: UIKeyboardDidShowNotification object:nil];
    //解除键盘隐藏通知
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name: UIKeyboardDidHideNotification object:nil];
    [super viewWillDisappear:animated];
    
}

#pragma mark 页面已经消失
-(void)viewDidDisappear:(BOOL)animated
{
    [[self view]endEditing:YES];
    
    //将修改包装成对象插入到数据库表中
    _diary.content = self.diaryView.content.text;
    _diary.time = self.diaryView.timeLabel.text;
    _diary.backGroundImage = nil;
    _diary.mood = nil;
    NSMutableArray *arr = [lxyFunctionOfDataBase searchAllDataInTable:@"commonDiaryTable"];
    
    NSInteger index = arr.count;
    _diary.ID = [NSString stringWithFormat:@"%d", index];
    
    [lxyFunctionOfDataBase insertToTabel:@"commonDiaryTable" withObject:_diary];
    
    lxyCommonDiaryModel *model = [lxyFunctionOfDataBase searchOneDataFromTable:@"commonDiaryTable" byID:0 orAlonePersonModelName:nil orCommonDiaryModelTime:self.diaryView.timeLabel.text];
    NSLog(@"content:%@", model.content);
    
}
#pragma mark 唤起键盘后事件 textView高度 - 键盘高度
-(void)handleKeyboardDidShow:(NSNotification *)notification
{
    _isKeyBoardVisible = YES;
    
    CGRect endRect = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    NSLog(@"keyboard frame = %@",NSStringFromCGRect(endRect));
    
    //  具体数量关系还得弄清楚 这里的30是凑出来的
    CGRect newFrame = Rect(edgeMagin * 2, MaxY(self.diaryView.timeLabel.frame) + kMargin, ScreenWidth - edgeMagin * 4, ScreenHeight - MaxY(self.diaryView.timeLabel.frame) - 30 - endRect.size.height);
    self.diaryView.content.frame = newFrame;
    
}
#pragma mark 收回键盘后事件  把textView恢复原状
-(void)handleKeyboardDidHidden
{
    _isKeyBoardVisible = NO;
    [UIView beginAnimations:@"move" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.4f];
    CGRect newFrame = Rect(edgeMagin * 2, MaxY(_diaryView.timeLabel.frame) + kMargin, ScreenWidth - edgeMagin * 4, ScreenHeight - MaxY(_diaryView.timeLabel.frame) - 130);
    self.diaryView.content.frame = newFrame;
    [UIView commitAnimations];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
