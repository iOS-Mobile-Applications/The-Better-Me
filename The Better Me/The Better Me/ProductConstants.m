//
//  ProductConstants.m
//  The Better Me
//
//  Created by Dimitar Dzhurenov on 2/3/16.
//  Copyright © 2016 Dimitar Dzhurenov. All rights reserved.
//

#import "ProductConstants.h"

@implementation ProductConstants

NSInteger const ProductNameMinLength = 2;
NSInteger const ProductNameMaxLength = 40;

NSInteger const ProductQuantityMinValue = 1;
NSInteger const ProductQuantityMaxValue = 1500;

NSString *const InvalidProductNameMessage = @"Product name lenght must be between 2 and 40 characters long";
NSString *const InvalidProductQuantityMessage = @"Product quantity must be between 1gr and 1500gr";

@end
