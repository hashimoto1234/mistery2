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
    
    UIColor *color = [UIColor whiteColor];
    color = [color colorWithAlphaComponent:0.75];
    
    _userId.backgroundColor = color;
    
    _password.backgroundColor = color;
    
    
    _userId.placeholder = @"user ID";
    
    _password.placeholder = @"password";

    
    //-------------Navigation Barに画像設定-----------
    
    UIImage *titleImage = [UIImage imageNamed:@"Mistery.png"];
    UIImageView *titleImageView = [[UIImageView alloc] initWithImage:titleImage];
    titleImageView.frame = CGRectMake(0, 0, titleImage.size.width * 0.2, titleImage.size.height * 0.2);//適当にサイズ調整
    
    UIView *titleView = [[UIView alloc]initWithFrame:CGRectMake(-titleImage.size.width*0.3, 0, titleImageView.frame.size.width , titleImageView.frame.size.height)];
    [titleView addSubview:titleImageView];
    self.navigationItem.titleView = titleView;
    
    //----------------------------------------------
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    // キーボードが表示：消す
    if (_userId.isFirstResponder) {
        [_userId resignFirstResponder];
    }
    
    else if(_password.isFirstResponder){
        [_password resignFirstResponder];
    }
    // キーボードが非表示：表示する
    else {
        [_userId becomeFirstResponder];
    }
}


#pragma mark buttonAction

//ログインボタンタップ時処理
- (IBAction)tapLoginbutton:(id)sender {
    
}

//新規登録ボタンタップ時処理
- (IBAction)tapRegisterButton:(id)sender {
    
}




@end
