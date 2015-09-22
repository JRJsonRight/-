//
//  BaseViewController.m
//  UIViewController2
//
//  Created by qianfeng on 15/7/31.
//  Copyright (c) 2015年 姜奎. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //添加视图
    [self createView];
    //初始化数据
    [self initData];
    //添加行为
    [self addTouchAction];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//创建视图
- (void)createView {
    //不做实现，只是为了使用方便
}

- (void)toNextView {
    
}

//初始化数据源
- (void)initData {
    //不做实现，只是为了使用方便
}

//添加事件
- (void)addTouchAction {
    //不做实现，只是为了使用方便
}

//创建上导航左侧按钮(以view作模板)
- (void)createNavigationLeftButton:(id)view {
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:view];
    self.navigationItem.leftBarButtonItem = leftItem;
    //Release_Safe(leftItem);
}

//创建上导航左侧按钮(系统标题)
- (void)createNavigationLeftButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action {
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:target action:action];
    self.navigationItem.leftBarButtonItem = leftItem;
    //Release_Safe(leftItem);
}

//创建上导航右侧按钮(以view作模板)
- (void)createNavigationRightButton:(id)view {
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:view];
    self.navigationItem.rightBarButtonItem = rightItem;
    //Release_Safe(rightItem);
}

//创建上导航右侧按钮(系统标题)
- (void)createNavigationRightButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action {
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:target action:action];
    self.navigationItem.rightBarButtonItem = rightItem;
    //Release_Safe(rightItem);
}

- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)addTitleViewWithName:(NSString *)name {
    UILabel *label = [Factory createLabel_WithTitle:name frame:CGRectMake(0, 0, 150, 30)];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    //设置自己的标题视图
    self.navigationItem.titleView = label;
}
- (void)addItemsWithCustomViews:(NSArray *)arr isLeft:(BOOL)isLeft {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    for (UIView *view in arr) {
        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:view];
        [items addObject:item];
    }
    //判断
    if (isLeft) {
        self.navigationItem.leftBarButtonItems = items;
    }else {
        self.navigationItem.rightBarButtonItems = items;
    }
}
@end





