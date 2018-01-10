//
//  MealTableViewController.h
//  FoodTracker
//
//  Created by Frank de V on 09/01/2018.
//  Copyright © 2018 Frank de V. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Meal.h"
#import "MealTableViewCell.h"
#import "MealViewController.h"

@interface MealTableViewController : UITableViewController

#pragma mark Properties

@property (nonatomic) NSMutableArray *meals;

@end
