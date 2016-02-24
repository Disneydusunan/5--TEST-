//
//  RootViewController.m
//  tabBar test
//
//  Created by 谢谦 on 16/2/24.
//  Copyright © 2016年 杜苏南. All rights reserved.
//

#import "RootViewController.h"
#import "FifthViewController.h"
#import "SecondViewController.h"
#import "FirstViewController.h"
#import "ThirdViewController.h"
#import "ForthViewController.h"

#define kScreenWidth     [UIScreen mainScreen].bounds.size.width
#define kScreenHeight     [UIScreen mainScreen].bounds.size.height
#define kTabbarViewHeight 49

CGFloat const btnWidth = 64;
CGFloat const btnHeight = 49;

@interface RootViewController ()


@property (nonatomic,strong)UIImageView *selectView;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor greenColor];
    self.tabBar.hidden = YES;
    [self initViewControllers];
    
    [self initTabbarView];
    // Do any additional setup after loading the view.
}
-(void)initViewControllers
{
    FirstViewController *first = [[FirstViewController alloc]init];
    SecondViewController *second = [[SecondViewController alloc]init];
    ThirdViewController *third = [[ThirdViewController alloc]init];
    ForthViewController *forth = [[ForthViewController alloc]init];
    FifthViewController *fifth = [[FifthViewController alloc]init];
    
    NSArray *arrControllers = @[fifth,first,second,third,forth];
    NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:arrControllers.count];
    
    for (int i =0 ; i<arrControllers.count; i++) {
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:arrControllers[i]];
        [arrM addObject:nav];
    }
    self.viewControllers = arrM;
}

-(void)initTabbarView{

    _tabbarView = [[UIView alloc]initWithFrame:CGRectMake(0, kScreenHeight - kTabbarViewHeight, kScreenWidth, kTabbarViewHeight)];
    _tabbarView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"mask_navbar"]];
    [self.view addSubview:_tabbarView];
    
    NSArray *imgArray = @[@"home_tab_icon_1",@"home_tab_icon_2",@"home_tab_icon_3",@"home_tab_icon_4",@"home_tab_icon_5"];
    for (int i = 0; i<imgArray.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundImage:[UIImage imageNamed:imgArray[i]] forState:UIControlStateNormal];
        button.frame = CGRectMake(btnWidth*i, (kTabbarViewHeight - btnHeight)/2, btnWidth, btnHeight);
        button.tag = 100+i;
        
        [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.tabbarView addSubview:button];
    }
    self.selectView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, btnWidth, btnHeight)];
    self.selectView.image = [UIImage imageNamed:@"home_bottom_tab_arrow"];
    [self.tabbarView addSubview:self.selectView];
}

-(void)btnClick:(UIButton *)btn
{
    self.selectedIndex = btn.tag - 100;
    
    [UIView animateWithDuration:0.2 animations:^{
        self.selectView.center = btn.center;
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
