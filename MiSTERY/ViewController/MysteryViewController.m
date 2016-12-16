//
//  MysteryViewController.m
//  MiSTERY
//
//  Created by 橋本直樹 on 2016/12/04.
//  Copyright © 2016年 橋本直樹. All rights reserved.
//

#import "MysteryViewController.h"
#import "ResultViewController.h"
#import "LoginViewController.h"

@interface MysteryViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *topicsCollectionView;

@property  NSArray * displayInfo1;
@property  NSArray * displayInfo2;
@property  NSArray * displayInfo3;
@property UIView * helpView;

@property NSArray * topicsArray;

@property  UIActivityIndicatorView *ai;
@property NSArray * industryArray;

@property (weak, nonatomic) IBOutlet UIButton *selectButton;

@property (weak, nonatomic) IBOutlet UIButton *searchButton;

@end

@implementation MysteryViewController
{
    UIView *loadingView;
    UIActivityIndicatorView *indicator;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //デリゲート・データソースの指定
    _myCollectionView.delegate = self;
    _myCollectionView.dataSource = self;
    _topicsCollectionView.delegate = self;
    _topicsCollectionView.dataSource = self;
    
    //背景色をグレーに指定
    _myCollectionView.backgroundColor = [UIColor clearColor];
    _topicsCollectionView.backgroundColor = [UIColor clearColor];
    
    _industryArray = @[@"IT",@"コンサル",@"教育",@"広告",@"アパレル",@"出版",@"不動産",@"映像",@"人材",@"小売",@"医療",@"旅行",@"ゲーム",@"美容",@"メーカー",@"サービス",@"金融",@"NPO",@"商社",@"士業"];
    
    // UICollectionViewにカスタムセルを追加
    UINib *nibFirst = [UINib nibWithNibName:@"MyCollectionViewCell" bundle:nil];
    [_myCollectionView registerNib:nibFirst forCellWithReuseIdentifier:@"MyCollectionViewCell"];
    [_topicsCollectionView registerNib:nibFirst forCellWithReuseIdentifier:@"MyCollectionViewCell"];

    //ヘッダーもnib登録
    UINib *headerNib = [UINib nibWithNibName:@"CollectionViewHeader" bundle:nil];
    [_myCollectionView registerNib:headerNib forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CollectionViewHeader"];
    
    _selectButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    //各セクションに表示する情報（仮データ）
    self.displayInfo1 = @[@"IT", @"教育", @"スポーツ", @"ビジネス", @"飲食", @"デザイン"];
    _topicsArray = @[@"ドローン", @"IoT", @"Zigbee",@"ブロックチェーン"];
    
    //複数選択を許可
    self.myCollectionView.allowsMultipleSelection = YES;
    self.topicsCollectionView.allowsMultipleSelection = YES;

    //NavigationBar設定
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"24-24back.png"] imageWithRenderingMode:UIImageRenderingModeAutomatic	]
                                                             style:UIBarButtonItemStylePlain
                                                            target:self
                                                            action:@selector(tapBackButton:)];
    self.navigationItem.leftBarButtonItem = item;
    
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"24-24help.png"] imageWithRenderingMode:UIImageRenderingModeAutomatic	]
                                                              style:UIBarButtonItemStylePlain
                                                             target:self
                                                             action:@selector(tapHelpButton:)];
    
    
    self.navigationItem.rightBarButtonItem = right;
    
    //-------------Navigation Barに画像設定-----------
    
    UIImage *titleImage = [UIImage imageNamed:@"Mystery.png"];
    UIImageView *titleImageView = [[UIImageView alloc] initWithImage:titleImage];
    titleImageView.frame = CGRectMake(0, 0, titleImage.size.width * 0.2, titleImage.size.height * 0.2);//適当にサイズ調整
    
    UIView *titleView = [[UIView alloc]initWithFrame:CGRectMake(-titleImage.size.width*0.3, 0, titleImageView.frame.size.width , titleImageView.frame.size.height)];
    [titleView addSubview:titleImageView];
    self.navigationItem.titleView = titleView;
    
    //----------------------------------------------
    
}

-(void)tapBackButton:(UIButton*)button{
    
    //一つ前の画面に戻る
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(void)tapHelpButton:(UIButton*)button{
    
    //ヘルプボタンタップ時処理（未実装）
    
    _helpView = [[UIView alloc]initWithFrame:CGRectMake(25, 25, self.view.frame.size.width-50, self.view.frame.size.height-50)];
    
    _helpView.backgroundColor = [UIColor lightGrayColor];
    
    UITextView * textView = [[UITextView alloc]initWithFrame:CGRectMake(15, self.navigationController.navigationBar.frame.origin.y + self.navigationController.navigationBar.frame.size.height + 15, 100, 150)];
    textView.text = @"このページの使い方は自分で考えてください。";
    [_helpView addSubview:textView];
    
    UIButton * closeButton = [[UIButton alloc]initWithFrame:CGRectMake(15, textView.frame.origin.y + textView.frame.size.height +10, 100, 50)];
    [closeButton addTarget:NULL action:@selector(tapCloseButton:) forControlEvents:UIControlEventTouchUpInside];
    closeButton.titleLabel.text = @"閉じる";
    closeButton.tintColor = [UIColor whiteColor];
    closeButton.backgroundColor = [UIColor redColor];
    [_helpView addSubview:closeButton];
    
    [self.view addSubview:_helpView];
}

-(void)tapCloseButton:(UIButton*)button{
    
    [_helpView removeFromSuperview];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    //セクションは3つに固定
    return 1;
}

// 各セクションの項目数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSInteger rowCount;
    
    if(collectionView.tag == 0){
        rowCount = _displayInfo1.count;
    }else{
        rowCount = _topicsArray.count;
    }
    
    return rowCount;
}


//セルサイズ
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    // 正方形で横に３つ並べる
    //     float size = (self.myCollectionView.frame.size.width - 10 * 4) / 3;
    //      return CGSizeMake(size, size*2/3);
    
    return CGSizeMake(100, 50);
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    //    UICollectionViewCell *cell = nil;
    //    cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell0" forIndexPath:indexPath];
    
    
    
    MyCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyCollectionViewCell" forIndexPath:indexPath];
    cell.myImageView.image = [UIImage imageNamed:@"green-tag.png"];
    cell.myLabel.tintColor = [UIColor blackColor];
    cell.myLabel.textAlignment = NSTextAlignmentCenter;
    cell.myImageView.image = [UIImage imageNamed:@"blue-tag.png"];
    
    if(collectionView.tag == 0){
        cell.myLabel.text = _displayInfo1[indexPath.row];
        // 行のスクロール
        [_myCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredVertically animated:YES];
        return cell;
    }else{
        cell.myLabel.text = _topicsArray[indexPath.row];
        [_topicsCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredVertically animated:YES];
        
        return cell;
    }
}



//セルタップ時処理
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    MyCollectionViewCell * cell = [collectionView cellForItemAtIndexPath:indexPath];
    cell.myImageView.image = [UIImage imageNamed:@"blue-tag-selected.png"];

}

-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    MyCollectionViewCell * cell = [collectionView cellForItemAtIndexPath:indexPath];
    cell.myImageView.image = [UIImage imageNamed:@"blue-tag.png"];

    
}
- (IBAction)tapSearchButton:(id)sender {
    
    //1秒インジケーター回してから結果一覧画面に遷移
    loadingView = [[UIView alloc] initWithFrame:self.view.bounds];
    // 雰囲気出すために背景を黒く半透明する
    loadingView.backgroundColor = [UIColor blackColor];
    loadingView.alpha = 0.5f;
    indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    // でっかいグルグル
    indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    // 画面の中心に配置
    [indicator setCenter:CGPointMake(loadingView.bounds.size.width / 2, loadingView.bounds.size.height / 2)];
    // 画面に追加
    [loadingView addSubview:indicator];
    [self.view addSubview:loadingView];

    
    [indicator startAnimating];
    
    [self performSelector:@selector(goToResult) withObject:nil afterDelay:1.0];
    
}


-(void)goToResult{
    
    
    // ぐるぐる停止
    [indicator stopAnimating];
    // 画面から除去して黒い半透明を消す
    [loadingView removeFromSuperview];


    ResultViewController * resultVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ResultViewController"];
    
    [self.navigationController pushViewController:resultVC animated:YES];
    
}

- (IBAction)tapSelectButton:(id)sender {
}


@end
