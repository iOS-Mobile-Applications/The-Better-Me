//
//  UserConstants.h
//  The Better Me
//
//  Created by Dimitar Dzhurenov on 2/3/16.
//  Copyright © 2016 Dimitar Dzhurenov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserConstants : NSObject

extern NSInteger const UserUsernameMinLength;
extern NSInteger const UserUsernameMaxLength;

extern NSInteger const UserFirstnameMinLenght;
extern NSInteger const UserFirstnameMaxLength;

extern NSInteger const UserLastnameMinLength;
extern NSInteger const UserLastnameMaxLength;

extern NSInteger const UserPasswordMinLength;
extern NSInteger const UserPasswordMaxLength;

extern NSInteger const UserMinHeight;
extern NSInteger const UserMaxHeight;

extern NSInteger const UserMinAge;
extern NSInteger const UserMaxAge;

extern double const UserMinWeight;
extern double const UserMaxWeight;

extern double const UserPhysicalActivityMinValue;
extern double const UserPhysicalActivityMaxValue;

extern NSString *const InvalidUsernameMessage;
extern NSString *const InvalidFirstnameMessage;
extern NSString *const InvalidLastNameMessage;
extern NSString *const InvalidPasswordMessage;
extern NSString *const InvalidConfirmPasswordMessage;
extern NSString *const InvalidHeightMessage;
extern NSString *const InvalidAgeMessage;
extern NSString *const InvalidWeightMessage;
extern NSString *const InvalidPhysicalActivityMessage;

@end
