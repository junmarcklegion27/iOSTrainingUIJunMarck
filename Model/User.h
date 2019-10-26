//
//  User.h
//  iOSTrainingUI
//
//  Created by OPS on 10/25/19.
//  Copyright © 2019 OPSolutions. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject

@property (nonatomic, assign) NSString *name;
@property (nonatomic, assign) NSString *phone;
@property (nonatomic, assign) NSString *email;
@property (nonatomic, assign) NSString *password;

- (instancetype)initWithEmail:(NSString *)email;

@end

NS_ASSUME_NONNULL_END
