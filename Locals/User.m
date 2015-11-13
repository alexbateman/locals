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
        self.firstName = dictionary[FirstNameKey];
        self.city = dictionary[CityKey];
        self.profileImage = dictionary[ProfileImageKey];
        self.bio = dictionary[BioKey];
        
    }
    return self;
}
- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *dictionary = [NSMutableDictionary new];
    
    if (self.email) {
        [dictionary setObject:self.email forKey:EmailKey];
    }
    if (self.firstName) {
        [dictionary setObject:self.firstName forKey:FirstNameKey];
    }
    if (self.city) {
        [dictionary setObject:self.city forKey:CityKey];
    }
    if (self.profileImage) {
        [dictionary setObject:self.profileImage forKey:ProfileImageKey];
    }
    if (self.bio) {
        [dictionary setObject:self.bio forKey:BioKey];
    }
    
    return dictionary;

}

 @end
