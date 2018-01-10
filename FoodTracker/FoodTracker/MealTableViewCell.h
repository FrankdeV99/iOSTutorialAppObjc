//
//  MealTableViewCell.h
//  FoodTracker
//
//  Created by Frank de V on 09/01/2018.
//  Copyright © 2018 Frank de V. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RatingControl.h"

@interface MealTableViewCell : UITableViewCell

#pragma mark Properties

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet RatingControl *ratingControl;


@end
