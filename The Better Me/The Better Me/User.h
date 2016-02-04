//
//  User.h
//  The Better Me
//
//  Created by Dimitar Dzhurenov on 2/3/16.
//  Copyright © 2016 Dimitar Dzhurenov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface User : NSObject

@property (strong, nonatomic) NSString *username;
@property (strong, nonatomic) NSString *firstname;
@property (strong, nonatomic) NSString *lastname;
@property NSInteger height;
@property NSInteger age;
@property CGFloat weight;
@property CGFloat physicalActivity;
@property NSInteger isMale;

-(instancetype) initWithUsername: (NSString *) username
                    andFirstname: (NSString *) firstname
                     andLastname: (NSString *) lastname
                       andHeight: (NSInteger) height
                          andAge: (NSInteger) age
                       andWeight: (CGFloat) weight
             andPhysicalActivity: (CGFloat) physicalActivity
                          andSex: (NSInteger) isMale;

-(void)setUsername:(NSString *)username;
-(void)setFirstname:(NSString *)firstname;
-(void)setLastname:(NSString *)lastname;
-(void)setHeight:(NSInteger)height;
-(void)setAge:(NSInteger)age;
-(void)setWeight:(CGFloat)weight;
-(void)setPhysicalActivity:(CGFloat)physicalActivity;
-(void)setIsMale:(NSInteger)isMale;

@end
