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

- (void)testFirst
{
    NSArray *array = [NSArray arrayWithObjects:@"1", @"2", @"3", nil];
    
    STAssertEquals(@"1", [array first], nil);
    
    // Should return nil if there are no objects in the array.
    STAssertEquals((id)nil, [[NSArray array] first], nil);
}

- (void)testRest
{
    NSArray *array = [NSArray arrayWithObjects:@"1", @"2", @"3", nil];
    NSArray *newArray = [NSArray arrayWithObjects:@"2", @"3", nil];
    
    STAssertEqualObjects(newArray, [array rest], nil);
    
    // Should always return an empty array if there are no other objects, never nil.
    STAssertEqualObjects([NSArray array], [[NSArray arrayWithObject:@"1"] rest], nil);
    STAssertEqualObjects([NSArray array], [[NSArray array] rest], nil);
}

- (void)testMap
{
    NSArray *array = [NSArray arrayWithObjects:@"1", @"2", @"3", nil];
    
    // Test to change the objects in array
    NSArray *newArray = [array map:^(id obj) {
        return [obj stringByAppendingString:@"x"];
    }];
    
    NSArray *testArray = [NSArray arrayWithObjects:@"1x", @"2x", @"3x", nil];
    STAssertEqualObjects(testArray, newArray, nil);
    
    // Should always return an empty array, not nil
    STAssertEqualObjects([NSArray array], [[NSArray array] map:^(id obj) { return obj; }], nil);
}

- (void)testFilter
{
    NSArray *array = [NSArray arrayWithObjects:@"1", @"2", @"3", nil];
    // Test removal of an object in the array
    NSArray *newArray = [array filter:^(id obj) {
        if ([obj isEqualToString:@"2"]) {
            return NO;
        }

        return YES;
    }];
    
    NSArray *testArray = [NSArray arrayWithObjects:@"1", @"3", nil];
    STAssertEqualObjects(testArray, newArray, nil);
    
    // Should always return an empty array, not nil
    STAssertEqualObjects([NSArray array], [[NSArray arrayWithObject:@"1"] filter:^(id obj) { return NO; }], nil);
    STAssertEqualObjects([NSArray array], [[NSArray array] filter:^(id obj) { return YES; }], nil);
}

- (void)testReduce
{
    NSArray *array = [NSArray arrayWithObjects:@"1", @"2", @"3", nil];
    NSString *testString = @"a123";
    
    NSString *reducedString = [array reduce:^(id object, id value) {
        return [((NSString *)value) stringByAppendingString:((NSString *)object)];
    }
                                 startValue:@"a"];
    
    STAssertEqualObjects(testString, reducedString, nil);
    
    array = [NSArray arrayWithObjects:[NSNumber numberWithInt:1], [NSNumber numberWithInt:2], [NSNumber numberWithInt:3], [NSNumber numberWithInt:4], nil];
    
    NSNumber *result = [array reduce:^(id object, id value) {
        return [NSNumber numberWithInt:[object intValue] + [value intValue]];
    }
                          startValue:[NSNumber numberWithInt:5]];
    STAssertEquals(15, [result intValue], nil);
}

@end
