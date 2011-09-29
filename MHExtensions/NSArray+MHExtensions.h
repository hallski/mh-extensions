//
//  NSArray+MHExtensions.h
//  MHConvore
//
//  Created by Mikael Hallendal on 2011-02-18.
//  Copyright 2011 Mikael Hallendal. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSArray (MHExtensions)
    
- (id)first;
- (id)rest;

- (NSArray *)map:(id (^) (id object))block;
- (NSArray *)filter:(BOOL (^) (id object))block;

- (id)reduce:(id (^) (id object, id value))block startValue:(id)startValue;

@end
