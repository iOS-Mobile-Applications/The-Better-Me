//
//  DBManager.m
//  The Better Me
//
//  Created by Dimitar Dzhurenov on 2/3/16.
//  Copyright © 2016 Dimitar Dzhurenov. All rights reserved.
//

#import "DBManager.h"
#import "sqlite3.h"

@interface DBManager()

@end

@implementation DBManager

// Method to open a database. The database will be created if it doesn't exist
-(instancetype)initDatabase {
    // Create a string containing the full path to the sqlite.db inside the documents folder
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *databasePath = [documentsDirectory stringByAppendingPathComponent:@"theBetterMe.db"];
    
    // Check to see if the database file already exists
    BOOL databaseAlreadyExists = [[NSFileManager defaultManager] fileExistsAtPath:databasePath];
    
    // Open the database and store the handle as a data member
    if (sqlite3_open([databasePath UTF8String], &databaseHandle) == SQLITE_OK) {
        
        // Create the database if it doesn't yet exists in the fyle system
        if (!databaseAlreadyExists) {
            
            // Create USER table
            const char *sqlStatement = "CREATE TABLE IF NOT EXISTS USER (ID INTEGER PRIMARY KEY AUTOINCREMENT, USERNAME TEXT, FIRSTNAME TEXT, LASTNAME TEXT, HEIGHT INTEGER, AGE INTEGER, WEIGHT REAL, PHYSICALACTIVITY REAL, SEX INTEGER)";
            char *error;
            
            if (sqlite3_exec(databaseHandle, sqlStatement, NULL, NULL, &error) == SQLITE_OK) {
                NSLog(@"USER table created...");
            } else {
                NSLog(@"Error while creating USER table: %s", error);
            }
            
            // Create PRODUCT table
            sqlStatement = "CREATE TABLE IF NOT EXISTS PRODUCT (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT, QUANTITY INTEGER, DATETIME DATE";
            
            if (sqlite3_exec(databaseHandle, sqlStatement, NULL, NULL, &error) == SQLITE_OK) {
                NSLog(@"PRODUCT table created...");
            } else {
                NSLog(@"Error while creating PRODUCT table: %s", error);
            }
            
            // Create EXERCISE table
            sqlStatement = "CREATE TABLE IF NOT EXISTS EXERCISE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT, WEIGHT REAL, REPS INTEGER, SERIES INTEGER, REST INTEGER, DATETIME DATE";
            
            if (sqlite3_exec(databaseHandle, sqlStatement, NULL, NULL, &error) == SQLITE_OK) {
                NSLog(@"EXERCISE table created...");
            } else {
                NSLog(@"Error while creating EXERCISE table: %s", error);
            }
        }
    }
    
    // Close the database
    sqlite3_close(databaseHandle);
    return self;
}

// CRUD operations

-(void)insertUser:(User *)user {
    // Create insert statement for User
    NSString *insertStatement = [NSString stringWithFormat:@"INSERT INTO USER (USERNAME, FIRSTNAME, LASTNAME, HEIGHT, AGE, WEIGHT, PHYSICALACTIVITY, SEX) VALUES (\"%@\", \"%@\", \"%@\", \"%ld\", \"%ld\", \"%f\", \"%f\", \"%ld\")", user.username, user.firstname, user.lastname, (long)user.height, (long)user.age, user.weight, user.physicalActivity, (long)user.isMale];
    
    char *error;
    if (sqlite3_exec(databaseHandle, [insertStatement UTF8String], NULL, NULL, &error) == SQLITE_OK) {
        NSLog(@"User inserted...");
    } else {
        NSLog(@"Error while inserting user: %s", error);
    }
}

-(void)insertProduct:(Product *)product {
    // Create insert statement for Product
    NSString *insertStatement = [NSString stringWithFormat:@"INSERT INTO PRODUCT (NAME, QUANTITY, DATETIME) VALUES (\"%@\", \"%ld\", \"%@\")", product.productName, (long)product.quantity, product.dateAndTime];
    
    char *error;
    if (sqlite3_exec(databaseHandle, [insertStatement UTF8String], NULL, NULL, &error) == SQLITE_OK) {
        NSLog(@"Product inserted...");
    } else {
        NSLog(@"Error while inserting product: %s", error);
    }
}

-(void)insertExercise:(Exercise *)exercise {
    // Create insert statement for Exercise
    NSString *insertStatement = [NSString stringWithFormat:@"INSERT INTO EXERCISE (NAME, WEIGHT, REPS, SERIES, REST, DATETIME) VALUES (\"%@\", \"%f\", \"%ld\", \"%ld\", \"%ld\", \"%@\")", exercise.exerciseName, exercise.weight, (long)exercise.reps, (long)exercise.series, (long)exercise.rest, exercise.dateAndTime];
    
    char *error;
    if (sqlite3_exec(databaseHandle, [insertStatement UTF8String], NULL, NULL, &error) == SQLITE_OK) {
        NSLog(@"Exercise inserter...");
    } else {
        NSLog(@"Error while inserting exercise: %s", error);
    }
    
    
    
}

-(NSArray *)getAllUserData {
    NSMutableArray *userData = [[NSMutableArray alloc] init];
    
    NSString *queryStatement = [NSString stringWithFormat:@"SELECT ID, USERNAME, FIRSTNAME, LASTNAME, HEIGHT, AGE, WEIGHT, PHYSICALACTIVITY, SEX FROM USER"];
    
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(databaseHandle, [queryStatement UTF8String], -1, &statement, NULL) == SQLITE_OK) {
        // Iterate over all returned rows
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *username = [NSString stringWithUTF8String:(char*)sqlite3_column_text(statement, 1)];
            NSString *firstname = [NSString stringWithUTF8String:(char*)sqlite3_column_text(statement, 2)];
            NSString *lastname = [NSString stringWithUTF8String:(char*)sqlite3_column_text(statement, 3)];
            NSInteger height = sqlite3_column_int(statement, 4);
            NSInteger age = sqlite3_column_int(statement, 5);
            double weight = sqlite3_column_double(statement, 6);
            double physicalActivity = sqlite3_column_double(statement, 7);
            NSInteger sex = sqlite3_column_int(statement, 8);
            
            User *user = [[User alloc] initWithUsername:username andFirstname:firstname andLastname:lastname andHeight:height andAge:age andWeight:weight andPhysicalActivity:physicalActivity andSex:sex];
            
            [userData addObject:user];
        }
        
        sqlite3_finalize(statement);
    }
    
    return userData;
}

-(NSArray *)getAllProductsData {
    NSMutableArray *productData = [[NSMutableArray alloc] init];
    
    NSString *queryStatement = [NSString stringWithFormat:@"SELECT ID, NAME, QUANTITY, DATETIME FROM PRODUCT"];
    
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(databaseHandle, [queryStatement UTF8String], -1, &statement, NULL) == SQLITE_OK) {
        // Iterate over all returned rows
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *productName = [NSString stringWithUTF8String:(char*)sqlite3_column_text(statement, 1)];
            NSInteger quantity = sqlite3_column_int(statement, 2);
            
            // Convert to NSDate
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm";
            
            NSString *dateAsString = [NSString stringWithUTF8String:(char*)sqlite3_column_text(statement, 3)];
            NSDate *date = [dateFormatter dateFromString:dateAsString];
            
            Product *product = [[Product alloc] initWithProductName:productName andQuantity:quantity andDateAndTime:date];
            
            [productData addObject:product];
        }
        
        sqlite3_finalize(statement);
    }
    
    return productData;
}

-(NSArray *)getAllExercisesData {
    NSMutableArray *exerciseData = [[NSMutableArray alloc] init];
    
    NSString *queryStatement = [NSString stringWithFormat:@"SELECT ID, NAME, WEIGHT, REPS, SERIES, REST, DATETIME FROM EXERCISE"];
    
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(databaseHandle, [queryStatement UTF8String], -1, &statement, NULL) == SQLITE_OK) {
        // Iterate over all returned rows
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *exerciseName = [NSString stringWithUTF8String:(char*)sqlite3_column_text(statement, 1)];
            double weight = sqlite3_column_double(statement, 2);
            NSInteger reps = sqlite3_column_int(statement, 3);
            NSInteger series = sqlite3_column_int(statement, 4);
            NSInteger rest = sqlite3_column_int(statement, 5);
            
            // Convert to NSDate
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm";
            
            NSString *dateAsString = [NSString stringWithUTF8String:(char*)sqlite3_column_text(statement, 6)];
            NSDate *date = [dateFormatter dateFromString:dateAsString];
            
            Exercise *exercise = [[Exercise alloc] initWithExerciseName:exerciseName andWeight:weight andReps:reps andSeries:series andRest:rest andDateAndTime:date];
            
            [exerciseData addObject:exercise];
        }
        
        sqlite3_finalize(statement);
    }
    
    return exerciseData;
}
@end