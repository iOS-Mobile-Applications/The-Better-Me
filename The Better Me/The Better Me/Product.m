//
//  Product.m
//  The Better Me
//
//  Created by Dimitar Dzhurenov on 2/3/16.
//  Copyright © 2016 Dimitar Dzhurenov. All rights reserved.
//

#import "Product.h"
#import "ProductConstants.h"
#import "The_Better_Me-Swift.h"

@implementation Product

NSString *_productName;
NSInteger _quantity;

-(instancetype)initWithProductName:(NSString *)productName
                       andQuantity:(NSInteger)quantity
                    andDateAndTime:(NSDate*)dateAndTime {
    self = [super init];
    if (self) {
        self.productName = productName;
        self.quantity = quantity;
        self.dateAndTime = dateAndTime;
    }
    
    return self;
}

// ProductName
-(NSString *)productName {
    return _productName;
}

-(void)setProductName:(NSString *)productName {
    Validator *validator = [[Validator alloc] init];
    BOOL isInvalid = [validator isValidStringLength:productName
                                                min:ProductNameMinLength
                                                max:ProductNameMaxLength];
    if (isInvalid) {
        NSException *ex = [[NSException alloc] initWithName:@"Product name length is out of range"
                                                     reason:InvalidProductNameMessage
                                                   userInfo:nil];
        [ex raise];
    }
    
    _productName = productName;
}

// Quantity
-(NSInteger)quantity {
    return _quantity;
}

-(void)setQuantity:(NSInteger)quantity {
    Validator *validator = [[Validator alloc] init];
    BOOL isInvalid = [validator isValidIntegerRange:quantity
                                                min:ProductQuantityMinValue
                                                max:ProductQuantityMaxValue];
    if (isInvalid) {
        NSException *ex = [[NSException alloc] initWithName:@"Quantity is out of range"
                                                     reason:InvalidProductQuantityMessage
                                                   userInfo:nil];
        [ex raise];
    }
    
    _quantity = quantity;
}

@end
