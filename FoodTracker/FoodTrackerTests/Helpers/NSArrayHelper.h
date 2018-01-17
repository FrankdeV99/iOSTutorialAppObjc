//
//  NSArrayHelper.h
//  FoodTrackerTests
//
//  Created by Tizin MacBook Pro on 16/01/2018.
//  Copyright © 2018 Frank de V. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArrayHelper : NSObject

+ (NSMutableArray *)generateArray:(NSUInteger)elementCount;

+ (NSUInteger)randomArrayIndex:(NSArray *)array;

+ (NSString *)randomArrayElement:(NSArray *)array randomIndex:(NSUInteger)randomIndex;

@end
