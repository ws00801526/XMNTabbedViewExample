# XMNTabbedViewExample
自适应高度的标签view,可以自定义标签颜色,字体颜色,高亮颜色等


### 安装方法 `pod XMNTabbed`

### 使用方法


```

	/** 初始化一个XMNTabbedView */
    XMNTabbedView *tabbedView = [[XMNTabbedView alloc] initWithFrame:CGRectMake(0, 120, 280, 0)];
    /** 设置对齐方式 */
    tabbedView.alignment = XMNTabbedViewAlignmentLeft;
    tabbedView.backgroundColor = [UIColor greenColor];
    /** !!!重要  设置tabbedView的最大宽度 */
    tabbedView.preferIntrinsicWidth = 280.f;
    
    
    /** 初始化tabbed */
    NSArray *texts = @[ @"php",@"python using mysql to store message 1 ",@"python using mysql to store message python using mysql to store message 2 ",@"python using mysql to store message\npython using mysql to store message\npython using mysql to store message 3", @"mysql",@"python", @"mysql", @"flask", @"django", @"bottle", @"webpy"];
    [texts enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        XMNTabbed *tabbed = [XMNTabbed tabbedWithTitle:obj];
        /** 测试任意字体大小 */
        tabbed.titleFont = [UIFont systemFontOfSize:10 + random() % 5];
        tabbed.highlightBackgroundColor = [UIColor yellowColor];
        tabbed.highlightTitleColor = [UIColor purpleColor];
        [tabbedView addTabbed:tabbed];
    }];
    
    /** 添加tabbedView */
    [self.view addSubview:self.tabbedView = tabbedView];

```
