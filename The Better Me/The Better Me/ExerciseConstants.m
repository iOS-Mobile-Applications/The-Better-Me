//
//  ExerciseConstants.m
//  The Better Me
//
//  Created by Dimitar Dzhurenov on 2/3/16.
//  Copyright © 2016 Dimitar Dzhurenov. All rights reserved.
//

#import "ExerciseConstants.h"

@implementation ExerciseConstants

NSInteger const ExerciseNameMinLength = 3;
NSInteger const ExerciseNameMaxLength = 100;

double const ExerciseMinWeight = 0.25;
double const ExerciseMaxWeight = 400;

NSInteger const ExerciseMinReps = 1;
NSInteger const ExerciseMaxReps = 500;

NSInteger const ExerciseMinSeries = 1;
NSInteger const ExerciseMaxSeries = 30;

NSInteger const ExerciseMinRestInSeconds = 0;
NSInteger const ExerciseMaxRestInSeconds = 900;

NSString *const InvalidExerciseNameMessage = @"Exercise name must be between 3 and 100 characters";
NSString *const InvalidExerciseWeightMessage = @"Weight can be between 0.25kg and 400kg";
NSString *const InvalidExerciseRepsMessage = @"Reps can be between 1 and 500";
NSString *const InvalidExerciseSeriesMessage = @"Series can be between 1 and 30";
NSString *const InvalidExerciseRestInSecondsMessage = @"Rest can missing or can be up to 15 minutes";

@end
