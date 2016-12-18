//
//  SearchViewController.m
//  MiSTERY
//
//  Created by 橋本直樹 on 2016/11/26.
//  Copyright © 2016年 橋本直樹. All rights reserved.
//

#import "SearchViewController.h"
#import "ResultViewController.h"
#import "HistoryViewController.h"
#import "ActionSheetStringPicker.h"


@interface SearchViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *topicsCollectionView;

@property  NSArray * displayInfo1;
@property (weak, nonatomic) IBOutlet UILabel *selected01;
@property (weak, nonatomic) IBOutlet UIImageView *selected01image;
@property (weak, nonatomic) IBOutlet UILabel *selected02;
@property (weak, nonatomic) IBOutlet UIImageView *selected02image;
@property (weak, nonatomic) IBOutlet UILabel *selected03;
@property (weak, nonatomic) IBOutlet UIImageView *selected03image;

@property NSInteger count;

@property NSArray * IT_keywords;

@property NSInteger selectedIndex;

@property  UIView * helpView;
@property (weak, nonatomic) IBOutlet UIButton *selectButton;
@property (weak, nonatomic) IBOutlet UIButton *pickerButton;
@property (weak, nonatomic) IBOutlet UIView *View_picker;

@property NSArray * industryArray;
@property NSArray * topicsArray;

@property (weak, nonatomic) IBOutlet UIPickerView *piv;

@property  UIActivityIndicatorView *ai;


@property (weak, nonatomic) IBOutlet UIButton *searchButton;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _count = 0;
    
    //デリゲート・データソースの指定
    _myCollectionView.delegate = self;
    _myCollectionView.dataSource = self;
    _topicsCollectionView.delegate = self;
    _topicsCollectionView.dataSource = self;
    
    _piv.delegate = self;
    _piv.dataSource = self;
    
    _View_picker.hidden = YES;
    
    _myCollectionView.backgroundColor = [UIColor clearColor];
    _topicsCollectionView.backgroundColor = [UIColor clearColor];
    

    _industryArray = @[
                       @"IT/Web",
                       @"教育",
                       @"サービス/飲食",
                       @"広告/PR",
                       @"映像",
                       @"人材",
                       @"コンサルティング",
                       @"出版/雑誌",
                       @"小売",
                       @"ゲーム",
                       @"アパレル/ファッション",
                       @"不動産/建築",
                       @"美容/化粧品",
                       @"金融",
                       @"商社",
                       @"医療/福祉",
                       @"旅行",
                       @"メーカー",
                       @"NPO/ボランティア",
                       @"士業",
                       ];
    
    _topicsArray = @[@"ドローン", @"IoT", @"Zigbee",@"ブロックチェーン"];
    
    // UICollectionViewにカスタムセルを追加
    UINib *nibFirst = [UINib nibWithNibName:@"MyCollectionViewCell" bundle:nil];
    [_myCollectionView registerNib:nibFirst forCellWithReuseIdentifier:@"MyCollectionViewCell"];
    [_topicsCollectionView registerNib:nibFirst forCellWithReuseIdentifier:@"MyCollectionViewCell"];
    
    
    //ヘッダーもnib登録
    UINib *headerNib = [UINib nibWithNibName:@"CollectionViewHeader" bundle:nil];
    [_myCollectionView registerNib:headerNib forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CollectionViewHeader"];
    
    _selectButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    //各セクションに表示する情報（仮データ）
//    self.displayInfo1 = @[@"IT", @"教育", @"スポーツ", @"ビジネス", @"飲食", @"デザイン"];
    
    //IT
    _IT_keywords = @[@"プログラミング",@"AI",@"pepper",@"ロボティクス",@"IoT"];
    
    
    
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
    
    UIImage *titleImage = [UIImage imageNamed:@"MyStory.png"];
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

    _helpView.backgroundColor = [UIColor clearColor];
    
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

    return CGSizeMake(100, 50);
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
//    UICollectionViewCell *cell = nil;
//    cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell0" forIndexPath:indexPath];
    
    MyCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyCollectionViewCell" forIndexPath:indexPath];
    
    if(collectionView.tag == 0){
        
        cell.myImageView.image = [UIImage imageNamed:@"red-tag.png"];

        //選択した業界がITの場合
        if([_selectButton.titleLabel.text isEqualToString:@"IT"]){
            _displayInfo1 = _IT_keywords.copy;
        }

            cell.myLabel.text = _displayInfo1[indexPath.row];
        
        // 行のスクロール
//        [_myCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredVertically animated:YES];
        
        
    }else{
        cell.myLabel.text = _topicsArray[indexPath.row];
        
        // 行のスクロール
        [_topicsCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredVertically animated:YES];
    }
    

    //文字色を黒に指定
//    cell.backgroundColor = [UIColor blackColor];
    
    cell.myLabel.tintColor = [UIColor blackColor];
    
    //文字を中央揃えに指定
    cell.myLabel.textAlignment = NSTextAlignmentCenter;
    

    return cell;
}



//セルタップ時処理
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    MyCollectionViewCell * cell = [collectionView cellForItemAtIndexPath:indexPath];
    
    
    cell.myImageView.image = [UIImage imageNamed:@"red-tag-selected.png"];
    
    if(_count == 0){
        _selected01.text = _displayInfo1[indexPath.row];
        _selected01.tintColor = [UIColor redColor];
        _selected01image.image = [UIImage imageNamed:@"red-tag-selected.png"];

        _count++;
    }else if (_count == 1){
        _selected02.text = _displayInfo1[indexPath.row];
        _selected02.tintColor = [UIColor blackColor];
        _selected02image.image = [UIImage imageNamed:@"red-tag-selected.png"];

        _count++;
    }else if (_count == 2){
        _selected03.text = _displayInfo1[indexPath.row];
        _selected03.tintColor = [UIColor blackColor];
        _selected03image.image = [UIImage imageNamed:@"red-tag-selected.png"];

    }
}

-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    MyCollectionViewCell * cell = [collectionView cellForItemAtIndexPath:indexPath];
    
    
    cell.myImageView.image = [UIImage imageNamed:@"red-tag.png"];
    
    
}

- (IBAction)tapSelectButton:(id)sender {
    //UITableViewが乗ったUIViewを出す
    
    [ActionSheetStringPicker showPickerWithTitle:@"業界選択"
                                            rows:_industryArray
                                initialSelection:0
                                       doneBlock:^(ActionSheetStringPicker *picker, NSInteger selectedIndex, id selectedValue) {
                                           
                                           
                                           _selectedIndex = selectedIndex;
                                           
                                           [self reload];

                                           [_myCollectionView reloadData];
                                       
                                           _selectButton.titleLabel.text = _industryArray[selectedIndex];
                                       
                                       }
                                     cancelBlock:^(ActionSheetStringPicker *picker) {
                                     }
                                          origin:sender];
    
    
    
    
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView*)pickerView{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView*)pickerView
numberOfRowsInComponent:(NSInteger)component{
    
    return _industryArray.count;
    
}

-(void)reload{
    
    switch (_selectedIndex) {
        case 0:
            _displayInfo1 = @[@"AI",@"IoT",@"HTML",@"CSS",@"photoshop",@"機械学習",@"ロボット",@"基本情報",@"サーバー",@"Python",@"Java",@"システム",@"Ruby",@"ICT",@"PC"];
            break;
            
        case 1:
            _displayInfo1 = @[@"塾",@"家庭教師",@"受験",@"英語",@"中国語",@"留学",@"スポーツ",@"学童保育",@"ICT",@"料理",@"楽器",@"個別指導",@"日本語",@"陶芸",@"プログラミング"];
            break;

        case 2:
            _displayInfo1 = @[@"居酒屋",@"バー",@"カフェ",@"ラーメン",@"接客",@"コンビニ",@"通訳",@"派遣",@"キッチン",@"宅配",@"受付",@"介護",@"コールセンター",@"警備員",@"事務"];
            
        default:
            break;
    }
    
}

@end
