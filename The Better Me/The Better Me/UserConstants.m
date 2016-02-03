//
//  UserConstants.m
//  The Better Me
//
//  Created by Dimitar Dzhurenov on 2/3/16.
//  Copyright © 2016 Dimitar Dzhurenov. All rights reserved.
//

#import "UserConstants.h"

@implementation UserConstants

NSInteger const UserUsernameMinLength = 6;
NSInteger const UserUsernameMaxLength = 20;

NSInteger const UserFirstnameMinLenght = 2;
NSInteger const UserFirstnameMaxLength = 15;

NSInteger const UserLastnameMinLength = 2;
NSInteger const UserLastnameMaxLength = 15;

NSInteger const UserMinHeight = 40;
NSInteger const UserMaxHeight = 300;

NSInteger const UserMinAge = 5;
NSInteger const UserMaxAge = 150;

double const UserMinWeight = 20;
double const UserMaxWeight = 250;

double const UserPhysicalActivityMinValue = 0;
double const UserPhysicalActivityMaxValue = 1.9;

NSString *const InvalidUsernameMessage = @"The username must be between 6 and 20 characters long";
NSString *const InvalidFirstnameMessage = @"The First name must be between 2 and 15 characters long";
NSString *const InvalidLastNameMessage = @"The Last name must be between 2 and 15 characters long";
NSString *const InvalidHeightMessage = @"The height must be between 40cm and 300cm";
NSString *const InvalidAgeMessage = @"The age must be between 5 and 150";
NSString *const InvalidWeightMessage = @"The weight mustc be between 20kg and 250kg";
NSString *const InvalidPhysicalActivityMessage = @"The physical activity must be a value between 0 and 1.9";

@end
