//
//  NSSetHelper.m
//  FoodTrackerTests
//
//  Created by Tizin MacBook Pro on 16/01/2018.
//  Copyright © 2018 Frank de V. All rights reserved.
//

#import "NSSetHelper.h"

@implementation NSSetHelper

+ (NSMutableSet *)generateSet:(NSUInteger)elementCount {
    NSMutableSet *testSet = [NSMutableSet setWithCapacity:elementCount];
    for (NSUInteger i = 0; i < elementCount; i++) {
        NSString *element = [@"temp" stringByAppendingFormat:@"%lu", i];
        [testSet addObject:element];
    }
    
    return testSet;
}

+ (NSUInteger)randomSetIndex:(NSSet *)set {
    return arc4random() % [set count];
}

+ (NSString *)randomSetElement:(NSSet *)set randomIndex:(NSUInteger)randomIndex {
    return [@"temp" stringByAppendingFormat:@"%lu", randomIndex];
}

@end
