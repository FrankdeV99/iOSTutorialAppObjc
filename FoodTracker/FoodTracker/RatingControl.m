//
//  RatingControl.m
//  FoodTracker
//
//  Created by Frank de V on 07/01/2018.
//  Copyright © 2018 Frank de V. All rights reserved.
//

#import "RatingControl.h"

@implementation RatingControl

#pragma mark Initialization

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.starSize = CGSizeMake(44.0, 44.0);
        self.starCount = 5;
        self.rating = 0;
        [self setupButtons];
        self.ratingButtons = [[NSMutableArray alloc]init];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(updateButtonSelectionStates) name:@"RATING_CHANGED" object:nil];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.starSize = CGSizeMake(44.0, 44.0);
        self.starCount = 5;
        self.rating = 0;
        self.ratingButtons = [[NSMutableArray alloc]init];
        [self setupButtons];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(updateButtonSelectionStates) name:@"RATING_CHANGED" object:nil];
    }
    return self;
}

#pragma mark Private methods

- (void)setupButtons {
    
    for (UIButton *button in self.ratingButtons) {
        [self removeArrangedSubview:button];
        [button removeFromSuperview];
    }
    [self.ratingButtons removeAllObjects];
    
    NSBundle *bundle = [NSBundle mainBundle];
    UIImage *filledStar = [UIImage imageNamed:@"filledStar" inBundle:bundle compatibleWithTraitCollection:self.traitCollection];
    UIImage *emptyStar = [UIImage imageNamed:@"emptyStar" inBundle:bundle compatibleWithTraitCollection:self.traitCollection];
    UIImage *highlightedStar = [UIImage imageNamed:@"highlightedStar" inBundle:bundle compatibleWithTraitCollection:self.traitCollection];
    
    for (int i = 0; i < self.starCount; i++) {
        // Create the button
        UIButton *button = [[UIButton alloc]init];
        [button setImage:emptyStar forState:UIControlStateNormal];
        [button setImage:filledStar forState:UIControlStateSelected];
        [button setImage:highlightedStar forState:UIControlStateHighlighted];
        [button setImage:highlightedStar forState:UIControlStateHighlighted | UIControlStateSelected];
        
        // Add constraints
        [button setTranslatesAutoresizingMaskIntoConstraints:NO];
        [button.heightAnchor constraintEqualToConstant:self.starSize.height].active = YES;
        [button.widthAnchor constraintEqualToConstant:self.starSize.width].active = YES;
        button.accessibilityLabel = [NSString stringWithFormat:@"Set %i star rating", (i + 1)];
        
        [button addTarget:self action:@selector(ratingButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        
        // Add the button to the stack
        [self addArrangedSubview:button];
        
        // Add the button to the rating button array
        [self.ratingButtons addObject:button];
    }
    
    [self updateButtonSelectionStates];
}

#pragma mark Button Action
- (void)ratingButtonTapped:(UIButton *)button {
    NSUInteger index = [self.ratingButtons indexOfObject:button];
    
    NSUInteger selectedRating = index + 1;
    
    if (selectedRating == self.rating) {
        self.rating = 0;
    } else {
        self.rating = selectedRating;
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:@"RATING_CHANGED" object:nil];
}

- (void)updateButtonSelectionStates {
    for (UIButton *button in self.ratingButtons) {
        NSUInteger index = [self.ratingButtons indexOfObject:button];
        if (index < self.rating) {
            [button setSelected:YES];
        } else {
            [button setSelected:NO];
        }
        NSString *hintString;
        if (self.rating == index + 1) {
            hintString = @"Tap to reset the rating to zero";
        } else {
            hintString = nil;
        }
        
        NSString *valueString;
        switch(self.rating) {
            case 0:
                valueString = @"No rating set";
            case 1:
                valueString = @"1 star set";
            default:
                valueString = [NSString stringWithFormat:@"%li stars set", (long)self.rating];
                
        }
        
        button.accessibilityHint = hintString;
        button.accessibilityValue = valueString;
    }
}

@end
