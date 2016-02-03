//
//  Validator.swift
//  The Better Me
//
//  Created by Dimitar Dzhurenov on 2/3/16.
//  Copyright © 2016 Dimitar Dzhurenov. All rights reserved.
//

import Foundation

@objc public class Validator: NSObject {
    public func isValidStringLength(input: NSString, min: NSInteger, max: NSInteger) -> Bool{
        return input.length < min || input.length > max;
    }
    
    public func isValidIntegerRange(input: NSInteger, min: NSInteger, max: NSInteger) -> Bool{
        return input < min || input > max;
    }

    public func isValidDoubleRange(input: Double, min: Double, max: Double) -> Bool{
        return input < min || input > max;
    }

}