//
//  MHExtensionsTests.m
//  MHExtensionsTests
//
//  Created by Mikael Hallendal on 2011-02-18.
//  Copyright 2011 Mikael Hallendal. All rights reserved.
//

#import "MHExtensionsTests.h"
#import "NSArray+MHExtensions.h"


@implementation MHExtensionsTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testArrayByApplyingBlock
{
    NSArray *array = [NSArray arrayWithObjects:@"1", @"2", @"3", nil];
    
    // Test to change the objects in array
    NSArray *newArray = [array arrayByApplyingBlock:^ id (id obj) {
        return [obj stringByAppendingString:@"x"];
    }];
    
    NSArray *testArray = [NSArray arrayWithObjects:@"1x", @"2x", @"3x", nil];
    STAssertEqualObjects(testArray, newArray, nil);
    
    // Test removal of an object in the array
    newArray = [array arrayByApplyingBlock:^ id (id obj) {
        if ([obj isEqualToString:@"2"]) {
            return nil;
        }
        
        return obj;
    }];
    
    testArray = [NSArray arrayWithObjects:@"1", @"3", nil];
    STAssertEqualObjects(testArray, newArray, nil);
}

@end
