//
//  NSSetHelper.h
//  FoodTrackerTests
//
//  Created by Tizin MacBook Pro on 16/01/2018.
//  Copyright © 2018 Frank de V. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSSetHelper : NSObject

+ (NSMutableSet *)generateSet:(NSUInteger)elementCount;

+ (NSUInteger)randomSetIndex:(NSSet *)set;

+ (NSString *)randomSetElement:(NSSet *)set randomIndex:(NSUInteger)randomIndex;

@end
