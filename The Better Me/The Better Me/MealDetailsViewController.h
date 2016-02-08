//
//  MealDetailsViewController.h
//  The Better Me
//
//  Created by Dimitar Dzhurenov on 2/8/16.
//  Copyright © 2016 Dimitar Dzhurenov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MealDetailsViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) NSArray * details;

@end
