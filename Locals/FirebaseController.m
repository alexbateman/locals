//
//  FirebaseController.m
//  Locals
//
//  Created by Alex Bateman on 10/17/15.
//  Copyright © 2015 Alex Bateman. All rights reserved.
//

#import "FirebaseController.h"
#import "User.h"
#import "UserController.h"

@implementation FirebaseController

+ (Firebase *)base {
    return [[Firebase alloc] initWithUrl:@"http://locals.firebaseIO.com"];
    
}

+ (void)createAccount:(NSString *)userEmail password:(NSString *)password completion:(void (^)(bool success))completion {
    
    
        [self.base authUser:userEmail password:password withCompletionBlock:^(NSError *error, FAuthData *authData) {
            NSLog(@"%@",authData);
    
            if (error) {
    
                NSLog(@"%@", error);
    
            } else {
                [FirebaseController userProfile];
                [FirebaseController fetchCurrentUser];
    
<<<<<<< HEAD
    [self.base authUser:userEmail password:password withCompletionBlock:^(NSError *error, FAuthData *authData) {
        
        
        //    [self.base createUser:userEmail password:password withValueCompletionBlock:^(NSError *error, NSDictionary *result) {
        //        if (error) {
        // There was an error creating the account
        
        if (error != nil) {
            // an error occurred while attempting login
           
            switch(error.code) {
                case FAuthenticationErrorUserDoesNotExist:
                    // Handle invalid user
                    [UserController sharedInstance].loginAlert = @"Invalid User";
                    [UserController sharedInstance].loginMessage = @"The specified user does not exist.";
                    break;
                    
                case FAuthenticationErrorInvalidEmail:
                    // Handle invalid email
                    [UserController sharedInstance].loginAlert = @"Invalid User";
                    [UserController sharedInstance].loginMessage = @"The specified user does not exist.";
                    break;
                    
                case FAuthenticationErrorInvalidPassword:
                    // Handle invalid password
                    [UserController sharedInstance].loginAlert = @"Invalid Password";
                    [UserController sharedInstance].loginMessage = @"The password does not match the user.";
                    break;
                default:
                    //you may not be connected to the internet.
                    [UserController sharedInstance].loginAlert = @"Error";
                    [UserController sharedInstance].loginMessage = @"An error occurred while attempting to connect.";
                    break;
=======
>>>>>>> parent of b44c035... login working... better than before at least
            }
            
         
        }];
}

+(void) login:(NSString *)userEmail password:(NSString *)password{
    
    [self.base createUser:userEmail password:password withValueCompletionBlock:^(NSError *error, NSDictionary *result) {
        if (error) {
            // There was an error creating the account
            
            if (error != nil) {
                // an error occurred while attempting login
                switch(error.code) {
                    case FAuthenticationErrorUserDoesNotExist:
                        // Handle invalid user
                        [UserController sharedInstance].loginAlert = @"Invalid User";
                        [UserController sharedInstance].loginMessage = @"The specified user does not exist.";
                        break;
                        
                    case FAuthenticationErrorInvalidEmail:
                        // Handle invalid email
                        [UserController sharedInstance].loginAlert = @"Invalid User";
                        [UserController sharedInstance].loginMessage = @"The specified user does not exist.";
                        break;
                        
                    case FAuthenticationErrorInvalidPassword:
                        // Handle invalid password
                        [UserController sharedInstance].loginAlert = @"Invalid Password";
                        [UserController sharedInstance].loginMessage = @"The password does not match the user.";
                        break;
                    default:
                        //you may not be connected to the internet.
                        [UserController sharedInstance].loginAlert = @"Error";
                        [UserController sharedInstance].loginMessage = @"An error occurred while attempting to connect.";
                        break;
                }
            }
            NSLog(@"%@",error);
        } else {
            [self login:userEmail password:password];
            
        }
    }];

    

 }


+ (Firebase *)userProfile {
    return [[[FirebaseController base] childByAppendingPath:@"UserProfile/"] childByAppendingPath:[FirebaseController currentUserUID]];
}

+ (NSString *) currentUserUID {
    return [FirebaseController base].authData.uid;
}

+ (void) logout {
    [[FirebaseController userProfile] unauth];
}


+ (void)fetchCurrentUser {
    [[FirebaseController userProfile] observeEventType:FEventTypeValue withBlock:^(FDataSnapshot *snapshot) {
        NSDictionary *userDictionary = [NSDictionary new];
        if ([snapshot.value isKindOfClass:[NSNull class]]) {
            User *user = [User new];
            User *newUserProfile = [[UserController sharedInstance] createUser:user];
            userDictionary = newUserProfile.dictionaryRepresentation;
            
        } else if([snapshot.value isKindOfClass:[NSDictionary class]]) {
            userDictionary = snapshot.value;
        }
        [[UserController sharedInstance] setCurrentUser:userDictionary];
        [[UserController sharedInstance] saveCurrentUser];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:currentProfileLoadedNotification object:nil];
    } withCancelBlock:^(NSError *error) {
        // Do nothing for now
        
    }];
    
}



@end


