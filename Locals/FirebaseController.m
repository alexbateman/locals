//
//  FirebaseController.m
//  Locals
//
//  Created by Alex Bateman on 10/17/15.
//  Copyright © 2015 Alex Bateman. All rights reserved.
//

#import "FirebaseController.h"
#import "User.h"

@implementation FirebaseController

+ (Firebase *)base {
    return [[Firebase alloc] initWithUrl:@"http://locals.firebaseIO.com"];
}

+ (void)createAccount {
    
[[self base] createUser:@"a" password:<#(NSString *)#> withCompletionBlock:<#^(NSError *error)block#>
    
    [[FirebaseController base] createUser:@"nil" password:@"nil"
                 withValueCompletionBlock:^(NSError *error, NSDictionary *result) {
                     if (error) {
                         // There was an error creating the account
                     } else {
                         
                         // Successfully created an account
                         
                         NSString *uid = [result objectForKey:@"uid"];
                         NSLog(@"Successfully created user account with uid: %@", uid);
                     }
                 }];
    
}

+ (void)Login {
    
    [[FirebaseController base] authUser:@"" password:@"" withCompletionBlock:^(NSError *error, FAuthData *authData) {
        //Code!
    }];
    
}




@end
