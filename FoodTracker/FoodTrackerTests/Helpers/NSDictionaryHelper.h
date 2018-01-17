//
//  NSDictionaryHelper.h
//  FoodTrackerTests
//
//  Created by Tizin MacBook Pro on 16/01/2018.
//  Copyright © 2018 Frank de V. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionaryHelper : NSObject

+ (NSMutableDictionary *)generateDictionary:(NSUInteger)elementCount;

+ (NSString *)randomDictionaryIndex:(NSDictionary *)dict;

+ (NSString *)randomDictionaryElement:(NSDictionary *)dict randomIndex:(NSString *)randomIndex;

@end
