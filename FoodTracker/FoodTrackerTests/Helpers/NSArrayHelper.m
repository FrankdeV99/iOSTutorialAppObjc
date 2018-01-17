//
//  NSArrayHelper.m
//  FoodTrackerTests
//
//  Created by Tizin MacBook Pro on 16/01/2018.
//  Copyright © 2018 Frank de V. All rights reserved.
//

#import "NSArrayHelper.h"

@implementation NSArrayHelper

+ (NSMutableArray *)generateArray:(NSUInteger)elementCount {
    NSMutableArray *testArray = [NSMutableArray arrayWithCapacity:elementCount];
    
    for (NSUInteger i = 0; i < elementCount; i++) {
        NSString *element = [@"temp" stringByAppendingFormat:@"%lu", i];
        [testArray addObject:element];
    }
    
    return testArray;
}

+ (NSUInteger)randomArrayIndex:(NSArray *)array {
    return arc4random() % [array count];
}

+ (NSString *)randomArrayElement:(NSArray *)array randomIndex:(NSUInteger)randomIndex {
    return array[randomIndex];
}


@end
