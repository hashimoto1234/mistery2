//
//  ResultTableViewCell.h
//  MiSTERY
//
//  Created by 橋本直樹 on 2016/11/27.
//  Copyright © 2016年 橋本直樹. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *image;

@property (weak, nonatomic) IBOutlet UILabel *myStroyLabel;

@property (weak, nonatomic) IBOutlet UILabel *historyLabel;

@property (weak, nonatomic) IBOutlet UILabel *mysteryLabel;

@property (weak, nonatomic) IBOutlet UITextView *infoLabel;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *statusLabel;


@end
