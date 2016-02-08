//
//  MealDetailsViewController.m
//  The Better Me
//
//  Created by Dimitar Dzhurenov on 2/8/16.
//  Copyright © 2016 Dimitar Dzhurenov. All rights reserved.
//

#import "MealDetailsViewController.h"
#import "BackgroundGradient.h"

@interface MealDetailsViewController ()
@property (weak, nonatomic) IBOutlet UITableView *detailsTableView;

@end

@implementation MealDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    BackgroundGradient *gradient = [[BackgroundGradient alloc] init];
    
    [gradient setBackgroundGradientWithFrame:self.view.bounds andLayer:self.view.layer];
    
    self.detailsTableView.dataSource = self;
    self.detailsTableView.delegate = self;
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellIdentifier"];
    }
    
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = self.details[indexPath.row];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.details.count;
}

@end
