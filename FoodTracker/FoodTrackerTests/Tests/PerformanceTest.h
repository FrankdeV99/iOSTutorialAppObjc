//
//  PerformanceTest.h
//  FoodTracker
//
//  Created by Tizin MacBook Pro on 16/01/2018.
//  Copyright © 2018 Frank de V. All rights reserved.
//

#import <XCTest/XCTest.h>

static const NSInteger numberOfIterations = 10;
static const NSInteger elementsInStructure = 500;
static const NSString *lettersAlphabet = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

@interface PerformanceTest : XCTestCase

- (void)performTimeTestWithPrepareBlock:(id(^)(NSInteger count))prepareBlock
                         operationBlock:(NSTimeInterval (^)(id))operationBlock
                          structureName:(NSString *)structureName
                          operationName:(NSString *)operationName;

- (void)performTimeTestWithPrepareBlock:(id(^)(NSInteger count))prepareBlock
                         operationBlock:(NSTimeInterval (^)(id, id, id))operationBlock
                       randomIndexBlock:(id(^)(id))randomIndexBlock
                     randomElementBlock:(id(^)(id, id))randomElementBlock
                          structureName:(NSString *)structureName
                          operationName:(NSString *)operationName;
@end
