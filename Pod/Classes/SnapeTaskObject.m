//
//  SnapeTaskObject.m
//  HurryPorterTestAPP
//
//  Created by 葉建胤 on 2016/2/14.
//  Copyright © 2016年 Seachaos. All rights reserved.
//

#import "SnapeTaskObject.h"
#import "UISnape.h"

@implementation SnapeTaskObject

@synthesize taskId, snape, name;

- (id)init{
    self = [super init];
    taskId = [[NSUUID new] UUIDString];
    return self;
}

- (BOOL)success{
    return [snape success:taskId];
}
- (BOOL)failed{
    return [self failedBecause:nil];
}
- (BOOL)failedBecause:(NSString*)reason{
    return [snape failed:taskId because:reason];
}

@end


