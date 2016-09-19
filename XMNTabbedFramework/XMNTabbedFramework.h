//
//  XMNTabbedFramework.h
//  XMNTabbedFramework
//
//  Created by XMFraker on 16/9/19.
//  Copyright © 2016年 XMFraker. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for XMNTabbedFramework.
FOUNDATION_EXPORT double XMNTabbedFrameworkVersionNumber;

//! Project version string for XMNTabbedFramework.
FOUNDATION_EXPORT const unsigned char XMNTabbedFrameworkVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <XMNTabbedFramework/PublicHeader.h>



#if __has_include(<XMNTabbedFramework/XMNTabbedFramework.h>)

    #import <XMNTabbedFramework/XMNTabbed.h>
    #import <XMNTabbedFramework/XMNTabbedView.h>
#else

    #import "XMNTabbed.h"
    #import "XMNTabbedView.h"

#endif
