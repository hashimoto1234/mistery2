//
//  HomeViewController.m
//  MiSTERY
//
//  Created by 橋本直樹 on 2016/12/09.
//  Copyright © 2016年 橋本直樹. All rights reserved.
//

#import "HomeViewController.h"
#import "thumbnailCollectionViewCell.h"
#import "peopleInformation.h"

@interface HomeViewController ()<UIWebViewDelegate, UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *findCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *needCollectionView;

@property NSArray * findArray;

@property NSArray * needArray;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _webView.delegate = self;
    
    _findCollectionView.delegate = self;
    _findCollectionView.dataSource = self;
    _needCollectionView.delegate = self;
    _needCollectionView.dataSource = self;
    
    _findCollectionView.backgroundColor = [UIColor clearColor];
    _needCollectionView.backgroundColor = [UIColor clearColor];
    
    
    [self createInfo];
    
    // UICollectionViewにカスタムセルを追加
    UINib *nibFirst = [UINib nibWithNibName:@"thumbnailCollectionViewCell" bundle:nil];
    [_findCollectionView registerNib:nibFirst forCellWithReuseIdentifier:@"thumbnailCollectionViewCell"];
    [_needCollectionView registerNib:nibFirst forCellWithReuseIdentifier:@"thumbnailCollectionViewCell"];
    
    
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

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

// 各セクションの項目数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSInteger rowCount;
    
    if(collectionView.tag == 0){
        rowCount = _findArray.count;
    
    }else{
        rowCount = _needArray.count;

    }
    
    return rowCount;
}

//セルサイズ
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(189, 160);
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    //    UICollectionViewCell *cell = nil;
    //    cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell0" forIndexPath:indexPath];
    
    thumbnailCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"thumbnailCollectionViewCell" forIndexPath:indexPath];
    
    if(collectionView.tag == 0){
        
        peopleInformation*people = [[peopleInformation alloc]init];
        people = _findArray[indexPath.row];
        
        cell.name.text = people.name;
        cell.status.text = people.status;
        cell.image.image = [UIImage imageNamed:people.image];
        
        cell.mystoryLabel.text = people.mystory;
        cell.historyLabel.text = people.history;
        cell.mysteryLabel.text = people.mystery;
        cell.infoLabel.text = people.basicInfo;
        
        cell.backgroundColor = [UIColor whiteColor];
        
        
        
        // 行のスクロール
        [_findCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredVertically animated:YES];
        
        
    }else{
        
        peopleInformation*people = [[peopleInformation alloc]init];
        people = _needArray[indexPath.row];
        
        cell.name.text = people.name;
        cell.status.text = people.status;
        cell.image.image = [UIImage imageNamed:people.image];
        
        cell.mystoryLabel.text = people.mystory;
        cell.historyLabel.text = people.history;
        cell.mysteryLabel.text = people.mystery;
        cell.infoLabel.text = people.basicInfo;
        
        cell.backgroundColor = [UIColor whiteColor];
        
        
        // 行のスクロール
        [_needCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredVertically animated:YES];
    }
    
    return cell;
}


-(void)createInfo{
    
    peopleInformation * shigemi = [[peopleInformation alloc]init];
    
    shigemi.name = @"重見彰則";
    shigemi.status = @"夢見る(株),CEO";
    shigemi.mystory = @"ロボット教育";
    shigemi.history = @"学童保育";
    shigemi.mystery = @"世界";
    shigemi.basicInfo = @"プログラミング教育で子供達を世界に！";
    shigemi.image = @"shigemi.jpg";
    
    peopleInformation * IoT = [[peopleInformation alloc]init];
    
    IoT.name = @"小林翔平";
    IoT.status = @"K-systems";
    IoT.mystory = @"rasberry-pi";
    IoT.history = @"Python";
    IoT.mystery = @"IoT";
    IoT.basicInfo = @"IoTで大阪を元気に！";
    IoT.image = @"photo_00111.jpg";
    
    _findArray = @[shigemi, IoT];
    
    
    
    peopleInformation * yoshimi = [[peopleInformation alloc]init];
    
    yoshimi.name = @"吉見紫彩";
    yoshimi.status = @"都市活力研究所";
    yoshimi.mystory = @"スタートアップ";
    yoshimi.mystery = @"Hack Osaka";
    yoshimi.basicInfo = @"大阪から世界へ！スタートアップ支援事業";
    yoshimi.image = @"yoshimi.jpg";
    
    peopleInformation * taro = [[peopleInformation alloc]init];
    
    taro.name = @"山村大志";
    taro.status = @"IT研究所";
    taro.mystory = @"ドローン";
    taro.history = @"接客";
    taro.mystery = @"カメラ";
    taro.basicInfo = @"空撮のプロフェッショナル";
    taro.image = @"Powerup_fpv.jpg";
    
    _needArray = @[yoshimi, taro];
    
    
}



@end
