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
    
    
    //検索結果として表示する仮データ
    peopleInformation * pi1 = [[peopleInformation alloc]init];
    pi1.name = @"橋本直樹";
    pi1.age = @"24";
    pi1.from = @"大阪";
    pi1.mystory = @"デザイナー";
    pi1.history = @"IT";
    pi1.mystery = @"自由人";
    pi1.mystoryInfo = @"LINEスタンプをこつこつ作る";
    pi1.historyInfo = @"iOSアプリの開発に携わる";
    pi1.mysteryInfo = @"好きな時に釣りがしたい";
    pi1.basicInfo = @"大阪屈指の器用貧乏";
    pi1.image = @"hashimoto.JPG";
    
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
    
    
    _resultArray = @[pi1, pi2];
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
    ResultTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

    //表示データを取得
    peopleInformation * displayInfo = _resultArray[indexPath.row];
    
    cell.resultNameLabel.text = displayInfo.name;
    cell.resultInfoLabel.text = displayInfo.basicInfo;
    cell.mystoryLabel.text = displayInfo.mystory;
    cell.historyLabel.text = displayInfo.history;
    cell.mysteryLabel.text = displayInfo.mystery;
    cell.mystoryInfo.text = displayInfo.mystoryInfo;
    cell.historyInfo.text = displayInfo.historyInfo;
    cell.mysteryInfo.text = displayInfo.mysteryInfo;
    
    
    
    cell.resultImageView.image = [UIImage imageNamed:displayInfo.image];
    
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

@end
