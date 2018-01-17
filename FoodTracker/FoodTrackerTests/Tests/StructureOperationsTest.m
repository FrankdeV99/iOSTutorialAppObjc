//
//  StructureOperationsTest.m
//  FoodTrackerTests
//
//  Created by Tizin MacBook Pro on 16/01/2018.
//  Copyright © 2018 Frank de V. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "PerformanceTest.h"
#import "NSArrayHelper.h"
#import "NSSetHelper.h"
#import "NSDictionaryHelper.h"

static const NSInteger maxRandomNumber = 100000;

static NSMutableArray *(^generateArrayBlock)(NSInteger);

static NSNumber *(^randomArrayIndexBlock)(NSMutableArray *);

static NSString *(^randomArrayElementBlock)(NSMutableArray *, NSNumber *);

static NSMutableSet *(^generateSetBlock)(NSInteger);

static NSNumber *(^randomSetIndexBlock)(NSMutableSet *);

static NSString *(^randomSetElementBlock)(NSMutableSet *, NSNumber *);

static NSMutableDictionary *(^generateDictionaryBlock)(NSInteger);

static NSString *(^randomDictionaryIndexBlock)(NSMutableDictionary *);

static NSString *(^randomDictionaryElementBlock)(NSMutableDictionary *, NSString *);

NSString *createRandomString();

@interface StructureOperationsTest : PerformanceTest

@end

@implementation StructureOperationsTest

+ (void)setUp {
    //Array
    generateArrayBlock = ^NSMutableArray *(NSInteger elementCount) {
        return [NSArrayHelper generateArray:(NSUInteger) elementCount];
    };
    
    randomArrayIndexBlock = ^NSNumber *(NSMutableArray *array) {
        return @([NSArrayHelper randomArrayIndex:array]);
    };
    
    randomArrayElementBlock = ^NSString *(NSMutableArray *array, NSNumber *index) {
        return array[[index unsignedIntegerValue]];
    };
    
    //Set
    generateSetBlock = ^NSMutableSet *(NSInteger elementCount) {
        return [NSSetHelper generateSet:(NSUInteger) elementCount];
    };
    
    randomSetIndexBlock = ^NSNumber *(NSMutableSet *set) {
        return @([NSSetHelper randomSetIndex:set]);
    };
    
    randomSetElementBlock = ^NSString *(NSMutableSet *set, NSNumber *index) {
        return [NSSetHelper randomSetElement:set randomIndex:[index unsignedIntegerValue]];
    };
    
    //Dictionary
    generateDictionaryBlock = ^NSMutableDictionary *(NSInteger elementCount) {
        return [NSDictionaryHelper generateDictionary:(NSUInteger) elementCount];
    };
    
    randomDictionaryIndexBlock = ^NSString *(NSMutableDictionary *dictionary) {
        return [NSDictionaryHelper randomDictionaryIndex:dictionary];
    };
    
    randomDictionaryElementBlock = ^NSString *(NSMutableDictionary *dictionary, NSString *index) {
        return [NSDictionaryHelper randomDictionaryElement:dictionary randomIndex:index];
    };
}


- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


#pragma mark - Arrays

- (void)testArrayAdd {
    [self performTimeTestWithPrepareBlock:generateArrayBlock
                           operationBlock:^(NSMutableArray *array) {
                               NSTimeInterval startTime = CACurrentMediaTime();
                               [array addObject:createRandomString()];
                               NSTimeInterval finishTime = CACurrentMediaTime();
                               return finishTime - startTime;
                           }
                            structureName:@"NSArray" operationName:@"Toevoegen"];
}

- (void)testArrayUpdate {
    [self performTimeTestWithPrepareBlock:generateArrayBlock
                           operationBlock:^(NSMutableArray *array, NSNumber *randomIndex, NSString *randomElement) {
                               NSTimeInterval startTime = CACurrentMediaTime();
                               array[[randomIndex unsignedIntegerValue]] = createRandomString();
                               NSTimeInterval finishTime = CACurrentMediaTime();
                               return finishTime - startTime;
                           }
                         randomIndexBlock:randomArrayIndexBlock
                       randomElementBlock:randomArrayElementBlock
                            structureName:@"NSArray" operationName:@"Updaten"];
}

- (void)testArrayByIndexRead {
    [self performTimeTestWithPrepareBlock:generateArrayBlock operationBlock:^(NSMutableArray *array, NSNumber *randomIndex, NSString *randomElement) {
        NSTimeInterval startTime = CACurrentMediaTime();
        NSString *constant = array[[randomIndex unsignedIntegerValue]];
        NSTimeInterval finishTime = CACurrentMediaTime();
        return finishTime - startTime;
    }            randomIndexBlock:randomArrayIndexBlock
                       randomElementBlock:randomArrayElementBlock
                            structureName:@"NSArray" operationName:@"Lezen"];
}

- (void)testArrayByIndexDelete {
    [self performTimeTestWithPrepareBlock:generateArrayBlock
                           operationBlock:^(NSMutableArray *array, NSNumber *randomIndex, NSString *randomElement) {
                               NSTimeInterval startTime = CACurrentMediaTime();
                               [array removeObjectAtIndex:[randomIndex unsignedIntegerValue]];
                               NSTimeInterval finishTime = CACurrentMediaTime();
                               return finishTime - startTime;
                           }
                         randomIndexBlock:randomArrayIndexBlock
                       randomElementBlock:randomArrayElementBlock
                            structureName:@"NSArray" operationName:@"Verwijderen"];
    
}

- (void)testArrayContains {
    [self performTimeTestWithPrepareBlock:generateArrayBlock
                           operationBlock:^(NSMutableArray *array, NSNumber *randomIndex, NSString *randomElement) {
                               NSTimeInterval startTime = CACurrentMediaTime();
                               BOOL constant = [array containsObject:randomElement];
                               NSTimeInterval finishTime = CACurrentMediaTime();
                               return finishTime - startTime;
                           }
                         randomIndexBlock:randomArrayIndexBlock
                       randomElementBlock:randomArrayElementBlock
                            structureName:@"NSArray" operationName:@"Bevat"];
    
}

#pragma mark - Sets

- (void)testSetAdd {
    [self performTimeTestWithPrepareBlock:generateSetBlock
                           operationBlock:^(NSMutableSet *set) {
                               NSTimeInterval startTime = CACurrentMediaTime();
                               [set addObject:createRandomString()];
                               NSTimeInterval finishTime = CACurrentMediaTime();
                               return finishTime - startTime;
                           }
                            structureName:@"NSSet" operationName:@"Toevoegen"];
}

- (void)testSetDelete {
    [self performTimeTestWithPrepareBlock:generateSetBlock
                           operationBlock:^(NSMutableSet *set, NSNumber *randomIndex, NSString *randomElement) {
                               NSTimeInterval startTime = CACurrentMediaTime();
                               [set removeObject:randomElement];
                               NSTimeInterval finishTime = CACurrentMediaTime();
                               return finishTime - startTime;
                           }
                         randomIndexBlock:randomSetIndexBlock
                       randomElementBlock:randomSetElementBlock
                            structureName:@"NSSet" operationName:@"Verwijder"];
}

- (void)testSetCheckContain {
    [self performTimeTestWithPrepareBlock:generateSetBlock
                           operationBlock:^(NSMutableSet *set, NSNumber *randomIndex, NSString *randomElement) {
                               NSTimeInterval startTime = CACurrentMediaTime();
                               BOOL constant = [set containsObject:randomElement];
                               NSTimeInterval finishTime = CACurrentMediaTime();
                               return finishTime - startTime;
                           }
                         randomIndexBlock:randomSetIndexBlock
                       randomElementBlock:randomSetElementBlock
                            structureName:@"NSSet" operationName:@"Bevat"];
}

#pragma mark - Dictionaries

- (void)testDictionaryAdd {
    [self performTimeTestWithPrepareBlock:generateDictionaryBlock
                           operationBlock:^(NSMutableDictionary *dict) {
                               NSString *const uniqueKey = [NSString stringWithFormat:@"%d", dict.count];
                               NSTimeInterval startTime = CACurrentMediaTime();
                               dict[uniqueKey] = createRandomString();
                               NSTimeInterval finishTime = CACurrentMediaTime();
                               return finishTime - startTime;
                           }
                            structureName:@"NSDictionary" operationName:@"Toevoegen"];
}

- (void)testDictionaryUpdate {
    [self performTimeTestWithPrepareBlock:generateDictionaryBlock
                           operationBlock:^(NSMutableDictionary *dictionary, NSNumber *randomIndex, NSString *randomElement) {
                               NSTimeInterval startTime = CACurrentMediaTime();
                               dictionary[randomIndex] = createRandomString();
                               NSTimeInterval finishTime = CACurrentMediaTime();
                               return finishTime - startTime;
                           }
                         randomIndexBlock:randomDictionaryIndexBlock
                       randomElementBlock:randomDictionaryElementBlock
                            structureName:@"NSDictionary" operationName:@"Updaten"];
}

- (void)testDictionaryReadByKey {
    [self performTimeTestWithPrepareBlock:generateDictionaryBlock
                           operationBlock:^(NSMutableDictionary *dictionary, NSNumber *randomIndex, NSString *randomElement) {
                               NSTimeInterval startTime = CACurrentMediaTime();
                               NSString *const constant = dictionary[randomIndex];
                               NSTimeInterval finishTime = CACurrentMediaTime();
                               return finishTime - startTime;
                           }
                         randomIndexBlock:randomDictionaryIndexBlock
                       randomElementBlock:randomDictionaryElementBlock
                            structureName:@"NSDictionary" operationName:@"Lezen"];
}

- (void)testDictionaryDeleteByKey {
    [self performTimeTestWithPrepareBlock:generateDictionaryBlock
                           operationBlock:^(NSMutableDictionary *dictionary, NSString *randomIndex, NSString *randomElement) {
                               NSTimeInterval startTime = CACurrentMediaTime();
                               [dictionary removeObjectForKey:randomIndex];
                               NSTimeInterval finishTime = CACurrentMediaTime();
                               return finishTime - startTime;
                           }
                         randomIndexBlock:randomDictionaryIndexBlock
                       randomElementBlock:randomDictionaryElementBlock
                            structureName:@"NSDictionary" operationName:@"Verwijderen"];
}

- (void)testDictionaryCheckContain {
    [self performTimeTestWithPrepareBlock:generateDictionaryBlock
                           operationBlock:^(NSMutableDictionary *dictionary, NSString *randomIndex, NSString *randomElement) {
                               NSTimeInterval startTime = CACurrentMediaTime();
                               [dictionary.allValues containsObject:randomElement];
                               NSTimeInterval finishTime = CACurrentMediaTime();
                               return finishTime - startTime;
                           }
                         randomIndexBlock:randomDictionaryIndexBlock
                       randomElementBlock:randomDictionaryElementBlock
                            structureName:@"NSDictionary" operationName:@"Bevat"];
}

NSString *createRandomString() {
    NSMutableString *randomString = [NSMutableString stringWithCapacity: 10];
    
    for (int i=0; i < 10; i++) {
        [randomString appendFormat: @"%C", [lettersAlphabet characterAtIndex: arc4random_uniform([lettersAlphabet length])]];
    }
    
    return randomString;
}


@end
