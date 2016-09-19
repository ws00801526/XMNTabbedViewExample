
//
//  XMNTabbed.m
//  XMNTabbedViewExample
//
//  Created by XMFraker on 16/9/19.
//  Copyright © 2016年 XMFraker. All rights reserved.
//

#import "XMNTabbed.h"

@implementation XMNTabbed

#pragma mark - Life Cycle

- (instancetype)initWithTitle:(NSString *)title {
    
    if (self = [super init]) {
        
        self.title = title;
        [self setup];
    }
    return self;
}

+ (instancetype __nonnull)tabbedWithTitle:(NSString * __nonnull)title {
    
    return [[[self class] alloc] initWithTitle:title];
}

#pragma mark - Method

- (void)setup {
    
    self.cornerRadius = 4.f;
    self.contentInset = UIEdgeInsetsMake(4, 8, 4, 8);
    self.titleFont = [UIFont systemFontOfSize:12.f];
    self.highlightTitleColor = self.titleColor = [UIColor whiteColor];
    
    if ([UIColor instancesRespondToSelector:@selector(colorWithDisplayP3Red:green:blue:alpha:)]) {
        self.highlightBackgroundColor = self.backgroundColor = [UIColor colorWithDisplayP3Red:1/255.f green:193/255.f blue:245.f/255.f alpha:1.f];
    }else {
        self.highlightBackgroundColor = self.backgroundColor = [UIColor colorWithRed:1.f/255.f green:193.f/255.f blue:245.f/255.f alpha:1.f];
    }
}

@end
