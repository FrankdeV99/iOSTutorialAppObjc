//
//  ViewController.m
//  FoodTracker
//
//  Created by Frank de V on 07/01/2018.
//  Copyright © 2018 Frank de V. All rights reserved.
//

#import "MealViewController.h"
#import <os/log.h>

@interface MealViewController ()

@end

@implementation MealViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Handle the text field's user input through delegate callbacks.
    self.nameTextField.delegate = self;
    
    //Set up views if editing an existing meal.
    Meal *meal = self.meal;
    if (meal != nil) {
        self.navigationItem.title = meal.name;
        self.nameTextField.text = meal.name;
        self.photoImageView.image = meal.photo;
        self.ratingControl.rating = meal.rating;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"RATING_CHANGED" object:nil];
    }
    
    // Enable the save button only if the text field has a valid meal name
    [self updateSaveButtonState];
}

#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    //Hide the keyboard
    [textField resignFirstResponder];
    
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [self.saveButton setEnabled:NO];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [self updateSaveButtonState];
    self.navigationItem.title = textField.text;
}

#pragma mark UIImagePickerControllerDelegate

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    // Dismiss the picker if the user canceled
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    // The info dictionary may contain multiple representations of the image. You want to use the original.
    UIImage *selectedImage = info[UIImagePickerControllerOriginalImage];

    // Set photoImageView to display the selected image
    [self.photoImageView setImage:selectedImage];
    // Dismiss the picker
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark Actions


- (IBAction)selectImageFromPhotoLibrary:(UITapGestureRecognizer *)sender {
    // Hide the keyboard
    [self.nameTextField resignFirstResponder];
    
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc]init];
    imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    // Make sure ViewController is notified when the user picks an image
    imagePickerController.delegate = self;
    [self presentViewController:imagePickerController animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Navigation
- (IBAction)cancel:(UIBarButtonItem *)sender {
    // Depending on style of presentation (modal or push presentation), this view controller
    // needs to be dismissed in two different ways
    if ([self.presentingViewController isKindOfClass:UINavigationController.class]) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [super prepareForSegue:segue sender:sender];
    
    if (![sender isEqual:self.saveButton]) {
        NSLog(@"The savebutton was not pressed, cancelling");
        
        return;
    }
    
    NSString *name = self.nameTextField.text;
    UIImage *photo = self.photoImageView.image;
    NSInteger rating = self.ratingControl.rating;
    
    self.meal = [[Meal alloc]init:name withPhoto:photo withRating:rating];
    
}

#pragma mark Private Methods

- (void)updateSaveButtonState {
    NSString *text = self.nameTextField.text;
    [self.saveButton setEnabled:![text isEqualToString:@""]];
}


@end
