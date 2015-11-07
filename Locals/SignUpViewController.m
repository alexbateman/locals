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

@interface SignUpViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *password;

@end

@implementation SignUpViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.email.delegate = self;
    self.password.delegate = self;
    
     [FirebaseController login:@"bateman311@gmail.com" password:@"locals123"];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.email resignFirstResponder];
    [self.password resignFirstResponder];
    return YES;
}
- (IBAction)nextButton:(id)sender {
    
    [FirebaseController login:self.email.text password:self.password.text];
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
