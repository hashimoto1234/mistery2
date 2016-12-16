//
//  DetailViewController.m
//  MiSTERY
//
//  Created by 橋本直樹 on 2016/11/26.
//  Copyright © 2016年 橋本直樹. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()<UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *myScrollView;
@property (weak, nonatomic) IBOutlet UIView *myView;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *status;
@property (weak, nonatomic) IBOutlet UILabel *myStoryTag;
@property (weak, nonatomic) IBOutlet UITextView *myStoryInfo;
@property (weak, nonatomic) IBOutlet UILabel *historyTag;
@property (weak, nonatomic) IBOutlet UITextView *historyInfo;
@property (weak, nonatomic) IBOutlet UILabel *MysteryTag;
@property (weak, nonatomic) IBOutlet UITextView *mysteryInfo;


@property (weak, nonatomic) IBOutlet UIView *fixedView;

@end

@implementation DetailViewController

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    
    [_myScrollView setContentSize:CGSizeMake(self.view.frame.size.width, 1500)];
    _fixedView.frame = CGRectMake(0,
                                  self.navigationController.navigationBar.frame.origin.y + self.navigationController.navigationBar.frame.size.height,
                                  375,
                                  45);
    
}

- (void)viewDidLoad {
    [super viewDidLoad];


    
    _myScrollView.scrollEnabled = YES;
    _myScrollView.delegate = self;
    
    
    _image.image = [UIImage imageNamed:_selectedInfo.image];
    _name.text = _selectedInfo.name;
    _status.text = _selectedInfo.status;
    _myStoryTag.text = _selectedInfo.mystory;
    _myStoryInfo.text = _selectedInfo.mystoryInfo;
    _historyTag.text = _selectedInfo.history;
    _historyInfo.text = _selectedInfo.historyInfo;
    _MysteryTag.text = _selectedInfo.mystery;
    _mysteryInfo.text = _selectedInfo.mysteryInfo;
    
    

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 固定するビューの座標を設定
    _fixedView.frame = CGRectMake( scrollView.contentOffset.x,
                                  self.navigationController.navigationBar.frame.origin.y + self.navigationController.navigationBar.frame.size.height + scrollView.contentOffset.y,
                                  375,
                                  45);
}


@end
