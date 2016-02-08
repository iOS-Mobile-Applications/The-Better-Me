//
//  HomeViewController.m
//  The Better Me
//
//  Created by Dimitar Dzhurenov on 2/3/16.
//  Copyright © 2016 Dimitar Dzhurenov. All rights reserved.
//

#import "HomeViewController.h"
#import "BackgroundGradient.h"
#import "MealModel.h"
#import "SoundManager.h"
#import <AudioToolbox/AudioToolbox.h>
#import "HomeTableViewCell.h"
#import "MealDetailsViewController.h"
#import <Parse/Parse.h>

@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;

@end

@implementation HomeViewController

NSArray *data;
MealModel *selectedValue;

- (void)viewDidLoad {
    [super viewDidLoad];
    BackgroundGradient *gradient = [[BackgroundGradient alloc] init];
    
    [gradient setBackgroundGradientWithFrame:self.view.bounds andLayer:self.view.layer];
    
    data = [self getFiltredData];
    [self.mainTableView reloadData];
    
    self.mainTableView.dataSource = self;
    self.mainTableView.delegate = self;
    
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(prepareForSegue:sender:)];
    tapRecognizer.numberOfTapsRequired = 2;
    tapRecognizer.numberOfTouchesRequired = 1;
    [self.mainTableView addGestureRecognizer:tapRecognizer];
}

-(void)viewWillAppear:(BOOL)animated {
    [self.mainTableView reloadData];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    SoundManager *manager = [[SoundManager alloc] initSound];
    SystemSoundID toneSSID = manager.sound;
    AudioServicesPlaySystemSound(toneSSID);
    
    MealDetailsViewController *toVC = segue.destinationViewController;
    toVC.details = [selectedValue productsCollection];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HomeTableViewCell" owner:self options:nil] objectAtIndex:0];
    }
    
    cell.homeCellTimeLabel.text = [data[indexPath.row] mealTime];
    cell.homeCellTypeLabel.text = @"Meal";
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return data.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    selectedValue = [data objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"segueShowDetails" sender:tableView];
}

-(NSArray *)getFiltredData {
    PFUser *currentUser = [PFUser currentUser];
    
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *today = [dateFormatter stringFromDate:[NSDate date]];
    
    PFQuery *query = [PFQuery queryWithClassName:@"MealModel"];
    [query whereKey:@"creator" equalTo:currentUser.username];
    [query whereKey:@"mealDate" equalTo:today];
    [query orderByAscending:@"mealTime"];

    [self.mainTableView reloadData];
    
    return [query findObjects];
}

@end
