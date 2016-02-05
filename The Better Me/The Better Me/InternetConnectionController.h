//
//  InternetConnectionController.h
//  The Better Me
//
//  Created by Dimitar Dzhurenov on 2/5/16.
//  Copyright © 2016 Dimitar Dzhurenov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SystemConfiguration/SystemConfiguration.h>
#import "Reachability.h"

@interface InternetConnectionController : NSObject

-(NSString *)getConnectionStatus;

@end
