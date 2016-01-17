//
//  UserController.m
//  Locals
//
//  Created by Alex Bateman on 10/14/15.
//  Copyright © 2015 Alex Bateman. All rights reserved.
//

#import "UserController.h"
#import "FirebaseController.h"
#import "User.h"


@interface UserController()

@property (strong, nonatomic)User *currentUserProfile;

@property (strong, nonatomic) NSArray *locals;

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

- (void)loadUsersWithCompletion:(void (^)())completion {
    [[FirebaseController usersFirebase] observeEventType:FEventTypeValue withBlock:^(FDataSnapshot *snapshot) {
        NSDictionary *userDictionaries = snapshot.value;
        NSArray *userIDs = userDictionaries.allKeys;
        
        NSMutableArray *usersMutable = [NSMutableArray array];
        for (NSString *key in userIDs) {
            NSDictionary *userDictionary = userDictionaries[key];
            
            User *user = [[User alloc] initWithDictionary: userDictionary];
            
            if (user.firstName && ![user.firstName isEqualToString:@""]) {
                [usersMutable addObject:user];
            }
        }
        
        NSArray *sortedUsers = [[NSArray alloc]initWithArray:usersMutable];
        self.locals = sortedUsers;
        
        completion();
    }];
}

#pragma create

-(User *)createUser: (User *)user {
    
    self.currentUserProfile = user;
    [self saveCurrentUser];
    return user;
    
}

- (void)setCurrentUser:(NSDictionary *)dictionary {
    
    User *currentUser = [[User alloc] initWithDictionary:dictionary];
    self.currentUserProfile = currentUser;
}


- (void)saveCurrentUser {
    [[FirebaseController userProfile] setValue:[self.currentUserProfile dictionaryRepresentation]];
}





@end
