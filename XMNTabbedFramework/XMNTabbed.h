//
//  XMNTabbed.h
//  XMNTabbedViewExample
//
//  Created by XMFraker on 16/9/19.
//  Copyright © 2016年 XMFraker. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XMNTabbedButton;
@interface XMNTabbed : NSObject

/** 显示的文本内容 */
@property (copy, nonatomic, nonnull)   NSString *title;

/** 字体颜色   默认[UIColor whiteColor] */
@property (strong, nonatomic, nonnull) UIColor *titleColor;

/** 高亮字体颜色   默认[UIColor whiteColor] */
@property (strong, nonatomic, nonnull) UIColor *highlightTitleColor;

/** 标题字体   默认[UIFont systemFontOfSize:12.f] */
@property (strong, nonatomic, nonnull) UIFont *titleFont;

/** 背景色 默认RGB(1,193,245) */
@property (strong, nonatomic, nonnull) UIColor *backgroundColor;

/** 高亮背景色 默认RGB(1,193,245)*/
@property (strong, nonatomic, nonnull) UIColor *highlightBackgroundColor;

/** tabbed的圆角大小 默认4.f*/
@property (assign, nonatomic) CGFloat cornerRadius;

/** tabbed的内部间距 默认UIEdgeInsetsMake(4, 8, 4, 8) */
@property (assign, nonatomic) UIEdgeInsets contentInset;

/** 关联的tabbedButton按钮 */
@property (weak, nonatomic, nullable)   XMNTabbedButton *button;


- (instancetype __nonnull)init NS_UNAVAILABLE;

/**
 推荐初始化方法

 @param title 显示标题
 @return 初始化实例
 */
- (instancetype __nonnull)initWithTitle:(NSString * __nonnull)title NS_DESIGNATED_INITIALIZER;


/**
 Class 初始化方法

 @param title 显示标题
 @return 实例
 */
+ (instancetype __nonnull)tabbedWithTitle:(NSString * __nonnull)title;

@end
