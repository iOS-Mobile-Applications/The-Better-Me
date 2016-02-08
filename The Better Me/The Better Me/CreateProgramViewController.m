//
//  CreateProgramViewController.m
//  The Better Me
//
//  Created by Dimitar Dzhurenov on 2/3/16.
//  Copyright © 2016 Dimitar Dzhurenov. All rights reserved.
//

#import "CreateProgramViewController.h"
#import "BackgroundGradient.h"

@interface CreateProgramViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *programDatePicker;
@property (weak, nonatomic) IBOutlet UIPickerView *exerciseNamePicker;
@property (weak, nonatomic) IBOutlet UILabel *weightLabel;
@property (weak, nonatomic) IBOutlet UIStepper *weightStepper;
@property (weak, nonatomic) IBOutlet UILabel *repsLabel;
@property (weak, nonatomic) IBOutlet UIStepper *repsStepper;
@property (weak, nonatomic) IBOutlet UILabel *seriesLabel;
@property (weak, nonatomic) IBOutlet UIStepper *seriesStepper;
@property (weak, nonatomic) IBOutlet UILabel *restLabel;
@property (weak, nonatomic) IBOutlet UIStepper *restStepper;
- (IBAction)addExerciseButton:(id)sender;
- (IBAction)saveButton:(id)sender;



@end

@implementation CreateProgramViewController

NSArray *exerciseData;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    BackgroundGradient *gradient = [[BackgroundGradient alloc] init];
    [gradient setBackgroundGradientWithFrame:self.view.bounds andLayer:self.view.layer];
    
    exerciseData = @[@"Deadlift", @"Squat", @"Bech press", @"Barbel press", @"Push press", @"Jerks", @"Cleans"];
    
    self.exerciseNamePicker.dataSource = self;
    self.exerciseNamePicker.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

// The number of columns of data
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// The number of rows of data
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return exerciseData.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return exerciseData[row];
}

- (IBAction)addExerciseButton:(id)sender {
}

- (IBAction)saveButton:(id)sender {
}

@end
