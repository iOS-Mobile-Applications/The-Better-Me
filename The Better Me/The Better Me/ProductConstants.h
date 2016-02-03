//
//  ProductConstants.h
//  The Better Me
//
//  Created by Dimitar Dzhurenov on 2/3/16.
//  Copyright © 2016 Dimitar Dzhurenov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductConstants : NSObject

extern NSInteger const ProductNameMinLength;
extern NSInteger const ProductNameMaxLength;

extern NSInteger const ProductQuantityMinValue;
extern NSInteger const ProductQuantityMaxValue;

extern NSString *const InvalidProductNameMessage;
extern NSString *const InvalidProductQuantityMessage;

@end
