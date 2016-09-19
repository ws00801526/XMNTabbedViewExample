//
//  XMNTabbedButton.m
//  XMNTabbedViewExample
//
//  Created by XMFraker on 16/9/19.
//  Copyright © 2016年 XMFraker. All rights reserved.
//

#import "XMNTabbedButton.h"

@implementation XMNTabbedButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setHighlighted:(BOOL)highlighted {
    
    [super setHighlighted:highlighted];
    if (highlighted && self.backgroundColor != self.highlightBackgroundColor) {
        self.backgroundColor = self.highlightBackgroundColor;
    }else if (!highlighted) {
        self.backgroundColor = self.normalBackgroundColor;
    }
}

@end
