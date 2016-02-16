//
//  Snape_iOSTests.m
//  Snape_iOSTests
//
//  Created by Seachaos on 02/14/2016.
//  Copyright (c) 2016 Seachaos. All rights reserved.
//

// https://github.com/Specta/Specta

#import <Snape_iOS/Snape_iOS-umbrella.h>
SpecBegin(InitialSpecs)

//describe(@"these will fail", ^{
//
//    it(@"can do maths", ^{
//        expect(1).to.equal(2);
//    });
//
//    it(@"can read", ^{
//        expect(@"number").to.equal(@"string");
//    });
//    
//    it(@"will wait for 10 seconds and fail", ^{
//        waitUntil(^(DoneCallback done) {
//        
//        });
//    });
//});

describe(@"eest Snape simple using as expect", ^{
    __block UISnape *snape;
    __block SnapeTaskObject *task;
    
    beforeEach(^{
        snape = [UISnape new];
        [snape test:@"test for generate task" code:^UISnapeTestResult(UISnape *snape, SnapeTaskObject *_task, NSString *jobId){
            task = _task;
            return SNAPE_WAIT_FOR_RESULT;
        }];
    });
    
    it(@"shound not found any task", ^{
        expect(snape).notTo.beNil();
        expect([snape success:nil]).to.beFalsy();
        expect([snape success:@"not exists"]).to.beFalsy();
        expect([snape failed:nil]).to.beFalsy();
        expect([snape failed:@"not exists"]).to.beFalsy();
    });
    
    it(@"shound found task", ^{
        expect(snape).notTo.beNil();
        expect(task).notTo.beNil();
        expect([snape success:task.taskId]).will.beTruthy();
        expect([task failed]).to.beTruthy();
        expect([task success]).to.beTruthy();
        
        expect([snape failed:nil]).to.beFalsy();
    });
    
    it(@"Snape wait for result", ^{
        [task success];
        expect([snape waitForResult]).to.equal(SNAPE_SUCCESS);
    });

});

describe(@"these will pass", ^{
    
    it(@"can do maths", ^{
        expect(1).beLessThan(23);
    });
    
    it(@"can read", ^{
        expect(@"team").toNot.contain(@"I");
    });
    
    it(@"will wait and succeed", ^{
        waitUntil(^(DoneCallback done) {
            done();
        });
    });
});

SpecEnd

