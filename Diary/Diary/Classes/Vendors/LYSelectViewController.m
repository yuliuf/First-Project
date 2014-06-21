//
//  LYSelectViewController.m
//  Diary
//
//  Created by liuyu on 14-6-18.
//  Copyright (c) 2014年 lanou3g. All rights reserved.
//

#import "LYSelectViewController.h"
#define VIEW_ORIGIN_X 10
#define VIEW_ORIGIN_Y 70
#define BUTTOM_MARGIN 20
#define TOP_MARGIN 21
#define MARGIN_X 10
#define MARGIN_Y 10

#define BTN_W_H 48
#define ONE_ROW_ICON 5
#define BUTTON_COUNT 20


@interface LYSelectViewController ()

{
//    UIButton *_btn[BUTTON_COUNT];

}

@end

@implementation LYSelectViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _iconArray = [NSArray new];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    _iconArray =[NSArray arrayWithObjects:
//           @"plan_rest.png",
//           @"plan_train.png",
//           @"plan_structure.png",
//           @"plan_nature.png",
//           @"plan_walk.png",
//           @"plan_shopping.png",
//           @"plan_eat.png",
//           @"plan_plane.png",
//           @"plan_sports.png",
//           @"plan_nature.png",
//           @"plan_walk.png",
//           @"plan_shopping.png",
//           
//           
//           @"plan_structure.png",nil];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(100 ,100, 30, 30);
    [button setTitle:@"测试" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(changeIcon:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

    
//    [self viewDetail];
//    [self loadImage];
}

//- (void)viewDetail
//{
//    int x = 0;
//    
//    if([_iconArray count] % ONE_ROW_ICON != 0)
//        x = [_iconArray count]/ONE_ROW_ICON + 1;
//    else
//        x = [_iconArray count]/ONE_ROW_ICON ;
//    
//    self.view = [[UIView alloc] initWithFrame:Rect(self.point.x, self.point.y, (MARGIN_X+BTN_W_H)*ONE_ROW_ICON+MARGIN_X, BUTTOM_MARGIN + (BTN_W_H+MARGIN_Y)*x)];
//    self.view.backgroundColor = [UIColor redColor];
//    UIImage *backgroundImage = [UIImage imageNamed:@"balloon.png"];
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:backgroundImage];
//    imageView.frame = Rect(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
//    [self.view addSubview:imageView];
////    [self.view setBackgroundColor:[UIColor colorWithPatternImage:backgroundImage]];
//    self.view.layer.cornerRadius = 5;
//}
//
//-(void)loadImage{
//    
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
//    button.frame = CGRectMake(100 ,100, 30, 30);
//    [button setTitle:@"测试" forState:UIControlStateNormal];
//    [button addTarget:self action:@selector(changeIcon:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:button];
//    
////    int index = 0;
////    int row = 0;
////    int count = 0;
////    for (NSString *tmpStr in _iconArray){
////        
////        if(count<_iconArray.count){
////            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
////            [btn setFrame:CGRectMake((index+1)*MARGIN_X+index*BTN_W_H,TOP_MARGIN+(MARGIN_Y+BTN_W_H)*row, BTN_W_H, BTN_W_H)];
////            [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[_iconArray objectAtIndex:count]]] forState:UIControlStateNormal];
////            [btn addTarget:self action:@selector(changeIcon:) forControlEvents:UIControlEventTouchUpInside];
////            [btn setTag:count];
////            [self.view addSubview:btn];
////            
////            index++;
////            count++;
////            
////            if(index%ONE_ROW_ICON == 0){
////                row++;
////                index = 0;
////            }
////        }
////        
////    }
//    
//}

- (void)changeIcon:(UIButton *)sender
{
    NSLog(@"1111");
}
- (void)buttonAction:(UIButton *)sender
{
//    NSLog(@"%d", sender.tag);
////    [_selectBtn setBackgroundImage:<#(UIImage *)#> forState:<#(UIControlState)#>]
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
