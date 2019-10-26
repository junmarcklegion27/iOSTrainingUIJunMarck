//
//  ViewController.m
//  iOSTrainingUI
//
//  Created by OPS on 10/24/19.
//  Copyright © 2019 OPSolutions. All rights reserved.
//

#import "ViewController.h"
#import "ThirdViewController.h"
#import "User.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textfield_login_email;
@property (weak, nonatomic) IBOutlet UITextField *textfield_login_password;
@property (weak, nonatomic) IBOutlet UIButton *button_login;

@end

@implementation ViewController
- (IBAction)tapped_login_button:(id)sender {
    
    NSString *email = _textfield_login_email.text;
    
    NSMutableArray *usersArray = [self decodeUserArrayData];
    
    for (User *currentUser in usersArray) {
        if ([currentUser.email isEqualToString:email]) {
            [self presentThirdScreen:currentUser];
        } else if ([email  isEqual: @""]) {
            [self showAlertWithMessage:@"Email is EMPTY!"];
        } else {
            [self showAlertWithMessage:@"User doesn't EXIST!"];
        }
    }
    NSLog(@"%@", usersArray);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (NSMutableArray *)decodeUserArrayData {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSData *newData = [defaults objectForKey:@"arrayOfUsers"];
    
    NSMutableArray *decodedUserArray = [NSKeyedUnarchiver unarchiveObjectWithData:newData];
    
    return decodedUserArray;
}

- (void)presentThirdScreen:(User *) user{
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ThirdViewController *thirdVC = (ThirdViewController*)[mainStoryBoard instantiateViewControllerWithIdentifier:@"thirdScreen"];

    NSString *completeMessage = [NSString stringWithFormat:@"Hi %@ \nEmail Address: %@\nPassword: %@ \nNumber: %@", user.name, user.email, user.password, user.phone];

    // Pass data here ....
    thirdVC.welcomeMessage = completeMessage;
    thirdVC.firstVC = self;
    
    [self presentViewController:thirdVC animated:YES completion:nil];
}

- (void)showAlertWithMessage:(NSString *)message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Warning" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OKAY" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"User tapped okay action!~");
    }];
    
    [alert addAction:okAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}


@end
