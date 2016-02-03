//
//  Product.h
//  The Better Me
//
//  Created by Dimitar Dzhurenov on 2/3/16.
//  Copyright © 2016 Dimitar Dzhurenov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject

@property (strong, nonatomic) NSString *productName;
@property NSInteger quantity;
@property NSDate *dateAndTime;

-(instancetype) initWithProductName: (NSString *) productName
                        andQuantity: (NSInteger) quantity
                     andDateAndTime: (NSDate *) dateAndTime;

-(void)setProductName:(NSString *)productName;
-(void)setQuantity:(NSInteger)quantity;

@end
