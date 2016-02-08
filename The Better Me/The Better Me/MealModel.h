//
//  MealModel.h
//  The Better Me
//
//  Created by Dimitar Dzhurenov on 2/8/16.
//  Copyright © 2016 Dimitar Dzhurenov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface MealModel : PFObject<PFSubclassing>

@property (weak, nonatomic) NSString *mealDate;
@property (weak, nonatomic) NSString *mealTime;
@property (weak, nonatomic) NSMutableArray *productsCollection;
@property (weak, nonatomic) NSString *creator;

-(instancetype)initWithDate:(NSString *) mealDate
                    andTime:(NSString *) mealTime
                andProducts:(NSMutableArray *) productsCollection
                 andCreator:(NSString *) creator;

+(NSString *)parseClassName;

@end
