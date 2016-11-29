//
//  XMNTabbedView.h
//  XMNTabbedViewExample
//
//  Created by XMFraker on 16/9/19.
//  Copyright © 2016年 XMFraker. All rights reserved.
//

#import <UIKit/UIKit.h>



/** tabbedView对齐方式 */
typedef NS_ENUM(NSUInteger, XMNTabbedViewAlignment) {
    
    /** 默认左对齐 */
    XMNTabbedViewAlignmentLeft = 0,
    /** 默认右对齐 */
    XMNTabbedViewAlignmentRight
};

IB_DESIGNABLE
@class XMNTabbed;
@interface XMNTabbedView : UIView

/** 行间距  默认8.f */
@property (assign, nonatomic) IBInspectable CGFloat lineSpace;

/** 列间距  默认4.f */
@property (assign, nonatomic) IBInspectable CGFloat rowSpace;

/** 内容间距  默认UIEdgeInsetMake(8,8,8,8) */
@property (assign, nonatomic) IBInspectable UIEdgeInsets contentInset;
/** 对齐方式  默认XMNTabbedViewAlignmentLeft */
@property (assign, nonatomic) XMNTabbedViewAlignment alignment;
/** tabbedView 的最大宽度 默认为bounds.size.width */
@property (assign, nonatomic) IBInspectable CGFloat preferIntrinsicWidth;

/** 当前已经添加的tabbeds */
@property (strong, nonatomic, readonly, nullable) NSMutableArray<XMNTabbed *> *tabbeds;

/** 选择某个tabbed的时候 回调 */
@property (copy, nonatomic, nullable)   void(^selectedTabbedBlock)(XMNTabbed * _Nonnull tabbed);

/**
 添加一个tabbed

 @param tabbed 添加的tabbed
 */
- (void)addTabbed:(XMNTabbed * __nullable)tabbed;


/**
 移除一个tabbed

 @param tabbed 移除的tabbed
 */
- (void)removeTabbed:(XMNTabbed * __nullable)tabbed;


/**
 移除所有的tabbed
 */
- (void)removeAllTabbeds;
@end
