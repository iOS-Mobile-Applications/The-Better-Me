//
//  Exercise.h
//  The Better Me
//
//  Created by Dimitar Dzhurenov on 2/3/16.
//  Copyright © 2016 Dimitar Dzhurenov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Exercise : NSObject

@property (strong, nonatomic) NSString *exerciseName;
@property double weight;
@property NSInteger reps;
@property NSInteger series;
@property NSInteger rest;
@property NSDate *dateAndTime;

-(instancetype) initWithExerciseName: (NSString *) exerciseName
                           andWeight: (double) weight
                             andReps: (NSInteger) reps
                           andSeries: (NSInteger) series
                             andRest: (NSInteger) rest
                      andDateAndTime: (NSDate *) dateAndTime;

-(void)setExerciseName:(NSString *)exerciseName;
-(void)setWeight:(double)weight;
-(void)setReps:(NSInteger)reps;
-(void)setSeries:(NSInteger)series;
-(void)setRest:(NSInteger)rest;

@end
