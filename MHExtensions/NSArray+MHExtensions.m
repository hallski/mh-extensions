//
//  NSArray+MHExtensions.m
//  MHConvore
//
//  Created by Mikael Hallendal on 2011-02-18.
//  Copyright 2011 Mikael Hallendal. All rights reserved.
//

#import "NSArray+MHExtensions.h"


@implementation NSArray (MHExtensions)

- (NSArray *)map:(id (^) (id object))block
{
    NSMutableArray *retVal = [NSMutableArray arrayWithCapacity:[self count]];
    
    for (id object in self) {
        id newObject = block(object);
        if (newObject) {
            [retVal addObject:newObject];
        }
    }
    
    return [NSArray arrayWithArray:retVal];
}

- (NSArray *)filter:(BOOL (^) (id object))block;
{
    NSMutableArray *retVal = [NSMutableArray arrayWithCapacity:[self count]];
    
    for (id object in self) {
        if (block(object)) {
            [retVal addObject:object];
        }
    }
    
    return [NSArray arrayWithArray:retVal];
}


- (id)reduce:(id (^) (id object, id rem))block startValue:(id)startValue
{
    id value = startValue;
    
    for (id object in self) {
        value = block(object, value);   
    }
    
    return value;
}


@end
