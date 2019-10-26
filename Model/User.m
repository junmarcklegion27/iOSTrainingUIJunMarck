//
//  User.m
//  iOSTrainingUI
//
//  Created by OPS on 10/25/19.
//  Copyright © 2019 OPSolutions. All rights reserved.
//

#import "User.h"

@interface User () <NSCoding>

@end

@implementation User

- (instancetype)initWithEmail:(NSString *)email {
    self = [super init];
    if (self) {
        _email = email;
    }
    return self;
}


- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeObject:_phone forKey:@"phone"];
    [aCoder encodeObject:_email forKey:@"email"];
    [aCoder encodeObject:_password forKey:@"password"];
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    if (self = [super init]) {
        _name = [aDecoder decodeObjectForKey:@"name"];
        _phone = [aDecoder decodeObjectForKey:@"name"];
        _email = [aDecoder decodeObjectForKey:@"name"];
        _password = [aDecoder decodeObjectForKey:@"name"];
    }
    return self;
}

@end
