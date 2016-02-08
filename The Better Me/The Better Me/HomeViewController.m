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
#import "HomeTableViewCell.h"
#import <Parse/Parse.h>

@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;

@end

@implementation HomeViewController

NSArray *data;

- (void)viewDidLoad {
    [super viewDidLoad];    
    BackgroundGradient *gradient = [[BackgroundGradient alloc] init];
    
    [gradient setBackgroundGradientWithFrame:self.view.bounds andLayer:self.view.layer];
    
    data = [self getFiltredData];
    
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSLog(@"%@",[dateFormatter stringFromDate:[NSDate date]]);
    
    self.mainTableView.dataSource = self;
    self.mainTableView.delegate = self;
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

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HomeTableViewCell" owner:self options:nil] objectAtIndex:0];
        //cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellIdentifier"];
    }
    
    cell.homeCellTimeLabel.text = [data[indexPath.row] mealTime];
    cell.homeCellTypeLabel.text = @"Meal";
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return data.count;
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

    return [query findObjects];
}

@end
