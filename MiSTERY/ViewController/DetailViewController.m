//
//  DetailViewController.m
//  MiSTERY
//
//  Created by 橋本直樹 on 2016/11/26.
//  Copyright © 2016年 橋本直樹. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *mystoryTitle;
@property (weak, nonatomic) IBOutlet UILabel *mystoryInfo;
@property (weak, nonatomic) IBOutlet UILabel *historyTitle;
@property (weak, nonatomic) IBOutlet UILabel *historyInfo;
@property (weak, nonatomic) IBOutlet UILabel *misteryTitle;
@property (weak, nonatomic) IBOutlet UILabel *misteryInfo;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _imageView.image = [UIImage imageNamed:_selectedInfo.image];


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
