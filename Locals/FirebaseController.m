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

+ (void)createAccount:(NSString *)userEmail password:(NSString *)password{
    
    [self.base createUser:userEmail password:password withValueCompletionBlock:^(NSError *error, NSDictionary *result) {
        if (error) {
            // There was an error creating the account
            NSLog(@"%@",error);
        } else {
            NSString *uid = [result objectForKey:@"uid"];
            NSLog(@"Successfully created user account with uid: %@", uid);
            
        }
    }];
 
}

+(void) login:(NSString *)userEmail password:(NSString *)password {
    
    [self.base authUser:userEmail password:password withCompletionBlock:^(NSError *error, FAuthData *authData) {
        NSLog(@"%@",authData);
    }];
}

+ (NSString *) currentUserUID {
    return [FirebaseController base].authData.uid;
}





@end
