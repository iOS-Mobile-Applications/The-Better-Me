//
//  SoundManager.m
//  The Better Me
//
//  Created by Dimitar Dzhurenov on 2/6/16.
//  Copyright © 2016 Dimitar Dzhurenov. All rights reserved.
//

#import "SoundManager.h"

@implementation SoundManager

-(instancetype)initSound {
    self = [super init];
    if (self) {
        NSString *toneFilename = @"Blop-Mark_DiAngelo-79054334";
        
        NSURL *toneURLRef = [[NSBundle mainBundle] URLForResource:toneFilename
                                                    withExtension:@"wav"];
        SystemSoundID toneSSID = 0;
        
        AudioServicesCreateSystemSoundID((__bridge CFURLRef) toneURLRef, &toneSSID);
        self.sound = toneSSID;
    }
    
    return self;
}

@end
