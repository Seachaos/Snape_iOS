# Snape_iOS

[![CI Status](http://img.shields.io/travis/Seachaos/Snape_iOS.svg?style=flat)](https://travis-ci.org/Seachaos/Snape_iOS)
[![Version](https://img.shields.io/cocoapods/v/Snape_iOS.svg?style=flat)](http://cocoapods.org/pods/Snape_iOS)
[![License](https://img.shields.io/cocoapods/l/Snape_iOS.svg?style=flat)](http://cocoapods.org/pods/Snape_iOS)
[![Platform](https://img.shields.io/cocoapods/p/Snape_iOS.svg?style=flat)](http://cocoapods.org/pods/Snape_iOS)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

Snape_iOS is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "Snape_iOS"
```


## Example
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



## Author

Seachaos, ye.jian.yin@gmail.com

## License

Snape_iOS is available under the MIT license. See the LICENSE file for more info.
