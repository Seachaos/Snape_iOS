//
//  TestSnape.m
//  Snape_iOS
//
//  Created by 葉建胤 on 2016/2/17.
//  Copyright © 2016年 Seachaos. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Snape_iOS/Snape_iOS-umbrella.h>

@interface TestSnape : XCTestCase

@end

@implementation TestSnape

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}



- (void)testSnapeNetworkTest{
//    UISnape *snape = [UISnape new];
//    [snape test:@"Post Test" code:^UISnapeTestResult(UISnape *s, SnapeTaskObject *task, NSString *jobId){
//        return WAIT_FOR_RESULT;
//    }];
//    [self measureBlock:^{
//        UISnapeTestResult result = [snape waitForResult];
//        XCTAssertEqual(result, SUCCESS);
//    }];
    
}
- (void)testSnapeNilTaskId{
    UISnape *snape = [UISnape new];
    [self measureBlock:^{
        XCTAssertFalse([snape success:nil]);
        XCTAssertFalse([snape success:@"not exists"]);
        XCTAssertFalse([snape failed:nil]);
        XCTAssertFalse([snape failed:@"not exists"]);
    }];
    
    XCTAssertEqual(SNAPE_SUCCESS , [snape test:@"TEST_Success" code:^UISnapeTestResult(UISnape *snape, SnapeTaskObject *task, NSString *jobId){
        return SNAPE_SUCCESS;
    }]);
    XCTAssertEqual(SNAPE_FAILED, [snape test:@"B" code:^UISnapeTestResult(UISnape *snape, SnapeTaskObject *task, NSString *jobId){
        return SNAPE_FAILED;
    }]);
    XCTAssertNotEqual(SNAPE_SUCCESS, [snape test:@"C" code:^UISnapeTestResult(UISnape *snape, SnapeTaskObject *task, NSString *jobId){
        return SNAPE_FAILED;
    }]);
    
    
}


@end
