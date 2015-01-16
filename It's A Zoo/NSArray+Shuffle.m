//
//  NSArray+Shuffle.m
//  It's A Zoo
//
//  Created by helenwang on 1/16/15.
//  Copyright (c) 2015 helenwang. All rights reserved.
//

#import "NSArray+Shuffle.h"

@implementation NSArray (Shuffle)

- (NSArray*) shuffle {
    NSMutableArray *tmpArray = [NSMutableArray arrayWithCapacity:[self count]];
    
    for (id anObject in self) {
        NSUInteger randomPos = arc4random()%([tmpArray count]+1);
        [tmpArray insertObject:anObject atIndex:randomPos];
    }
    
    return [NSArray arrayWithArray:tmpArray];
}

@end
