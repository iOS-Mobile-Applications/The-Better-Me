//
//  CreateMenuViewController.m
//  The Better Me
//
//  Created by Dimitar Dzhurenov on 2/3/16.
//  Copyright © 2016 Dimitar Dzhurenov. All rights reserved.
//

#import "CreateMenuViewController.h"
#import "BackgroundGradient.h"
#import "MealModel.h"

@interface CreateMenuViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UIDatePicker *timePicker;
@property (weak, nonatomic) IBOutlet UIPickerView *foodPicker;
@property (weak, nonatomic) IBOutlet UITextField *productQuantityTextField;
@property (weak, nonatomic) IBOutlet UILabel *addedProductLabel;

- (IBAction)addProductButton:(id)sender;
- (IBAction)saveMealButton:(id)sender;

@end

@implementation CreateMenuViewController

static UIAlertController *alertView;

NSArray *foodData;
NSMutableArray *productsCollection;

NSString *theDate;
NSString *theTime;

NSString *productName;

- (void)viewDidLoad {
    [super viewDidLoad];
    productsCollection = [[NSMutableArray alloc] init];
    
    BackgroundGradient *gradient = [[BackgroundGradient alloc] init];
    
    [gradient setBackgroundGradientWithFrame:self.view.bounds andLayer:self.view.layer];
    
    // Load data from Parse.com
    PFQuery *query = [PFQuery queryWithClassName:@"Food"];
    [query selectKeys:@[@"name"]];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        for (NSInteger i = 0; i < 10; i++) {
            NSString *product = [NSString stringWithFormat:@"%@",[[objects valueForKey:@"name"] objectAtIndex:i]];
            NSLog(@"%@", product);
            //[foodData addObject:product];
            
            [self.foodPicker reloadAllComponents];
        }
        
    }];
    
    foodData = @[@"lamb steak", @"chicken breast", @"tomato", @"avocado", @"pine apple", @"bread", @"eggs", @"milk", @"cheese"];
    
    self.foodPicker.dataSource = self;
    self.foodPicker.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// The number of columns of data
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// The number of rows of data
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return foodData.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return foodData[row];
}

// Catpure the picker view selection
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    productName = foodData[row];
}

- (IBAction)addProductButton:(id)sender {
    NSDate *date = self.datePicker.date;
    NSDate *time = self.timePicker.date;
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    theDate = [dateFormat stringFromDate:date];
    
    [dateFormat setDateFormat:@"hh:mm"];
    theTime = [dateFormat stringFromDate:time];
    
    NSString *productData = [NSString stringWithFormat:@"%@ - %@gr", productName, self.productQuantityTextField.text];
    
    [productsCollection addObject:productData];
    self.productQuantityTextField.text = @"";
    self.addedProductLabel.text = [NSString stringWithFormat:@"%lu Products Added", (unsigned long)productsCollection.count];
}

- (IBAction)saveMealButton:(id)sender {
    PFUser *currentUser = [PFUser currentUser];
    MealModel *meal = [[MealModel alloc] initWithDate:theDate
                                              andTime:theTime
                                          andProducts:productsCollection
                                           andCreator:currentUser.username];
    
    [meal saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        if (succeeded) {
            [self showAlertWithTitle:@"Wohoo" andMessage:@"You added new meal successfully"];
        } else {
            [self showAlertWithTitle:@"Ops, something went wrong" andMessage:@""];
        }
    }];
    
    
}

-(void)showAlertWithTitle:(NSString *)title
               andMessage:(NSString *)message {
    alertView = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"OK"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             [alertView dismissViewControllerAnimated:YES completion:nil];
                             
                         }];
    
    [alertView addAction:ok];
    
    [self presentViewController:alertView animated:YES completion:nil];
}
@end
