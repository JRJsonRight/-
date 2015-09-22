//
//  BaseViewController.h
//  UIViewController2
//
//  Created by qianfeng on 15/7/31.
//  Copyright (c) 2015年 姜奎. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Addition.h"
#import "Factory.h"
#import "MyHelper.h"

@interface BaseViewController : UIViewController

//创建视图
- (void)createView;
//初始化数据源
- (void)initData;
//添加事件
- (void)addTouchAction;
//创建上导航左侧按钮(以view作模板)
- (void)createNavigationLeftButton:(id)view;
//创建上导航的左侧按钮(系统标题)
- (void)createNavigationLeftButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action;
//创建上导航右侧按钮(以view作模板)
- (void)createNavigationRightButton:(id)view;
//创建上导航的右侧按钮(系统标题)
- (void)createNavigationRightButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action;
//使用pop返回
- (void)backAction;
//父类实现 子类调用
- (void)addTitleViewWithName:(NSString *)name;

- (void)addItemsWithCustomViews:(NSArray *)arr isLeft:(BOOL)isLeft;

@end










