//
//  ResultViewController.m
//  MiSTERY
//
//  Created by 橋本直樹 on 2016/11/26.
//  Copyright © 2016年 橋本直樹. All rights reserved.
//

#import "ResultViewController.h"
#import "ResultTableViewCell.h"
#import "DetailViewController.h"
#import "peopleInformation.h"

#import "HomeViewController.h"
#import "MysteryViewController.h"

@interface ResultViewController ()

@property NSArray * resultArray;

@property NSInteger selectedIndex;

@property peopleInformation * selectedInfo;


@end

@implementation ResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _resultTableView.dataSource = self;
    _resultTableView.delegate = self;
    
    
    // UITableViewにカスタムセルを追加
    UINib *nibFirst = [UINib nibWithNibName:@"ResultTableViewCell" bundle:nil];
    [_resultTableView registerNib:nibFirst forCellReuseIdentifier:@"ResultTableViewCell"];
    
    
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
    
    
    //-------------------検索結果として表示する仮データ----------------------------
    
    peopleInformation * pi3 = [[peopleInformation alloc]init];
    pi3.name = @"重見彰則";
//    pi3.age = @"24";
    pi3.from = @"大阪";
    pi3.mystory = @"プログラミング";
    pi3.history = @"学童保育";
    pi3.mystery = @"世界";
    pi3.mystoryInfo = @"「ロボ団事業」という名前で，LEGOを使ったプログラミング教育を行っています．本校は堺ですが，全国にFC展開を進めており，来年には業界最大の生徒数に！";
    pi3.historyInfo = @"大学時代に学童保育の活動に携わってきたことでこれからの教育の在り方を考えた結果EdTeck事業を立ち上げようと思い，コンサルを経て起業しました。";
    pi3.mysteryInfo = @"来年度より本格的に海外進出を行います。外国人の採用も積極的に行っており，今後急速に成長していきます！";
    pi3.basicInfo = @"小学生を対象にLEGOを用いたプログラミング教育を行っています。世界で叩ける理系人材を育てます！";
    pi3.image = @"shigemi.JPG";
    pi3.status = @"夢見る(株)CEO";
    
    peopleInformation * pi1 = [[peopleInformation alloc]init];
    pi1.name = @"橋本直樹";
    pi1.age = @"24";
    pi1.from = @"大阪";
    pi1.mystory = @"デザイナー";
    pi1.history = @"IT";
    pi1.mystery = @"アートディレクター";
    pi1.mystoryInfo = @"グラフィックデザイナー・LINEクリエイターとして活動中。";
    pi1.historyInfo = @"システムエンジニアとしてiOSアプリの開発に携りました。";
    pi1.mysteryInfo = @"ブランディングの力で地方創生ができるアートディレクターになる。";
    pi1.basicInfo = @"フリーランスのグラフィックデザイナーとして活動中";
    pi1.image = @"hashimoto.JPG";
    pi1.status = @"(株)AHD代表";
    
    peopleInformation * pi2 = [[peopleInformation alloc]init];
    pi2.name = @"油田一貴";
    pi2.age = @"24";
    pi2.from = @"大阪";
    pi2.mystory = @"ビジネス";
    pi2.history = @"教育";
    pi2.mystery = @"IT";
    pi2.mystoryInfo = @"ベンチャーのお手伝い";
    pi2.historyInfo = @"塾講師";
    pi2.mysteryInfo = @"O2Oでてっぺんとったんで";
    pi2.basicInfo = @"おしゃれ番長";
    pi2.image = @"aburata.jpg";
    pi2.status = @"(株)OMOROI代表";
    
    _resultArray = @[pi3,pi1, pi2];
    
    
    //-------------------検索結果として表示する仮データ----------------------------

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//セクションは一個
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

//セル数。とりあえず一個
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _resultArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* CellIdentifier = @"ResultTableViewCell";
    ResultTableViewCell* cell = [_resultTableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

    //表示データを取得
    peopleInformation * displayInfo = _resultArray[indexPath.row];
    
    cell.nameLabel.text = displayInfo.name;
    cell.myStroyLabel.text = displayInfo.mystory;
    cell.historyLabel.text = displayInfo.history;
    cell.mysteryLabel.text = displayInfo.mystery;
    cell.statusLabel.text = displayInfo.status;
    
    //一言情報
    cell.infoLabel.text = displayInfo.basicInfo;
    
    //写真
    cell.image.image = [UIImage imageNamed:displayInfo.image];
    
    cell.clipsToBounds = YES;//frameサイズ外を描画しない
    return cell;
}

- (CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 240;
}

//セル選択時
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    //検索結果詳細画面へ遷移
    DetailViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    
    detailVC.selectedInfo = _resultArray[indexPath.row];
    
    [self.navigationController pushViewController:detailVC animated:YES];
    
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
