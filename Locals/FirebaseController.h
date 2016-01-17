//
//  FirebaseController.h
//  Locals
//
//  Created by Alex Bateman on 10/17/15.
//  Copyright © 2015 Alex Bateman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FireBase/Firebase.h"

@interface FirebaseController : NSObject

+ (Firebase *)base;
+(void) createAccount:(NSString *)userEmail password:(NSString *)password completion:(void (^)(bool success))completion;
+(void) login:(NSString *)userEmail password:(NSString *)password completion:(void (^)(bool success))completion;
+ (NSString *) currentUserUID;
+ (Firebase *)userProfile;
+ (Firebase *) usersFirebase;
+ (void)fetchCurrentUser;
+ (void) logout;


@end
