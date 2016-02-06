//
//  RegisterViewController.m
//  The Better Me
//
//  Created by Dimitar Dzhurenov on 2/3/16.
//  Copyright © 2016 Dimitar Dzhurenov. All rights reserved.
//

#import "RegisterViewController.h"
#import "InternetConnectionController.h"
#import "UserConstants.h"
#import "BackgroundGradient.h"
#import "The_Better_Me-Swift.h"
#import <Parse/Parse.h>

@interface RegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *confirmPasswordTextField;

- (IBAction)registerButton:(id)sender;

@end

@implementation RegisterViewController

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

- (IBAction)registerButton:(id)sender {
    NSString *status = [internetChecker getConnectionStatus];
    
    if ([status isEqualToString:@"Not connected"]) {
        [self showAlertWithTitle:@"Not connected" andMessage:@"Please, enable internet connection"];
    } else {
        NSString *username = self.usernameTextField.text;
        NSString *firstName = self.firstNameTextField.text;
        NSString *lastName = self.lastNameTextField.text;
        NSString *password = self.passwordTextField.text;
        NSString *confirmPassword = self.confirmPasswordTextField.text;
        
        Validator *validator = [[Validator alloc] init];
        
        if ([validator isValidStringLength:firstName min:UserFirstnameMinLenght max:UserFirstnameMaxLength]) {
            [self showAlertWithTitle:@"Invalid first name" andMessage:InvalidFirstnameMessage];
        } else if ([validator isValidStringLength:lastName min:UserLastnameMinLength max:UserLastnameMaxLength]) {
            [self showAlertWithTitle:@"Invalid last name" andMessage:InvalidLastNameMessage];
        } else if ([validator isValidStringLength:username min:UserUsernameMinLength max:UserUsernameMaxLength]) {
            [self showAlertWithTitle:@"Invalid username" andMessage:InvalidUsernameMessage];
        } else if ([validator isValidStringLength:password min:UserPasswordMinLength max:UserPasswordMaxLength]) {
            [self showAlertWithTitle:@"Invalid password" andMessage:InvalidPasswordMessage];
        } else if (![password isEqualToString:confirmPassword]) {
            [self showAlertWithTitle:@"Invalid confirm password" andMessage:InvalidConfirmPasswordMessage];
        } else {
            PFUser *user = [PFUser user];
            user.username = username;
            user.email = [NSString stringWithFormat:@"%@@yahoo.com", username];
            user.password = password;
            
            user[@"firstName"] = firstName;
            user[@"lastName"] = lastName;
            user[@"isFirstTime"] = @"true";
            
            UIActivityIndicatorView *mySpinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
            mySpinner.center = CGPointMake(160, 490);
            mySpinner.color = [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0];
            mySpinner.hidesWhenStopped = YES;
            [self.view addSubview:mySpinner];
            [mySpinner startAnimating];
            
            [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
                if (!error) {
                    [mySpinner stopAnimating];
                    [mySpinner hidesWhenStopped];
                    
                    [self showAlertWithTitle:@"Successfully registered" andMessage:nil];
                    [self performSegueWithIdentifier:@"fromRegisterToLogin" sender:self];
                } else {
                    [mySpinner stopAnimating];
                    [mySpinner hidesWhenStopped];
                    
                    NSString *errorString = [error userInfo][@"error"];
                    [self showAlertWithTitle:@"Ops, something went wrong" andMessage:errorString];
                }
            }];
        }
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
