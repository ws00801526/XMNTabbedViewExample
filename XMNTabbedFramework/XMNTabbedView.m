//
//  XMNTabbedView.m
//  XMNTabbedViewExample
//
//  Created by XMFraker on 16/9/19.
//  Copyright © 2016年 XMFraker. All rights reserved.
//

#import "XMNTabbedView.h"
#import "XMNTabbedButton.h"
#import "XMNTabbed.h"

@interface XMNTabbedView ()

@property (strong, nonatomic) NSMutableArray<XMNTabbed *> *tabbeds;
@property (assign) CGFloat intrinsicHeight;
@property (strong, nonatomic) NSMutableArray<UIButton *> *unsortButtons;


@end

@implementation XMNTabbedView

#pragma mark - Life Cycle

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.rowSpace = 4.f;
        self.lineSpace = 8.f;
        self.contentInset = UIEdgeInsetsMake(8, 8, 8, 8);
    }
    return self;
}

#pragma mark - Override Method

- (CGSize)intrinsicContentSize {

    
    return CGSizeMake(self.preferIntrinsicWidth, self.intrinsicHeight);
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    [self reorderTabbeds];
}

#pragma mark - Events

- (void)handleTabbedAction:(UIButton *)button {
    
    NSString *title = [button titleForState:UIControlStateNormal];
    
    __weak __block XMNTabbed *tabbed = nil;
    [self.tabbeds enumerateObjectsUsingBlock:^(XMNTabbed * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        if ([obj.title isEqualToString:title ? : @""]) {
            tabbed = obj;
            *stop = YES;
        }
    }];
    
    self.selectedTabbedBlock ? self.selectedTabbedBlock(tabbed) : nil;
    NSLog(@"you touch button :%@  :%@",tabbed, tabbed.title);
}

#pragma mark - Method


/**
 将添加好的tabbed,重新进行排序
 */
- (void)reorderTabbeds {
    
    if (self.alignment == XMNTabbedViewAlignmentRight) {
        
        __block float originX = self.preferIntrinsicWidth - self.contentInset.right;
        __block float originY = self.contentInset.top;
        __block float maxHeight = 0.f;
        [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            /** 1.排放当前元素 */
            obj.frame = CGRectMake(originX - obj.frame.size.width, originY, obj.frame.size.width, obj.frame.size.height);
            /** 2.如果当前元素,已经不足够排放了 */
            if (CGRectGetMinX(obj.frame) < self.contentInset.left) {
                /** 3.换行 originX = contentInset.left */
                originX = self.preferIntrinsicWidth - self.contentInset.right;
                /** 4. originY = 上行的起点 + 上一行最高高度 + lineSpace */
                originY = originY + maxHeight + self.lineSpace;
                /** 5. 设置当前item的未知 */
                obj.frame = CGRectMake(originX - obj.frame.size.width, originY, obj.frame.size.width, obj.frame.size.height);
                /** 6. 重置当前行最高高度为 当前item高度 */
                maxHeight = obj.frame.size.height;
            }else {
                /** 7. 获取当前行最高高度 */
                maxHeight = MAX(maxHeight, obj.frame.size.height);
            }
            /** 获取下一个item的originX */
            originX = CGRectGetMinX(obj.frame) - self.rowSpace;
        }];
        CGRect r = self.frame;
        CGFloat totalHeight = originY + self.contentInset.bottom + maxHeight;
        self.intrinsicHeight = totalHeight;
        [self setFrame:CGRectMake(r.origin.x, r.origin.y, self.preferIntrinsicWidth, self.intrinsicHeight)];
    }else {
        
        __block float originX = self.contentInset.left;
        __block float originY = self.contentInset.top;
        __block float maxHeight = 0.f;
        [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            /** 1.排放当前元素 */
            obj.frame = CGRectMake(originX, originY, obj.frame.size.width, obj.frame.size.height);
            /** 2.如果当前元素,已经不足够排放了 */
            if (CGRectGetMaxX(obj.frame) > self.preferIntrinsicWidth - self.contentInset.right) {
                /** 3.换行 originX = contentInset.left */
                originX = self.contentInset.left;
                /** 4. originY = 上行的起点 + 上一行最高高度 + lineSpace */
                originY = originY + maxHeight + self.lineSpace;
                /** 5. 设置当前item的未知 */
                obj.frame = CGRectMake(originX, originY, obj.frame.size.width, obj.frame.size.height);
                /** 6. 重置当前行最高高度为 当前item高度 */
                maxHeight = obj.frame.size.height;
            }else {
                /** 7. 获取当前行最高高度 */
                maxHeight = MAX(maxHeight, obj.frame.size.height);
            }
            /** 获取下一个item的originX */
            originX = CGRectGetMaxX(obj.frame) + self.rowSpace;
        }];
        CGRect r = self.frame;
        CGFloat totalHeight = originY + self.contentInset.bottom + maxHeight;
        self.intrinsicHeight = totalHeight;
        [self setFrame:CGRectMake(r.origin.x, r.origin.y, self.preferIntrinsicWidth, self.intrinsicHeight)];
    }
}

- (void)addTabbed:(XMNTabbed *)tabbed {
    
    if (!tabbed) {
        return;
    }
    
    if (!self.tabbeds) {
        self.tabbeds = [NSMutableArray array];
    }
    
    if (![self.tabbeds containsObject:tabbed]) {
        
        /** 配置tabbedButton */
        XMNTabbedButton *tabbedButton = [XMNTabbedButton buttonWithType:UIButtonTypeCustom];
        [tabbedButton setTitle:tabbed.title forState:UIControlStateNormal];
        [tabbedButton.titleLabel setFont:tabbed.titleFont];
        [tabbedButton setTitleColor:tabbed.titleColor forState:UIControlStateNormal];
        [tabbedButton setTitleColor:tabbed.highlightTitleColor forState:UIControlStateHighlighted];
        tabbedButton.titleLabel.numberOfLines = 0.f;
        tabbedButton.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        
        /** 设置tabbedButton背景色 */
        [tabbedButton setBackgroundColor:tabbed.backgroundColor];
        tabbedButton.normalBackgroundColor = tabbed.backgroundColor;
        tabbedButton.highlightBackgroundColor = tabbed.highlightBackgroundColor;
        
        /** 添加tabbedButton点击动作 */
        [tabbedButton addTarget:self action:@selector(handleTabbedAction:) forControlEvents:UIControlEventTouchUpInside];
        
        /** 设置tabbedButton圆角 */
        tabbedButton.layer.cornerRadius = tabbed.cornerRadius;
        tabbedButton.layer.masksToBounds = tabbed.cornerRadius > 0.f;
        
        /** 计算tabbedButton的大小 */
        CGSize textSize = [[self class] sizeForText:tabbed.title
                                           withFont:tabbed.titleFont
                            preferredMaxLayoutWidth:self.preferIntrinsicWidth - self.contentInset.left - self.contentInset.right - tabbed.contentInset.left - tabbed.contentInset.right];
        CGSize buttonSize = CGSizeMake(textSize.width + tabbed.contentInset.left + tabbed.contentInset.right, textSize.height + tabbed.contentInset.top + tabbed.contentInset.bottom);
        tabbedButton.frame = CGRectMake(0, 0, buttonSize.width, buttonSize.height);
        [self addSubview:tabbedButton];
        tabbed.button = tabbedButton;
        [self.tabbeds addObject:tabbed];
    }
    [self setNeedsLayout];
}

- (void)removeTabbed:(XMNTabbed *)tabbed {
    
    if (!tabbed) {
        return;
    }
    [tabbed.button removeFromSuperview];
    [self.tabbeds removeObject:tabbed];
    [self setNeedsLayout];
}

- (void)removeAllTabbeds {
    
    [self.tabbeds removeAllObjects];
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self setNeedsLayout];
}

#pragma mark - Setter

- (void)setLineSpace:(CGFloat)lineSpace {
    
    _lineSpace = lineSpace;
    [self setNeedsLayout];
}

- (void)setRowSpace:(CGFloat)rowSpace {
    
    _rowSpace = rowSpace;
    [self setNeedsLayout];
}

- (void)setContentInset:(UIEdgeInsets)contentInset {
    
    _contentInset = contentInset;
    [self setNeedsLayout];
}

- (void)setAlignment:(XMNTabbedViewAlignment)alignment {
    
    _alignment = alignment;
    [self setNeedsLayout];
}

- (void)setPreferIntrinsicWidth:(CGFloat)preferIntrinsicWidth {
    
    _preferIntrinsicWidth = preferIntrinsicWidth;
    [self setNeedsLayout];
}

#pragma mark - Class Method

+ (CGSize)sizeForText:(NSString *)text
             withFont:(UIFont *)font
preferredMaxLayoutWidth:(CGFloat)preferredMaxLayoutWidth {
    
    NSMutableParagraphStyle* paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    [paragraphStyle setAlignment:NSTextAlignmentLeft];
    [paragraphStyle setLineBreakMode:NSLineBreakByCharWrapping];
    
    NSDictionary* stringAttributes = @{NSFontAttributeName:font,
                                       NSParagraphStyleAttributeName: paragraphStyle};
    CGSize size = [text boundingRectWithSize:CGSizeMake(preferredMaxLayoutWidth, CGFLOAT_MAX)
                                  options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                               attributes:stringAttributes
                                  context: nil].size;
    return size;
}

@end
