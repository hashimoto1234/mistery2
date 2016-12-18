//
//  thumbnailCollectionViewCell.h
//  MiSTERY
//
//  Created by 橋本直樹 on 2016/12/18.
//  Copyright © 2016年 橋本直樹. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface thumbnailCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *status;
@property (weak, nonatomic) IBOutlet UILabel *mystoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *historyLabel;
@property (weak, nonatomic) IBOutlet UILabel *mysteryLabel;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@property (weak, nonatomic) IBOutlet UIImageView *infoImage;

@end
