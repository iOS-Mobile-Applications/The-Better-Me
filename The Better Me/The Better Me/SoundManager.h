//
//  SoundManager.h
//  The Better Me
//
//  Created by Dimitar Dzhurenov on 2/6/16.
//  Copyright © 2016 Dimitar Dzhurenov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>

@interface SoundManager : UIViewController

@property SystemSoundID sound;

-(instancetype)initSound;

@end
