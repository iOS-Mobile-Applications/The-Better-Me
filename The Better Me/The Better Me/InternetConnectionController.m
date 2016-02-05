//
//  InternetConnectionController.m
//  The Better Me
//
//  Created by Dimitar Dzhurenov on 2/5/16.
//  Copyright © 2016 Dimitar Dzhurenov. All rights reserved.
//

#import "InternetConnectionController.h"

@implementation InternetConnectionController

-(NSString *)getConnectionStatus{
    Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
    
    NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
    
    if (networkStatus == NotReachable) {
        return @"Not connected";
    } else {
        return @"Connected";
    }
}

@end
