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

- (void)testMap
{
    NSArray *array = [NSArray arrayWithObjects:@"1", @"2", @"3", nil];
    
    // Test to change the objects in array
    NSArray *newArray = [array map:^ id (id obj) {
        return [obj stringByAppendingString:@"x"];
    }];
    
    NSArray *testArray = [NSArray arrayWithObjects:@"1x", @"2x", @"3x", nil];
    STAssertEqualObjects(testArray, newArray, nil);
    
}

- (void)testFilter
{
    NSArray *array = [NSArray arrayWithObjects:@"1", @"2", @"3", nil];
    // Test removal of an object in the array
    NSArray *newArray = [array filter:^ BOOL (id obj) {
        if ([obj isEqualToString:@"2"]) {
            return NO;
        }

        return YES;
    }];
    
    NSArray *testArray = [NSArray arrayWithObjects:@"1", @"3", nil];
    STAssertEqualObjects(testArray, newArray, nil);

}

- (void)testReduce
{
    NSArray *array = [NSArray arrayWithObjects:@"1", @"2", @"3", nil];
    NSString *testString = @"a123";
    
    NSString *reducedString = [array reduce:^ id (id object, id value) {
        return [((NSString *)value) stringByAppendingString:((NSString *)object)];
    }
                                 startValue:@"a"];
    
    STAssertEqualObjects(testString, reducedString, nil);
    
    array = [NSArray arrayWithObjects:[NSNumber numberWithInt:1], [NSNumber numberWithInt:2], [NSNumber numberWithInt:3], [NSNumber numberWithInt:4], nil];
    
    NSNumber *result = [array reduce:^ id (id object, id value) {
        return [NSNumber numberWithInt:[object intValue] + [value intValue]];
    }
                          startValue:[NSNumber numberWithInt:5]];
    STAssertEquals(15, [result intValue], nil);
}

@end
