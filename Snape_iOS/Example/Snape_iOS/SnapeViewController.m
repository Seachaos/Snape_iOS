//
//  SnapeViewController.m
//  Snape_iOS
//
//  Created by Seachaos on 02/14/2016.
//  Copyright (c) 2016 Seachaos. All rights reserved.
//

#import "SnapeViewController.h"
#import <Snape_iOS/Snape_iOS-umbrella.h>

@interface SnapeViewController () <UISnapeDelegate>

@end

@implementation SnapeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UISnape *snape = [UISnape new];
    [self.view addSubview:snape];
    snape.delegate = self;
    snape.frame = self.view.frame;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UISnapeDelegate
- (void)snapeReadyForTest:(UISnape*)snape{
    [snape test:@"Example1 is Success" code:^UISnapeTestResult(UISnape *s, SnapeTaskObject *task, NSString *jobId){
        return SUCCESS;
    }];
    [snape test:@"Example2 is Failed" code:^UISnapeTestResult(UISnape *s, SnapeTaskObject *task, NSString *jobId){
        return FAILED;
    }];
}

@end
