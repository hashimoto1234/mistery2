//
//  LoginViewController.m
//  MiSTERY
//
//  Created by 橋本直樹 on 2016/11/26.
//  Copyright © 2016年 橋本直樹. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userId;

@property (weak, nonatomic) IBOutlet UITextField *password;

@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@property (weak, nonatomic) IBOutlet UIButton *registerButton;



@end

@implementation LoginViewController


#pragma mark life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIColor *color = [UIColor lightGrayColor];
    color = [color colorWithAlphaComponent:0.75];
    
    _userId.backgroundColor = color;
    
    _password.backgroundColor = color;
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark buttonAction

//ログインボタンタップ時処理
- (IBAction)tapLoginbutton:(id)sender {
    
}

//新規登録ボタンタップ時処理
- (IBAction)tapRegisterButton:(id)sender {
    
}




@end
