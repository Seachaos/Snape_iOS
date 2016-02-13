# Snape
A cross platform test framework in UI  (support iOS/Android)


# iOS
Implement UISnapeDelegate in your class

Then Code for init snape (example):

    snape = [UISnape new];
    [self.view addSubview:snape];
    snape.frame = self.view.frame;
    snape.delegate = self;
    

When snape ready, will run delegate method:

    - (void)snapeReadyForTest:(UISnape *)snape

Can use for HTTP test or some thing, example for HurryPorter HTTP test:

    [snape test:@"Post Test" code:^UISnapeTestResult(UISnape *s, SnapeTaskObject *task, NSString *jobId){
        HurryPorter *porter = [[HurryPorter alloc] init];
        [porter makeRequest:^NSDictionary*(HurryPorter *porter){
            return @{@"First Name":@"Hurry",
                     @"Last Name":@"Porter"};
        } onSuccess:^void HUP_PARAM_SUCCESS{
            NSLog(@"success resp:%@", raw);
            NSLog(@"json is:%@", dict);
            [task success];
        } onFailed:^void HUP_PARAM_FAILED{
            NSLog(@"failed resp:%@", raw);
            [task failed];
        } url:@"http://www.myandroid.tw/test/post.php"];
        return WAIT_FOR_RESULT;
    }];
    


