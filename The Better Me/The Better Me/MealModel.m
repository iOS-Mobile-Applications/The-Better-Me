//
//  MealModel.m
//  The Better Me
//
//  Created by Dimitar Dzhurenov on 2/8/16.
//  Copyright © 2016 Dimitar Dzhurenov. All rights reserved.
//

#import "MealModel.h"

@implementation MealModel

@dynamic mealDate;
@dynamic mealTime;
@dynamic productsCollection;
@dynamic creator;

+(void)load {
    [self registerSubclass];
}

+(NSString *)parseClassName {
    return @"MealModel";
}

-(instancetype)initWithDate:(NSString *)mealDate
                    andTime:(NSString *)mealTime
                andProducts:(NSMutableArray *)productsCollection
                 andCreator:(NSString *) creator {
    self = [super init];
    if (self) {
        self.mealDate = mealDate;
        self.mealTime = mealTime;
        self.productsCollection = productsCollection;
        self.creator = creator;
    }
    
    return self;
}

@end
