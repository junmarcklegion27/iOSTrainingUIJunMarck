//
//  ThirdViewController.h
//  iOSTrainingUI
//
//  Created by OPS on 10/25/19.
//  Copyright © 2019 OPSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "SecondViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ThirdViewController : UIViewController

@property (assign) NSString *welcomeMessage;
@property (strong, readwrite) SecondViewController *secondVC;
@property (strong, readwrite) ViewController *firstVC;

@end

NS_ASSUME_NONNULL_END
