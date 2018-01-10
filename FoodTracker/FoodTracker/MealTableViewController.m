//
//  MealTableViewController.m
//  FoodTracker
//
//  Created by Frank de V on 09/01/2018.
//  Copyright © 2018 Frank de V. All rights reserved.
//

#import "MealTableViewController.h"

@interface MealTableViewController ()

@end

@implementation MealTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Use the edit button item provided by the table view controller
    [self.navigationItem setLeftBarButtonItem:self.editButtonItem];
    
    // Load the sample data.
    [self loadSampleMeals];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.meals.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MealTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MealTableViewCell" forIndexPath:indexPath];
    
    Meal *meal = self.meals[indexPath.row];
    cell.nameLabel.text = meal.name;
    cell.photoImageView.image = meal.photo;
    cell.ratingControl.rating = meal.rating;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"RATING_CHANGED" object:nil];
    
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.meals removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [super prepareForSegue:segue sender:sender];
    
    if ([segue.identifier isEqualToString:@"AddItem"]) {
        NSLog(@"Adding a new meal.");
    } else if ([segue.identifier isEqualToString:@"ShowDetail"]) {
        if ([segue.destinationViewController isKindOfClass:MealViewController.class]) {
            MealViewController *mealDetailViewController = segue.destinationViewController;
            if ([sender isKindOfClass:MealTableViewCell.class]) {
                MealTableViewCell *selectedMealCell = sender;
                NSIndexPath *indexPath = [self.tableView indexPathForCell:selectedMealCell];
                
                Meal *selectedMeal = self.meals[indexPath.row];
                mealDetailViewController.meal = selectedMeal;
            }
        }
    }
}


#pragma mark - Actions

- (IBAction)unwindToMealList:(UIStoryboardSegue *)sender {
    if ([sender.sourceViewController isKindOfClass:MealViewController.class]) {
        MealViewController *sourceViewController = sender.sourceViewController;
        Meal *meal = sourceViewController.meal;
        
        NSIndexPath *selectedIndexPath = self.tableView.indexPathForSelectedRow;
        if (selectedIndexPath != nil) {
            //Update existing meal
            self.meals[selectedIndexPath.row] = meal;
            [self.tableView reloadRowsAtIndexPaths:@[selectedIndexPath] withRowAnimation:UITableViewRowAnimationNone];
        } else {
            // Add a new meal
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.meals.count inSection:0];
            [self.meals addObject:meal];
            [self.tableView insertRowsAtIndexPaths:@[indexPath ]withRowAnimation:UITableViewRowAnimationAutomatic];
        }
    }
}

#pragma mark - Private methods

- (void)loadSampleMeals {
    UIImage *photo1 = [UIImage imageNamed:@"meal1"];
    UIImage *photo2 = [UIImage imageNamed:@"meal2"];
    UIImage *photo3 = [UIImage imageNamed:@"meal3"];
    
    Meal *meal1 = [[Meal alloc]init:@"Caprese Salad" withPhoto:photo1 withRating:4];
    Meal *meal2 = [[Meal alloc]init:@"Chicken and Potatoes" withPhoto:photo2 withRating:5];
    Meal *meal3 = [[Meal alloc]init:@"Pasta with Meatballs" withPhoto:photo3 withRating:3];
    
    self.meals = [[NSMutableArray alloc]init];
    [self.meals addObjectsFromArray:@[meal1, meal2, meal3]];
    
}

@end
