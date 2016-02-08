//
//  ProfileViewController.m
//  The Better Me
//
//  Created by Dimitar Dzhurenov on 2/3/16.
//  Copyright © 2016 Dimitar Dzhurenov. All rights reserved.
//

#import "ProfileViewController.h"
#import "BackgroundGradient.h"
#import <Parse/Parse.h>

@interface ProfileViewController ()
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *bmrLabel;
- (IBAction)logoutButton:(id)sender;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    BackgroundGradient *gradient = [[BackgroundGradient alloc] init];
    [gradient setBackgroundGradientWithFrame:self.view.bounds andLayer:self.view.layer];
    
    PFUser *currentUser = [PFUser currentUser];
    self.userNameLabel.text = [NSString stringWithFormat:@"%@", currentUser.username];
    self.bmrLabel.text = [NSString stringWithFormat:@"BMR: %d", (5 * 45) + 4 *(210 +10) + 345];
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

- (IBAction)logoutButton:(id)sender {
    [PFUser logOut];
    
}
@end
