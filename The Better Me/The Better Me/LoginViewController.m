//
//  LoginViewController.m
//  The Better Me
//
//  Created by Dimitar Dzhurenov on 2/3/16.
//  Copyright © 2016 Dimitar Dzhurenov. All rights reserved.
//

#import "LoginViewController.h"
#import "InternetConnectionController.h"
#import "BackgroundGradient.h"
#import "SoundManager.h"
#import <AudioToolbox/AudioToolbox.h>
#import <Parse/Parse.h>

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameLoginTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordLoginTextField;

- (IBAction)loginButton:(id)sender;

@end

@implementation LoginViewController

static InternetConnectionController *internetChecker;
static UIAlertController *alertView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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


- (IBAction)loginButton:(id)sender {
    SoundManager *manager = [[SoundManager alloc] initSound];
    SystemSoundID toneSSID = manager.sound;
    AudioServicesPlaySystemSound(toneSSID);
    
    NSString *status = [internetChecker getConnectionStatus];
    
    if ([status isEqualToString:@"Not connected"]) {
        [self showAlertWithTitle:@"Not connected" andMessage:@"Please, enable internet connection"];
    } else {
        NSString *username = self.usernameLoginTextField.text;
        NSString *password = self.passwordLoginTextField.text;
        
        UIActivityIndicatorView *mySpinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        mySpinner.center = CGPointMake(200, 490);
        mySpinner.color = [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0];
        mySpinner.hidesWhenStopped = YES;
        [self.view addSubview:mySpinner];
        [mySpinner startAnimating];
        
        [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser * _Nullable user, NSError * _Nullable error) {
            if (user) {
                [mySpinner stopAnimating];
                [mySpinner hidesWhenStopped];
                
                [self performSegueWithIdentifier:@"fromLoginToHome" sender:self];
            } else {
                [mySpinner stopAnimating];
                [mySpinner hidesWhenStopped];
                
                NSString *errorString = [error userInfo][@"error"];
                [self showAlertWithTitle:@"Ops, something went wrong" andMessage:errorString];
            }
        }];
    }
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
