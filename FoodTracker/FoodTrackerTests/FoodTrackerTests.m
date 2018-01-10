//
//  FoodTrackerTests.m
//  FoodTrackerTests
//
//  Created by Frank de V on 07/01/2018.
//  Copyright © 2018 Frank de V. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Meal.h"

@interface FoodTrackerTests : XCTestCase

@end

@implementation FoodTrackerTests
    
#pragma mark Meal Class Tests

- (void) testMealInitializationSucceeds {
    // Zero rating
    Meal *zeroRatingMeal = [[Meal alloc] init:@"Zero" withPhoto:nil withRating:0];
    
    XCTAssertNotNil(zeroRatingMeal);
    
    // Highest positive rating
    Meal *positiveRatingMeal = [[Meal alloc]init:@"Positive" withPhoto:nil withRating:5];
    
    XCTAssertNotNil(positiveRatingMeal);
}

// Confirm that the meal initializer returns nil when passed a negative rating or an empty name.

- (void) testMealInitializationFails {
    // Negative rating
    Meal *negativeRatingMeal = [[Meal alloc]init:@"Negative" withPhoto:nil withRating:-1];
    
    XCTAssertNil(negativeRatingMeal);
    
    //Empty String
    Meal *emptyStringMeal = [[Meal alloc]init:@"" withPhoto:nil withRating:0];
    
    XCTAssertNil(emptyStringMeal);
    
    // Rating exceeds maximum
    Meal *largeRatingMeal = [[Meal alloc]init:@"Large" withPhoto:nil withRating:6];
    
    XCTAssertNil(largeRatingMeal);
}




@end
