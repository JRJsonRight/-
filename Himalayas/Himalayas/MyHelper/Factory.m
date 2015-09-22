//
//  Factory.m
//  StopWatchDemo
//
//  Created by qianfeng on 15/7/31.
//  Copyright (c) 2015年 姜奎. All rights reserved.
//

#import "Factory.h"
#import "NSString+Hashing.h"
@implementation Factory

+ (UIButton *)createButton_WithTitle:(NSString *)title
                              frame:(CGRect)frame
                             target:(id)target
                           selector:(SEL)selector {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    
//    button.layer.cornerRadius = 3.f;
//    button.layer.masksToBounds = YES;
    
    button.backgroundColor = [UIColor colorWithRed:0.3 green:0.8f blue:1.f alpha:1.f];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return button;
}
+ (UIButton *)creatButton_WithFrame:(CGRect)frame target:(id)target sel:(SEL)sel tag:(NSInteger)tag image:(NSString *)name title:(NSString *)title{
    UIButton *button = nil;
    if (name) {
        //创建图片按钮
        //创建背景图片 按钮
        button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
        if (title) {//图片标题按钮
            [button setTitle:title forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
        }
        
    }else if (title) {
        //创建标题按钮
        button = [UIButton buttonWithType:UIButtonTypeSystem];
        [button setTitle:title forState:UIControlStateNormal];
    }
    
    button.frame = frame;
    button.tag = tag;
    [button addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    return button;
}
+ (UILabel *)createLabel_WithTitle:(NSString *)title frame:(CGRect)frame {
    return [self createLabel_WithTitle:title frame:frame fontSize:14.f];
}

+ (UILabel *)createLabel_WithTitle:(NSString *)title frame:(CGRect)frame textColor:(UIColor *)color {
    return [self createLabel_WithTitle:title frame:frame textColor:color fontSize:14.f];
}

+ (UILabel *)createLabel_WithTitle:(NSString *)title frame:(CGRect)frame fontSize:(CGFloat)size {
    return [self createLabel_WithTitle:title frame:frame textColor:[UIColor blackColor] fontSize:size];
}

+ (UILabel *)createLabel_WithTitle:(NSString *)title frame:(CGRect)frame textColor:(UIColor *)color fontSize:(CGFloat)size {
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = title;
    label.textColor = color;
    label.font = [UIFont systemFontOfSize:size];
    //return [label autorelease];
    return label;
}

+ (UIView *)createView_WithBackgroundColor:(UIColor *)color frame:(CGRect)frame {
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = color;
    //return [view autorelease];
    return view;
}

+ (UITextField *)createTextField_WithText:(NSString *)text frame:(CGRect)frame placeholder:(NSString *)placeholder textColor:(UIColor *)color borderStyle:(UITextBorderStyle)borderStyle {
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    textField.placeholder = placeholder;
    textField.borderStyle = borderStyle;
    textField.text = text;
    textField.textColor = color;
    //return [textField autorelease];
    return textField;
}
+ (NSString *)dateStringFromNumberTimer:(NSString *)timerStr {
    //转化为Double
    double t = [timerStr doubleValue];
    //计算出距离1970的NSDate
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:t];
    //转化为 时间格式化字符串
    NSDateFormatter *df = [[NSDateFormatter alloc] init] ;
    df.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    //转化为 时间字符串
    return [df stringFromDate:date];
}
+(NSTimeInterval)timeIntervalFormWithDate:(NSDate*)date{
    NSTimeInterval time=0;
    if (!date) {
        NSDate *today = [NSDate date];
        time=[today timeIntervalSince1970];
    }else{
        time=[date timeIntervalSince1970];
    }
    return time;
}

//动态 计算行高
//根据字符串的实际内容的多少 在固定的宽度和字体的大小，动态的计算出实际的高度
+ (CGFloat)textHeightFromTextString:(NSString *)text width:(CGFloat)textWidth fontSize:(CGFloat)size{
    if ([Factory getCurrentIOS] >= 7.0) {
        //iOS7之后
        /*
         第一个参数: 预设空间 宽度固定  高度预设 一个最大值
         第二个参数: 行间距 如果超出范围是否截断
         第三个参数: 属性字典 可以设置字体大小
         */
        NSDictionary *dict = @{NSFontAttributeName:[UIFont systemFontOfSize:size]};
        CGRect rect = [text boundingRectWithSize:CGSizeMake(textWidth, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
        //返回计算出的行高
        return rect.size.height;
        
    }else {
        //iOS7之前
        /*
         1.第一个参数  设置的字体固定大小
         2.预设 宽度和高度 宽度是固定的 高度一般写成最大值
         3.换行模式 字符换行
         */
        CGSize textSize = [text sizeWithFont:[UIFont systemFontOfSize:size] constrainedToSize:CGSizeMake(textWidth, MAXFLOAT) lineBreakMode:NSLineBreakByCharWrapping];
        return textSize.height;//返回 计算出得行高
    }
}

//获取iOS版本号
+ (double)getCurrentIOS {
    return [[[UIDevice currentDevice] systemVersion] doubleValue];
}
+ (CGSize)getScreenSize {
    return [[UIScreen mainScreen] bounds].size;
}
//获得当前系统时间到指定时间的时间差字符串,传入目标时间字符串和格式
+(NSString*)stringNowToDate:(NSString*)toDate formater:(NSString*)formatStr
{
    
    NSDateFormatter *formater=[[NSDateFormatter alloc] init];
    if (formatStr) {
        [formater setDateFormat:formatStr];
    }
    else{
        [formater setDateFormat:[NSString stringWithFormat:@"yyyy-MM-dd HH:mm:ss"]];
    }
    NSDate *date=[formater dateFromString:toDate];
    
    return [self stringNowToDate:date];
    
}


//获得到指定时间的时间差字符串,格式在此方法内返回前自己根据需要格式化
+(NSString*)stringNowToDate:(NSDate*)toDate
{
    //创建日期 NSCalendar对象
    NSCalendar *cal = [NSCalendar currentCalendar];
    //得到当前时间
    NSDate *today = [NSDate date];
    
    //用来得到具体的时差,位运算
    unsigned int unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit ;
    
    if (toDate && today) {//不为nil进行转化
        NSDateComponents *d = [cal components:unitFlags fromDate:today toDate:toDate options:0 ];
        
        //NSString *dateStr=[NSString stringWithFormat:@"%d年%d月%d日%d时%d分%d秒",[d year],[d month], [d day], [d hour], [d minute], [d second]];
        NSString *dateStr=[NSString stringWithFormat:@"%02ld:%02ld:%02ld",[d hour], [d minute], [d second]];
        return dateStr;
    }
    return @"";
}

//获取 一个文件 在沙盒Library/Caches/ 目录下的路径
+ (NSString *)getFullPathWithFile:(NSString *)urlName {
    
    //先获取 沙盒中的Library/Caches/路径
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSString *myCacheDirectory = [docPath stringByAppendingPathComponent:@"MyCaches"];
    //检测MyCaches 文件夹是否存在
    if (![[NSFileManager defaultManager] fileExistsAtPath:myCacheDirectory]) {
        //不存在 那么创建
        [[NSFileManager defaultManager] createDirectoryAtPath:myCacheDirectory withIntermediateDirectories:YES attributes:nil error:nil];
    }
    //用md5进行 加密 转化为 一串十六进制数字 (md5加密可以把一个字符串转化为一串唯一的用十六进制表示的串)
    NSString * newName = [urlName MD5Hash];
    
    //拼接路径
    return [myCacheDirectory stringByAppendingPathComponent:newName];
}
//检测 缓存文件 是否超时
+ (BOOL)isTimeOutWithFile:(NSString *)filePath timeOut:(double)timeOut {
    //获取文件的属性
    NSDictionary *fileDict = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:nil];
    //获取文件的上次的修改时间
    NSDate *lastModfyDate = fileDict.fileModificationDate;
    //算出时间差 获取当前系统时间 和 lastModfyDate时间差
    NSTimeInterval sub = [[NSDate date] timeIntervalSinceDate:lastModfyDate];
    if (sub < 0) {
        sub = -sub;
    }
    //比较是否超时
    if (sub > timeOut) {
        //如果时间差 大于 设置的超时时间 那么就表示超时
        return YES;
    }
    return NO;
}
//将汉字转换成UTF-8码
+(NSString*)stringFromUTFStringWithText:(NSString*)text{

    return [text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}
//将UTF-8码转换成oc字符串
+(NSString*)utfStringFromObjectStringWithText:(NSString*)text{

    return [text stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

@end







