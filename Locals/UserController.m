//
//  ProfileController.m
//  Locals
//
//  Created by Alex Bateman on 10/14/15.
//  Copyright © 2015 Alex Bateman. All rights reserved.
//

#import "UserController.h"
#import "FirebaseController.h"

@interface UserController()

@property (strong, nonatomic)User *currentUser;

@end

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



#pragma create

-(User *)createUser:(NSString *)email uid:(NSString *)UID {
    
    User *user = [User new];
    user.email = email;
    user.UID = UID;
    
    self.currentUser = user;
    
    return user;
    
}

- (void)setCurrentUser:(NSDictionary *)dictionary {
    
    User *currentUser = [[User alloc] initWithDictionary:dictionary];
    self.currentUser = currentUser;
}

- (void)saveCurrentUser {
    [[FirebaseController userProfile] setValue:self.currentUser.dictionaryRepresentation];
    
}

@end
