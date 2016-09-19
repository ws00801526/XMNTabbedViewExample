//
//  ViewController.m
//  XMNTabbedViewExample
//
//  Created by XMFraker on 16/9/19.
//  Copyright © 2016年 XMFraker. All rights reserved.
//

#import "ViewController.h"

#import "XMNTabbedFramework.h"

@interface ViewController ()

@property (weak, nonatomic)   XMNTabbedView *tabbedView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    XMNTabbedView *tabbedView = [[XMNTabbedView alloc] initWithFrame:CGRectMake(0, 120, 280, 0)];
    tabbedView.alignment = XMNTabbedViewAlignmentRight;
    tabbedView.backgroundColor = [UIColor greenColor];
    tabbedView.preferIntrinsicWidth = 280.f;
    
    NSArray *texts = @[ @"php",@"python using mysql to store message 1 ",@"python using mysql to store message python using mysql to store message 2 ",@"python using mysql to store message\npython using mysql to store message\npython using mysql to store message 3", @"mysql",@"python", @"mysql", @"flask", @"django", @"bottle", @"webpy"];

    [texts enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        XMNTabbed *tabbed = [XMNTabbed tabbedWithTitle:obj];
        /** 测试任意字体大小 */
        tabbed.titleFont = [UIFont systemFontOfSize:10 + random() % 5];
        tabbed.highlightBackgroundColor = [UIColor yellowColor];
        tabbed.highlightTitleColor = [UIColor purpleColor];
        [tabbedView addTabbed:tabbed];
    }];
    
    [self.view addSubview:self.tabbedView = tabbedView];
    NSLog(@"this is tabbed :%@",NSStringFromCGRect(self.tabbedView.frame));

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)handleAddTabbed:(UIButton *)sender {
    
    XMNTabbed *tabbed = [XMNTabbed tabbedWithTitle:@"Add Tabbed Again"];
    tabbed.titleFont = [UIFont systemFontOfSize:10 + random() % 5];
    [self.tabbedView addTabbed:tabbed];
    
}

- (IBAction)handleRemoveTabbed:(UIButton *)sender {
    
    [self.tabbedView removeTabbed:[self.tabbedView.tabbeds firstObject]];
}

- (IBAction)handleRemoveAll:(UIButton *)sender {
    
    [self.tabbedView removeAllTabbeds];
}

@end