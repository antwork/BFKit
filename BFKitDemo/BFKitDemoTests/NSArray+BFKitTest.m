//
//  NSArray+BFKitTest.m
//  BFKitDemo
//
//  Created by apple on 12/31/14.
//  Copyright (c) 2014 Fabrizio Brancati. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "NSArray+BFKit.h"

@interface NSArray_BFKitTest : XCTestCase

@end

@implementation NSArray_BFKitTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testBFCircle {
    NSInteger maxSize = 78;
    NSInteger result = BFSuperCircle(0, maxSize);
    XCTAssertEqual(result, 0);
    
    result = BFSuperCircle(1, maxSize);
    XCTAssertEqual(result, 1);
    
    result = BFSuperCircle(78, maxSize);
    XCTAssertEqual(result, 0);
    
    result = BFSuperCircle(79, maxSize);
    XCTAssertEqual(result, 1);
    
    result = BFSuperCircle(-1, maxSize);
    XCTAssertEqual(result, 77);
    
    result = BFSuperCircle(-2, maxSize);
    XCTAssertEqual(result, 76);
}

- (void)testObjectAtCircleIndex {
    NSArray *array = @[@"1", @"2", @"3"];
    
    NSString *str = [array objectAtCircleIndex:0];
    XCTAssertEqualObjects(str, @"1");
    
    str = [array objectAtCircleIndex:1];
    XCTAssertEqualObjects(str, @"2");
    
    str = [array objectAtCircleIndex:2];
    XCTAssertEqualObjects(str, @"3");
    
    str = [array objectAtCircleIndex:3];
    XCTAssertEqualObjects(str, @"1");
    
    str = [array objectAtCircleIndex:4];
    XCTAssertEqualObjects(str, @"2");
    
    str = [array objectAtCircleIndex:-1];
    XCTAssertEqualObjects(str, @"3");
    
    str = [array objectAtCircleIndex:-2];
    XCTAssertEqualObjects(str, @"2");
}

- (void)testArrayWithOffset {
    NSArray *array = @[@"1", @"2", @"3"];
    
    NSArray *arrayNew = [array arrayWithOffset:0 reverse:NO];
    XCTAssertEqualObjects(arrayNew[0], @"1");
    XCTAssertEqualObjects(arrayNew[1], @"2");
    XCTAssertEqualObjects(arrayNew[2], @"3");
    
    arrayNew = [array arrayWithOffset:1 reverse:NO];
    XCTAssertEqualObjects(arrayNew[0], @"3");
    XCTAssertEqualObjects(arrayNew[1], @"1");
    XCTAssertEqualObjects(arrayNew[2], @"2");
    
    arrayNew = [array arrayWithOffset:2 reverse:NO];
    XCTAssertEqualObjects(arrayNew[0], @"2");
    XCTAssertEqualObjects(arrayNew[1], @"3");
    XCTAssertEqualObjects(arrayNew[2], @"1");
    
    arrayNew = [array arrayWithOffset:1 reverse:YES];
    XCTAssertEqualObjects(arrayNew[0], @"2");
    XCTAssertEqualObjects(arrayNew[1], @"3");
    XCTAssertEqualObjects(arrayNew[2], @"1");
    
    arrayNew = [array arrayWithOffset:2 reverse:YES];
    XCTAssertEqualObjects(arrayNew[0], @"3");
    XCTAssertEqualObjects(arrayNew[1], @"1");
    XCTAssertEqualObjects(arrayNew[2], @"2");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
