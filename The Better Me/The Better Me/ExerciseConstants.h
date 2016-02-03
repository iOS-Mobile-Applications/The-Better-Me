//
//  ExerciseConstants.h
//  The Better Me
//
//  Created by Dimitar Dzhurenov on 2/3/16.
//  Copyright © 2016 Dimitar Dzhurenov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ExerciseConstants : NSObject

extern NSInteger const ExerciseNameMinLength;
extern NSInteger const ExerciseNameMaxLength;

extern double const ExerciseMinWeight;
extern double const ExerciseMaxWeight;

extern NSInteger const ExerciseMinReps;
extern NSInteger const ExerciseMaxReps;

extern NSInteger const ExerciseMinSeries;
extern NSInteger const ExerciseMaxSeries;

extern NSInteger const ExerciseMinRestInSeconds;
extern NSInteger const ExerciseMaxRestInSeconds;

extern NSString *const InvalidExerciseNameMessage;
extern NSString *const InvalidExerciseWeightMessage;
extern NSString *const InvalidExerciseRepsMessage;
extern NSString *const InvalidExerciseSeriesMessage;
extern NSString *const InvalidExerciseRestInSecondsMessage;

@end
