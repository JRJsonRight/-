//
//  TabbarViewController.m
//  Himalayas
//
//  Created by qianfeng on 15/9/21.
//  Copyright (c) 2015年 姜奎. All rights reserved.
//

#import "TabbarViewController.h"
#import "MainViewController.h"
#import "MineViewController.h"
#import "DownViewController.h"
#import "HandWorkViewController.h"
#import "MusicViewController.h"
@interface TabbarViewController ()<UITabBarControllerDelegate>
@property(nonatomic,strong)UIButton*btn;
@end

@implementation TabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createView];
}
-(void)createView{
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tomorrow_back_bg.jpg"]];

    MainViewController*main=[[MainViewController alloc]init];
    UINavigationController*nvc=[[UINavigationController alloc]initWithRootViewController:main];
    HandWorkViewController*hvc=[[HandWorkViewController alloc]init];
    UINavigationController*nvc1=[[UINavigationController alloc]initWithRootViewController:hvc];
    DownViewController*dvc=[[DownViewController alloc]init];
    UINavigationController*nvc2=[[UINavigationController alloc]initWithRootViewController:dvc];
    MineViewController*mvc=[[MineViewController alloc]init];
    UINavigationController*nvc3=[[UINavigationController alloc]initWithRootViewController:mvc];
    MusicViewController*music=[[MusicViewController alloc]init];
    
    UITabBarItem*item=[[UITabBarItem alloc]initWithTitle:@"发现" image:[UIImage imageNamed: @"tab4"] selectedImage:[[UIImage imageNamed: @"tab4_down"] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)]];
    UITabBarItem*item1=[[UITabBarItem alloc]initWithTitle:@"定制听" image:[UIImage imageNamed: @"tab1"] selectedImage:[[UIImage imageNamed: @"tab1_down"]imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal) ]];
    UITabBarItem*item2=[[UITabBarItem alloc]initWithTitle:@"下载听" image:[UIImage imageNamed: @"tab2"] selectedImage:[[UIImage imageNamed: @"tab2_down"]imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal) ]];
    UITabBarItem*item3=[[UITabBarItem alloc]initWithTitle:@"我" image:[UIImage imageNamed: @"tab5"] selectedImage:[[UIImage imageNamed: @"tab5_down"]imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal) ]];
 
    UITabBarItem*item4=[[UITabBarItem alloc]initWithTitle:nil image:[[UIImage imageNamed: @"play_icon_new"] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)] selectedImage:[[UIImage imageNamed: @"play_icon_new"]imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal) ]];
    music.view.backgroundColor=[UIColor grayColor];
    self.tabBar.hidden=YES;
    UITabBar*tabbar=[[UITabBar alloc]initWithFrame:CGRectMake(0, self.view.height-49, self.view.width, 49)];
    item.tag=1;
    item1.tag=2;
    item2.tag=3;
    item3.tag=4;
    item4.tag=5;
    tabbar.delegate=self;
    tabbar.items=@[item,item1,item4,item2,item3];
    [self.view addSubview:tabbar];
    self.tabBarController.delegate=self;
    self.viewControllers=@[nvc,nvc1,nvc2,nvc3];
}
-(void)pressChange:(id)sender
{
    self.selectedIndex=2;
    self.btn.selected=YES;
}

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    if (item.tag==5) {
       MusicViewController*music=[[MusicViewController alloc]init];
        
        CATransition*anime=[CATransition animation];
        [anime setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
        anime.duration=2;
        anime.type=kCATransitionPush;
        anime.subtype=kCATransitionFromTop;
        [self.view.layer addAnimation:anime forKey:nil];
        [self presentViewController:music animated:YES completion:nil];
//            CATransition *anima = [CATransition animation];
//            /*
//             *  动画的开始与结束的快慢,有五个预置分别为(下同):
//             *  kCAMediaTimingFunctionLinear            线性,即匀速
//             *  kCAMediaTimingFunctionEaseIn            先慢后快
//             *  kCAMediaTimingFunctionEaseOut           先快后慢
//             *  kCAMediaTimingFunctionEaseInEaseOut     先慢后快再慢
//             *  kCAMediaTimingFunctionDefault           实际效果是动画中间比较快.
//             */
//            [anima setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
//            
//            
//            //设置动画时间
//            anima.duration = 5;
//            
//            //@"cube"－ 立方体效果  @"suckEffect"－收缩效果，如一块布被抽走   @"oglFlip"－上下翻转效果   @"rippleEffect"－滴水效果  @"pageCurl"－向上翻一页  @"pageUnCurl"－向下翻一页 @"rotate" 旋转效果 @"cameraIrisHollowOpen"     相机镜头打开效果(不支持过渡方向)  @"cameraIrisHollowClose"    相机镜头关上效果(不支持过渡方向)
//            //动画类型
//            //kCATransitionFade    新视图逐渐显示在屏幕上，旧视图逐渐淡化出视野
//            //kCATransitionMoveIn  新视图移动到旧视图上面，好像盖在上面
//            //kCATransitionPush    新视图将旧视图退出去
//            //kCATransitionReveal  将旧视图移开显示下面的新视图
//            
//            anima.type = kCATransitionPush;
//            //    anima.type = @"suckEffect";
//            //各种动画方向
//            /*  当type为@"rotate"(旋转)的时候,它也有几个对应的subtype,分别为:
//             *  90cw    逆时针旋转90°
//             *  90ccw   顺时针旋转90°
//             *  180cw   逆时针旋转180°
//             *  180ccw  顺时针旋转180°
//             */
//            
//            //    anima.subtype = @"90ccw";
//            //    anima.subtype = @"fromRight";
//            anima.subtype = kCATransitionFromTop;
//            //放到 导航的view 的layer   两个子视图控制器的view 都在 导航的view上
//            [self.view.layer addAnimation:anima forKey:nil];
      
    }else{
    self.selectedIndex=item.tag-1;
    }
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
