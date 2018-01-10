//
//  Meal.h
//  FoodTracker
//
//  Created by Frank de V on 09/01/2018.
//  Copyright © 2018 Frank de V. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Meal : NSObject

#pragma mark Properties

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) UIImage *photo;
@property (nonatomic) NSInteger rating;

- (id)init:(NSString *)name withPhoto:(UIImage *)photo withRating:(NSInteger) rating;

@end
