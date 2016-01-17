//
//  UserController.h
//  Locals
//
//  Created by Alex Bateman on 10/14/15.
//  Copyright © 2015 Alex Bateman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

static NSString *currentProfileLoadedNotification = @"currentProfileLoaded";

@interface UserController : NSObject

@property (strong, nonatomic, readonly) NSArray *locals;
@property (strong, nonatomic, readonly)User *currentUserProfile;
@property (weak,nonatomic) NSString *signUpMessage;
@property (weak,nonatomic) NSString *loginAlert;
@property (weak,nonatomic) NSString *loginMessage;

+ (UserController *)sharedInstance;

- (void)loadUsersWithCompletion:(void (^)())completion;
- (User *)createUser: (User *)user;
- (void)setCurrentUser:(NSDictionary *)dictionary;
- (void)saveCurrentUser;

@end
