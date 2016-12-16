//
//  HomeViewController.m
//  MiSTERY
//
//  Created by 橋本直樹 on 2016/12/09.
//  Copyright © 2016年 橋本直樹. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()<UIWebViewDelegate>

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _webView.delegate = self;
        
    NSURL *url = [NSURL URLWithString:@"http://www.yahoo.co.jp"];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:req];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"24-24setting.png"] imageWithRenderingMode:UIImageRenderingModeAutomatic	]
                                                             style:UIBarButtonItemStylePlain
                                                            target:self
                                                            action:@selector(tapSettingButton)];
    self.navigationItem.leftBarButtonItem = item;
    
    UIBarButtonItem *right1 = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"24-24world.png"] imageWithRenderingMode:UIImageRenderingModeAutomatic	]
                                                             style:UIBarButtonItemStylePlain
                                                            target:self
                                                            action:@selector(tapWorldButton)];
    
    UIBarButtonItem *right2 = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"24-24mail.png"] imageWithRenderingMode:UIImageRenderingModeAutomatic	]
                                                               style:UIBarButtonItemStylePlain
                                                              target:self
                                                              action:@selector(tapMailButton)];

    self.navigationItem.rightBarButtonItems = @[right2,right1];
    

}

-(void)tapSettingButton{
    
    //設定画面へ遷移（未実装）
    
}

-(void)tapMailButton{
    
    
}

-(void)tapWorldButton{
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
