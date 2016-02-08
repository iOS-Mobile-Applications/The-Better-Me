//
//  DBManager.h
//  The Better Me
//
//  Created by Dimitar Dzhurenov on 2/3/16.
//  Copyright © 2016 Dimitar Dzhurenov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "Product.h"
#import "Exercise.h"

#import <sqlite3.h>

@interface DBManager : NSObject {
    sqlite3 *databaseHandle;
}

-(instancetype) initDatabase;

-(void)insertUser:(User *)user;
-(void)insertProduct:(Product *)product;
-(void)insertExercise:(Exercise *)exercise;

-(NSArray *)getAllUserData;
-(NSArray *)getAllProductsData;
-(NSArray *)getAllExercisesData;

@end
