//
//  ProfileController.m
//  Locals
//
//  Created by Alex Bateman on 10/14/15.
//  Copyright © 2015 Alex Bateman. All rights reserved.
//

#import "UserController.h"
#import "FirebaseController.h"

@implementation UserController

+ (UserController *)sharedInstance {
    static UserController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [UserController
                          new];
    });
    return sharedInstance;
}

- (void)loadFromPersistantStorage {
    
    Firebase *base = [[Firebase alloc] initWithUrl:@"http://locals.firebaseIO.com/"];
    
    [base observeEventType:FEventTypeValue withBlock:^(FDataSnapshot *snapshot) {
        
    }];
}

#pragma create

//- (Entry *)createUserWithName:(NSString *)firstName

@end
