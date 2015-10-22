//
//  LProfile.m
//  Locals
//
//  Created by Alex Bateman on 10/13/15.
//  Copyright © 2015 Alex Bateman. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype)initWithDictionary:(NSDictionary *)dictionary

{
    self = [super init];
    if (self) {
        self.email = dictionary[EmailKey];
        self.password  = dictionary[PasswordKey];
        self.firstName = dictionary[FirstNameKey];
        self.city = dictionary[CityKey];
        self.profileImage = dictionary[ProfileImageKey];
        self.bio = dictionary[BioKey];
        
    }
    return self;
}
- (NSDictionary *)dictionaryRepresentation {
    NSDictionary *dictionary = @{
                                 EmailKey : self.email,
                                 PasswordKey : self.password,
                                 FirstNameKey : self.firstName,
                                 CityKey : self.city,
                                 ProfileImageKey : self.profileImage,
                                 BioKey : self.bio,
                                 };
    
    return dictionary;

}

@end
