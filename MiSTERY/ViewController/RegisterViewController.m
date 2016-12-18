//
//  RegisterViewController.m
//  MiSTERY
//
//  Created by 橋本直樹 on 2016/11/26.
//  Copyright © 2016年 橋本直樹. All rights reserved.
//

#import "RegisterViewController.h"
#import "ActionSheetStringPicker.h"

@interface RegisterViewController()
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *userID;
@property (weak, nonatomic) IBOutlet UITextField *passwordConfirm;
@property (weak, nonatomic) IBOutlet UITextField *mail;
@property (weak, nonatomic) IBOutlet UIButton *ageButton;
@property (weak, nonatomic) IBOutlet UIButton *locationButton;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UIImageView *plus;

@property NSArray * ageArray;
@property NSArray * locationArray;

@end

@implementation RegisterViewController
- (IBAction)userID:(id)sender {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _userID.placeholder = @"ユーザーID（必須）";
    _password.placeholder = @"パスワード（必須）";

    _mail.placeholder = @"名前（必須）";

    
    [_password setSecureTextEntry:YES];
    [_passwordConfirm setSecureTextEntry:YES];
    
    _ageArray = @[@"25歳"];
    _locationArray = @[@"大阪府"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapAgeButton:(id)sender {
    
    
    [ActionSheetStringPicker showPickerWithTitle:@"業界選択"
                                            rows:_ageArray
                                initialSelection:0
                                       doneBlock:^(ActionSheetStringPicker *picker, NSInteger selectedIndex, id selectedValue) {
                                           _ageButton.titleLabel.text = _ageArray[selectedIndex];

                                           
                                       }
                                     cancelBlock:^(ActionSheetStringPicker *picker) {
                                         
                                         
                                         
                                     }
                                          origin:sender];
    
    

    
}

- (IBAction)tapLocationButton:(id)sender {
    
    [ActionSheetStringPicker showPickerWithTitle:@"業界選択"
                                            rows:_locationArray
                                initialSelection:0
                                       doneBlock:^(ActionSheetStringPicker *picker, NSInteger selectedIndex, id selectedValue) {
                                           
                                           _locationButton.titleLabel.text = _locationArray[selectedIndex];
                                           
                                       }
                                     cancelBlock:^(ActionSheetStringPicker *picker) {
                                         
                                         
                                         
                                     }
                                          origin:sender];
    
    

}
- (IBAction)tapRegisterButton:(id)sender {
    _image.image = [UIImage imageNamed:@"aburata.jpg"];
    _plus.hidden = YES;
    
}


@end
