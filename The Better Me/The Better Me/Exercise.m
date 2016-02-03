//
//  Exercise.m
//  The Better Me
//
//  Created by Dimitar Dzhurenov on 2/3/16.
//  Copyright © 2016 Dimitar Dzhurenov. All rights reserved.
//

#import "Exercise.h"
#import "ExerciseConstants.h"
#import "The_Better_Me-Swift.h"

@implementation Exercise

NSString *_exerciseName;
double _weight;
NSInteger _reps;
NSInteger _series;
NSInteger _rest;

-(instancetype)initWithExerciseName:(NSString *)exerciseName
                          andWeight:(double)weight
                            andReps:(NSInteger)reps
                          andSeries:(NSInteger)series
                            andRest:(NSInteger)rest
                     andDateAndTime:(NSDate *)dateAndTime {
    self = [super init];
    if (self) {
        self.exerciseName = exerciseName;
        self.weight = weight;
        self.series = series;
        self.rest = rest;
        self.dateAndTime = dateAndTime;
    }
    
    return self;
}

// ExerciseName
-(NSString *)exerciseName {
    return _exerciseName;
}

-(void)setExerciseName:(NSString *)exerciseName {
    Validator *validator = [[Validator alloc] init];
    BOOL isInvalid = [validator isValidStringLength:exerciseName
                                                min:ExerciseNameMinLength
                                                max:ExerciseNameMaxLength];
    if (isInvalid) {
        NSException *ex = [[NSException alloc] initWithName:@"Exercise name length is out of range"
                                                     reason:InvalidExerciseNameMessage
                                                   userInfo:nil];
        [ex raise];
    }
    
    _exerciseName = exerciseName;
}

// Weight
-(double)weight {
    return _weight;
}

-(void)setWeight:(double)weight {
    Validator *validator = [[Validator alloc] init];
    BOOL isInvalid = [validator isValidDoubleRange:weight
                                                min:ExerciseMinWeight
                                                max:ExerciseMaxWeight];
    if (isInvalid) {
        NSException *ex = [[NSException alloc] initWithName:@"Weight value is out of range"
                                                     reason:InvalidExerciseWeightMessage
                                                   userInfo:nil];
        [ex raise];
    }
    
    _weight = weight;
}

// Reps
-(NSInteger)reps {
    return _reps;
}

-(void)setReps:(NSInteger)reps {
    Validator *validator = [[Validator alloc] init];
    BOOL isInvalid = [validator isValidIntegerRange:reps
                                                min:ExerciseMinReps
                                                max:ExerciseMaxReps];
    if (isInvalid) {
        NSException *ex = [[NSException alloc] initWithName:@"Reps value is out of range"
                                                     reason:InvalidExerciseRepsMessage
                                                   userInfo:nil];
        [ex raise];
    }
    
    _reps = reps;
}

// Series
-(NSInteger)series {
    return _series;
}

-(void)setSeries:(NSInteger)series {
    Validator *validator = [[Validator alloc] init];
    BOOL isInvalid = [validator isValidIntegerRange:series
                                                min:ExerciseMinSeries
                                                max:ExerciseMaxSeries];
    if (isInvalid) {
        NSException *ex = [[NSException alloc] initWithName:@"Series value is out of range"
                                                     reason:InvalidExerciseSeriesMessage
                                                   userInfo:nil];
        [ex raise];
    }
    
    _series = series;
}

// Rest
-(NSInteger)rest {
    return _rest;
}

-(void)setRest:(NSInteger)rest {
    Validator *validator = [[Validator alloc] init];
    BOOL isInvalid = [validator isValidIntegerRange:rest
                                                min:ExerciseMinRestInSeconds
                                                max:ExerciseMaxRestInSeconds];
    if (isInvalid) {
        NSException *ex = [[NSException alloc] initWithName:@"Rest value is out of range"
                                                     reason:InvalidExerciseRestInSecondsMessage
                                                   userInfo:nil];
        [ex raise];
    }
    
    _rest = rest;

}

@end
