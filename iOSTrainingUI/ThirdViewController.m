//
//  ThirdViewController.m
//  iOSTrainingUI
//
//  Created by OPS on 10/25/19.
//  Copyright © 2019 OPSolutions. All rights reserved.
//
#import "ViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface ThirdViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label_welcome;
@property (weak, nonatomic) IBOutlet UIButton *button_back;

@end

@implementation ThirdViewController
- (IBAction)tapped_button_back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [_label_welcome setText:_welcomeMessage];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
