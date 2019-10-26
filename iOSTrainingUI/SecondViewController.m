//
//  SecondViewController.m
//  iOSTrainingUI
//
//  Created by OPS on 10/25/19.
//  Copyright © 2019 OPSolutions. All rights reserved.
//

#import "User.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface SecondViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textfield_register_fullname;
@property (weak, nonatomic) IBOutlet UITextField *textfield_register_phone;
@property (weak, nonatomic) IBOutlet UITextField *textfield_register_email;
@property (weak, nonatomic) IBOutlet UITextField *textfield_register_password;
@property (weak, nonatomic) IBOutlet UITextField *textfield_register_confirmpassword;
@property (assign) NSUserDefaults *defaults;
@end

@implementation SecondViewController


- (void)viewDidLoad {
    _defaults = [NSUserDefaults standardUserDefaults];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)tapped_button_register:(id)sender {
    [self storeDefaults];
    _textfield_register_email.text = @"";
    _textfield_register_phone.text = @"";
    _textfield_register_fullname.text = @"";
    _textfield_register_password.text = @"";
    _textfield_register_confirmpassword.text = @"";
}

- (void)checkForSavedData {
    
}

- (void)presentThirdScreen:(NSMutableArray *) userArray{
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ThirdViewController *thirdVC = [mainStoryBoard instantiateViewControllerWithIdentifier:@"thirdScreen"];
    
    NSString *completeMessage = [NSString stringWithFormat:@"Hi %@ \nEmail Address: %@\nPassword: %@ \nNumber: %@", ((User *)userArray.lastObject).name,((User *)userArray.lastObject).email, ((User *)userArray.lastObject).password, ((User *)userArray.lastObject).phone];
    
    // Pass data here ....
    thirdVC.welcomeMessage = completeMessage;
    thirdVC.secondVC = self;
    
    [self presentViewController:thirdVC animated:YES completion:nil];
}

- (void)storeDefaults {
    NSString *email = _textfield_register_email.text;
    NSString *password = _textfield_register_password.text;
    NSString *fullname = _textfield_register_fullname.text;
    NSString *phone = _textfield_register_phone.text;
    NSString *confirmPass = _textfield_register_confirmpassword.text;
    User *user = [[User alloc] initWithEmail:email];
    user.password = password;
    user.name = fullname;
    user.phone = phone;
    
    bool isExisting = false;
    NSMutableArray *userArray = [[NSMutableArray alloc] initWithArray:[self decodeUserArrayData]];
    for (User *currentUser in userArray) {
        if ([currentUser.email isEqualToString:email]) {
            isExisting = true;
            break;
        }
    }
    
    if (!isExisting) {
        if ([password isEqualToString:confirmPass]) {
            [userArray addObject:user];
            [self encodeUserArrayData:userArray];
            [self presentThirdScreen:userArray];
        } else {
            [self showAlertWithMessage:@"Password doesn't match!"];
        }
    } else {
        _textfield_register_email.text = @"";
        _textfield_register_phone.text = @"";
        _textfield_register_fullname.text = @"";
        _textfield_register_password.text = @"";
        _textfield_register_confirmpassword.text = @"";
        [self showAlertWithMessage:@"User already EXIST!"];
    }
    
    NSLog(@"%@", userArray);
}

- (void)encodeUserArrayData:(NSMutableArray *)userArray {
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:userArray requiringSecureCoding:NO error:nil];
    [_defaults setObject:data forKey:@"arrayOfUsers"];
}

- (NSMutableArray *)decodeUserArrayData {
    NSData *newData = [_defaults objectForKey:@"arrayOfUsers"];
    
    NSMutableArray *decodedUserArray = [NSKeyedUnarchiver unarchiveObjectWithData:newData];
    
    return decodedUserArray;
}

- (void)showAlertWithMessage:(NSString *)message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Warning" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OKAY" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"User tapped okay action!~");
    }];
    
    [alert addAction:okAction];
    
    [self presentViewController:alert animated:YES completion:nil];
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
