//
//  ResultTableViewCell.h
//  MiSTERY
//
//  Created by 橋本直樹 on 2016/11/27.
//  Copyright © 2016年 橋本直樹. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *resultImageView;
@property (weak, nonatomic) IBOutlet UILabel *resultNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *resultInfoLabel;
@property (weak, nonatomic) IBOutlet UILabel *mystoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *historyLabel;
@property (weak, nonatomic) IBOutlet UILabel *mysteryLabel;
@property (weak, nonatomic) IBOutlet UILabel *mystoryInfo;
@property (weak, nonatomic) IBOutlet UILabel *historyInfo;
@property (weak, nonatomic) IBOutlet UILabel *mysteryInfo;

@end
