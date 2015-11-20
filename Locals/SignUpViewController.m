//
//  SignUpViewController.m
//  Locals
//
//  Created by Alexander on 11/5/15.
//  Copyright © 2015 Alex Bateman. All rights reserved.
//

#import "SignUpViewController.h"
#import "FirebaseController.h"
#import "UserController.h"
#import "User.h"

@interface SignUpViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *password;

@end

@implementation SignUpViewController

#warning add dismiss keyboard with tap outside
//TODO: add dismiss keyboard with tap outside

- (IBAction)signUpButton:(id)sender {
    
    [FirebaseController createAccount:self.email.text password:self.password.text completion:^(bool success) {
        if (success) {
            
            [UserController sharedInstance].isLoggedIn = YES;
            [self performSegueWithIdentifier:@"signUpComplete" sender:nil];
            
        } else {
            
            [self signUpErrorMessage:[UserController sharedInstance].signUpMessage];
        }
    }];
    
   // [FirebaseController createAccount:self.email.text password:self.password.text];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.email.delegate = self;
    self.password.delegate = self;
    
   // [self.navigationController setNavigationBarHidden:YES animated:YES]; 
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.email resignFirstResponder];
    [self.password resignFirstResponder];
    return YES;
}
- (IBAction)nextButton:(id)sender {
    if ([FirebaseController currentUserUID]) {
        NSLog(@"I'm already logged in");
    } else {
    [FirebaseController login:self.email.text password:self.password.text];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)signUpErrorMessage:(NSString *)message{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *dismissAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
    
    [alertController addAction:dismissAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
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
