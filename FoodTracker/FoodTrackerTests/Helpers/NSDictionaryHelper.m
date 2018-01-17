//
//  NSDictionaryHelper.m
//  FoodTrackerTests
//
//  Created by Tizin MacBook Pro on 16/01/2018.
//  Copyright © 2018 Frank de V. All rights reserved.
//

#import "NSDictionaryHelper.h"

@implementation NSDictionaryHelper

+ (NSMutableDictionary *)generateDictionary:(NSUInteger)elementCount {
    NSMutableDictionary *testDictionary = [NSMutableDictionary dictionaryWithCapacity:elementCount];
    for (NSUInteger i = 0; i < elementCount; i++) {
        NSString *key = [NSString stringWithFormat:@"%lu", i];
        NSString *element = [@"temp" stringByAppendingFormat:@"%lu", i];
        testDictionary[key] = element;
    }
    
    return testDictionary;
}

+ (NSString *)randomDictionaryIndex:(NSDictionary *)dict {
    return [NSString stringWithFormat:@"%lu", arc4random() % dict.count];
}

+ (NSString *)randomDictionaryElement:(NSDictionary *)dict randomIndex:(NSString *)randomIndex {
    return dict[randomIndex];
}

@end
