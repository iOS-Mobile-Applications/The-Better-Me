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

@end

@implementation CreateProgramViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    BackgroundGradient *gradient = [[BackgroundGradient alloc] init];
    
    [gradient setBackgroundGradientWithFrame:self.view.bounds andLayer:self.view.layer];
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

@end
