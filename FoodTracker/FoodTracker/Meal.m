//
//  Meal.m
//  FoodTracker
//
//  Created by Frank de V on 09/01/2018.
//  Copyright © 2018 Frank de V. All rights reserved.
//

#import "Meal.h"

@implementation Meal

#pragma mark Initialization

- (id)init:(NSString *)name withPhoto:(UIImage *)photo withRating:(NSInteger) rating {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"RATING_CHANGED" object:nil];
    self.name = name;
    self.photo = photo;
    self.rating = rating;
    
    if ([name isEqualToString:@""] || name == nil) {
        return nil;
    }
    
    if (rating < 0 || rating > 5) {
        return nil;
    }
    
    return self;
}

@end
