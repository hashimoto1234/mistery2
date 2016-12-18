//
//  DetailViewController.m
//  MiSTERY
//
//  Created by 橋本直樹 on 2016/11/26.
//  Copyright © 2016年 橋本直樹. All rights reserved.
//

#import "DetailViewController.h"
#import "HomeViewController.h"

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


    //NavigationBar設定
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"24-24back.png"] imageWithRenderingMode:UIImageRenderingModeAutomatic	]
                                                             style:UIBarButtonItemStylePlain
                                                            target:self
                                                            action:@selector(tapBackButton:)];
    self.navigationItem.leftBarButtonItem = item;
    
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"1482001656_home.png"] imageWithRenderingMode:UIImageRenderingModeAutomatic	]
                                                              style:UIBarButtonItemStylePlain
                                                             target:self
                                                             action:@selector(tapHomeButton:)];
    
    
    self.navigationItem.rightBarButtonItem = right;
    
    //-------------Navigation Barに画像設定-----------
    
    //-------------Navigation Barに画像設定-----------
    
    UIImage *titleImage = [UIImage imageNamed:@"Mistery.png"];
    UIImageView *titleImageView = [[UIImageView alloc] initWithImage:titleImage];
    titleImageView.frame = CGRectMake(0, 0, titleImage.size.width * 0.2, titleImage.size.height * 0.2);//適当にサイズ調整
    
    UIView *titleView = [[UIView alloc]initWithFrame:CGRectMake(-titleImage.size.width*0.3, 0, titleImageView.frame.size.width , titleImageView.frame.size.height)];
    [titleView addSubview:titleImageView];
    self.navigationItem.titleView = titleView;
    
    //----------------------------------------------
    
    
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

-(void)tapBackButton:(UIButton*)button{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)tapHomeButton:(UIButton*)button{
    NSInteger count = self.navigationController.viewControllers.count - 5;
    HomeViewController *homeVC = [self.navigationController.viewControllers objectAtIndex:count];
    [self.navigationController popToViewController:homeVC animated:YES];
}

@end
