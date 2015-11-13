//
//  LProfile.h
//  Locals
//
//  Created by Alex Bateman on 10/13/15.
//  Copyright © 2015 Alex Bateman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"

static NSString * const EmailKey = @"email";
static NSString * const FirstNameKey = @"firstName";
static NSString * const CityKey = @"city";
static NSString * const ProfileImageKey = @"profileImage";
static NSString * const BioKey = @"bio";

@interface User : NSObject

@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) UIImage *profileImage;
@property (nonatomic, strong) NSString *bio;
@property (nonatomic, strong) NSString *UID;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
