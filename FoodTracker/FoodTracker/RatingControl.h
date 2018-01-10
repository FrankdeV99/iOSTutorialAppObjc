//
//  RatingControl.h
//  FoodTracker
//
//  Created by Frank de V on 07/01/2018.
//  Copyright © 2018 Frank de V. All rights reserved.
//

#import <UIKit/UIKit.h>
IB_DESIGNABLE
@interface RatingControl : UIStackView

#pragma mark Properties

@property(nonatomic, strong) NSMutableArray *ratingButtons;
@property NSInteger rating;
@property(nonatomic) IBInspectable CGSize starSize;
@property(nonatomic) IBInspectable int starCount;

- (id)initWithFrame:(CGRect)frame;

@end
