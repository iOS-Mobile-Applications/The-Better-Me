//
//  User.m
//  The Better Me
//
//  Created by Dimitar Dzhurenov on 2/3/16.
//  Copyright © 2016 Dimitar Dzhurenov. All rights reserved.
//

#import "User.h"
#import "UserConstants.h"
#import "The_Better_Me-Swift.h"

@implementation User

NSString *_username;
NSString *_firstname;
NSString *_lastname;;
NSInteger _height;
NSInteger _age;
CGFloat _personWeight;
CGFloat _physicalActivity;
NSInteger _isMale;

-(instancetype)initWithUsername:(NSString *)username
                   andFirstname:(NSString *)firstname
                    andLastname:(NSString *)lastname
                      andHeight:(NSInteger)height
                         andAge:(NSInteger)age
                      andWeight:(CGFloat)weight
            andPhysicalActivity:(CGFloat)physicalActivity
                         andSex:(NSInteger)isMale {
    self = [super init];
    if (self) {
        self.username = username;
        self.firstname = firstname;
        self.lastname = lastname;
        self.height = height;
        self.age = age;
        self.weight = weight;
        self.physicalActivity = physicalActivity;
        self.isMale = isMale;
    }
    
    return self;
}

// Username
-(NSString *)username {
    return _username;
}

-(void)setUsername:(NSString *)username {
    Validator *validator = [[Validator alloc] init];
    BOOL isInvalid = [validator isValidStringLength:username
                                                min:UserUsernameMinLength
                                                max:UserUsernameMaxLength];
    
    if (isInvalid) {
        NSException *ex = [[NSException alloc] initWithName:@"Username length is out of range"
                                                     reason:InvalidUsernameMessage
                                                   userInfo:nil];
        [ex raise];
    }
    
    _username = username;
}

// Firstname
-(NSString *)firstname {
    return _firstname;
}

-(void)setFirstname:(NSString *)firstname {
    Validator *validator = [[Validator alloc] init];
    BOOL isInvalid = [validator isValidStringLength:firstname
                                                min:UserFirstnameMinLenght
                                                max:UserFirstnameMaxLength];
    if (isInvalid) {
        NSException *ex = [[NSException alloc] initWithName:@"First name length is out of range"
                                                     reason:InvalidFirstnameMessage
                                                   userInfo:nil];
        [ex raise];
    }
    
    _firstname = firstname;
}

// Lastname
-(NSString *)lastname {
    return _lastname;
}

-(void)setLastname:(NSString *)lastname {
    Validator *validator = [[Validator alloc] init];
    BOOL isInvalid = [validator isValidStringLength:lastname
                                                min:UserLastnameMinLength
                                                max:UserLastnameMaxLength];
    if (isInvalid) {
        NSException *ex = [[NSException alloc] initWithName:@"Last name length is out of range"
                                                     reason:InvalidLastNameMessage
                                                   userInfo:nil];
        [ex raise];
    }
    
    _lastname = lastname;
}

// Height
-(NSInteger)height {
    return _height;
}

-(void)setHeight:(NSInteger)height {
    Validator *validator = [[Validator alloc] init];
    BOOL isInvalid = [validator isValidIntegerRange:height
                                                min:UserMinHeight
                                                max:UserMaxHeight];
    if (isInvalid) {
        NSException *ex = [[NSException alloc] initWithName:@"Height is out of range"
                                                     reason:InvalidHeightMessage
                                                   userInfo:nil];
        [ex raise];
    }
    
    _height = height;
}

// Age
-(NSInteger)age {
    return _age;
}

-(void)setAge:(NSInteger)age {
    Validator *validator = [[Validator alloc] init];
    BOOL isInvalid = [validator isValidIntegerRange:age
                                                min:UserMinAge
                                                max:UserMaxAge];
    if (isInvalid) {
        NSException *ex = [[NSException alloc] initWithName:@"Age is out of range"
                                                     reason:InvalidAgeMessage
                                                   userInfo:nil];
        [ex raise];
    }
    
    _age = age;
}

// Weight
-(CGFloat)weight {
    return _personWeight;
}

-(void)setWeight:(CGFloat)weight {
    Validator *validator = [[Validator alloc] init];
    BOOL isInvalid = [validator isValidDoubleRange:weight
                                                min:UserMinWeight
                                                max:UserMaxWeight];
    if (isInvalid) {
        NSException *ex = [[NSException alloc] initWithName:@"Weight is out of range"
                                                     reason:InvalidWeightMessage
                                                   userInfo:nil];
        [ex raise];
    }
    
    _personWeight = weight;
}

// PhysicalActicity
-(CGFloat)physicalActivity {
    return _physicalActivity;
}

-(void)setPhysicalActivity:(CGFloat)physicalActivity {
    Validator *validator = [[Validator alloc] init];
    BOOL isInvalid = [validator isValidDoubleRange:physicalActivity
                                                min:UserPhysicalActivityMinValue
                                                max:UserPhysicalActivityMaxValue];
    if (isInvalid) {
        NSException *ex = [[NSException alloc] initWithName:@"Physical activity value is out of range"
                                                     reason:InvalidPhysicalActivityMessage
                                                   userInfo:nil];
        [ex raise];
    }
    
    _physicalActivity = physicalActivity;
}

@end
