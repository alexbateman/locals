//
//  SignUpViewController.m
//  Locals
//
//  Created by Alexander on 11/5/15.
//  Copyright © 2015 Alex Bateman. All rights reserved.
//

#import "SignUpViewController.h"
#import "User.h"

@interface SignUpViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *password;

@end

@implementation SignUpViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.email resignFirstResponder];
    [self.password resignFirstResponder];
    return YES;
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
