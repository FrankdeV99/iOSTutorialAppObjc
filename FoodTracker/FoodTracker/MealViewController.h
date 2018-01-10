//
//  ViewController.h
//  FoodTracker
//
//  Created by Frank de V on 07/01/2018.
//  Copyright © 2018 Frank de V. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RatingControl.h"
#import "Meal.h"

@interface MealViewController : UIViewController<UITextFieldDelegate, UIImagePickerControllerDelegate>

#pragma mark Properties

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;
@property (weak, nonatomic) IBOutlet RatingControl *ratingControl;
/*
 This value is either passed by `MealTableViewController` in `perpare(for:sender)` or 
 constructed as part of adding a new meal.
 */
@property (nonatomic) Meal *meal;


@end

