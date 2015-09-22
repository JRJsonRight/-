//
//  TopBar.h
//  Himalayas
//
//  Created by qianfeng on 15/9/22.
//  Copyright (c) 2015年 姜奎. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopBar : UIView
- (IBAction)goBackView:(id)sender;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@end
