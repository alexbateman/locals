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
+ (void)Login;
+ (void)createAccount;


+(void) creatAccount:(NSString *)userEmail password:(NSString *)password;
+(void) login:(NSString *)userEmail password:(NSString *)password;

@end
