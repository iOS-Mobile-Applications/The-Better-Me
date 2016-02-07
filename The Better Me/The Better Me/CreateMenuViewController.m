//
//  CreateMenuViewController.m
//  The Better Me
//
//  Created by Dimitar Dzhurenov on 2/3/16.
//  Copyright © 2016 Dimitar Dzhurenov. All rights reserved.
//

#import "CreateMenuViewController.h"
#import "BackgroundGradient.h"

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

NSArray *foodData;
NSMutableArray *meal;

NSString *theDate;
NSString *theTime;

NSString *productName;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    BackgroundGradient *gradient = [[BackgroundGradient alloc] init];
    
    [gradient setBackgroundGradientWithFrame:self.view.bounds andLayer:self.view.layer];
    
    // TODO: Load data from Parse.com
    foodData = @[@"Eggs", @"Milk", @"Bananas", @"Chicken breasts", @"Rise", @"Potatoes", @"Tomate"];
    
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
    
    
    
    NSLog(@"%@", theDate);
    NSLog(@"%@", productName);
    NSLog(@"%@", theTime);
}

- (IBAction)saveMealButton:(id)sender {
}
@end
