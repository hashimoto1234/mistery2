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
    [_webView loadRequest:req];}

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
