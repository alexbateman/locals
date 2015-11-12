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



+ (void)createAccount:(NSString *)userEmail password:(NSString *)password{
    
    [self.base createUser:userEmail password:password withValueCompletionBlock:^(NSError *error, NSDictionary *result) {
        if (error) {
            // There was an error creating the account
            NSLog(@"%@",error);
        } else {
            [self login:userEmail password:password];
        }
    }];
 
}

+(void) login:(NSString *)userEmail password:(NSString *)password {
    
    [self.base authUser:userEmail password:password withCompletionBlock:^(NSError *error, FAuthData *authData) {
        NSLog(@"%@",authData);
        
        if (error) {
            
            NSLog(@"%@", error);
            
        } else {
            [FirebaseController userProfile];
        }
        
     
    }];
}

+ (Firebase *)userProfile {
    return [[[FirebaseController base] childByAppendingPath:@"UserProfile/"] childByAppendingPath:[FirebaseController currentUserUID]];
}


+ (NSString *) currentUserUID {
    return [FirebaseController base].authData.uid;
}

+ (void)fetchCurrentUser:(NSString *)email {
    [FirebaseController userProfile] observeEventType:FEventTypeValue withBlock:^(FDataSnapshot *snapshot) {
        NSDictionary *userDictionary;
        if ([snapshot.value isKindOfClass:[NSNull class]]) {
            User *newUserProfile = [[UserController sharedInstance] createUser:email uid:[self currentUserUID]];
            userDictionary = newUserProfile.dictionaryRepresentation;
            
        } else if([snapshot.value isKindOfClass:[NSDictionary class]]) {
            userDictionary = snapshot.value;
        }
        [[UserController sharedInstance] setCurrentUser:userDictionary];
        [[UserController sharedInstance] ]
            
        }
    }

}



@end
