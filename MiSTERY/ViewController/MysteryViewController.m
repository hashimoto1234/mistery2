//
//  MysteryViewController.m
//  MiSTERY
//
//  Created by 橋本直樹 on 2016/12/04.
//  Copyright © 2016年 橋本直樹. All rights reserved.
//

#import "MysteryViewController.h"

@interface MysteryViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;

@property  NSArray * displayInfo1;
@property  NSArray * displayInfo2;
@property  NSArray * displayInfo3;

@property  UIActivityIndicatorView *ai;


@property (weak, nonatomic) IBOutlet UIButton *searchButton;

@end

@implementation MysteryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //デリゲート・データソースの指定
    _myCollectionView.delegate = self;
    _myCollectionView.dataSource = self;
    
    //背景色をグレーに指定
    _myCollectionView.backgroundColor = [UIColor whiteColor];
    
    
    
    // UICollectionViewにカスタムセルを追加
    UINib *nibFirst = [UINib nibWithNibName:@"MyCollectionViewCell" bundle:nil];
    [_myCollectionView registerNib:nibFirst forCellWithReuseIdentifier:@"MyCollectionViewCell"];
    
    //ヘッダーもnib登録
    UINib *headerNib = [UINib nibWithNibName:@"CollectionViewHeader" bundle:nil];
    [_myCollectionView registerNib:headerNib forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CollectionViewHeader"];
    
    
    //各セクションに表示する情報（仮データ）
    self.displayInfo1 = @[@"IT", @"教育", @"スポーツ", @"ビジネス", @"飲食", @"デザイン"];
    self.displayInfo2 = @[@"IT", @"教育", @"スポーツ", @"ビジネス", @"飲食", @"デザイン"];
    self.displayInfo3 = @[@"IT", @"教育", @"スポーツ", @"ビジネス", @"飲食", @"デザイン"];
    
    
    //複数選択を許可
    self.myCollectionView.allowsMultipleSelection = YES;
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
    //とりあえず6個ずつにしとく
    
    NSInteger rowCount = 6;
    
    switch (section) {
        case 0:
            
            
            break;
            
        case 1:
            
            
            break;
            
        case 2:
            
            
            break;
        default:
            break;
    }
    
    
    
    return rowCount;
}


-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        CollectionviewHeader *sectionView = [_myCollectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CollectionViewHeader" forIndexPath:indexPath];
        
        switch (indexPath.section) {
            case 0:
                
                                sectionView.headerLabel.text = @"あなたが将来やりたいOMOROIを教えてください。";
                
                break;
                
            case 1:
                
                //                sectionView.headerLabel.text = @"現在";
                
                break;
                
            case 2:
                
                //                sectionView.headerLabel.text = @"未来";
                
                break;
            default:
                break;
        }
        
        return sectionView;
    } else {
        return nil;
    }
    
    
    
}

//セルサイズ
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    // 正方形で横に３つ並べる
    //     float size = (self.myCollectionView.frame.size.width - 10 * 4) / 3;
    //      return CGSizeMake(size, size*2/3);
    
    return CGSizeMake(50, 50);
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    //    UICollectionViewCell *cell = nil;
    //    cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell0" forIndexPath:indexPath];
    
    MyCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyCollectionViewCell" forIndexPath:indexPath];
    
    switch (indexPath.section) {
        case 0:
            
            cell.myLabel.text = _displayInfo1[indexPath.row];
            
            break;
            
        case 1:
            
            cell.myLabel.text = _displayInfo2[indexPath.row];
            
            break;
            
        case 2:
            
            cell.myLabel.text = _displayInfo3[indexPath.row];
            
            break;
            
        default:
            //処理なし
            
            break;
    }
    
    
    //文字色を黒に指定
    //    cell.backgroundColor = [UIColor blackColor];
    
    cell.myLabel.tintColor = [UIColor blackColor];
    
    //文字を中央揃えに指定
    cell.myLabel.textAlignment = NSTextAlignmentCenter;
    
    
    //    UIView *selectedView = [UIView new];
    //    selectedView.backgroundColor = [UIColor redColor];
    //    cell.selectedBackgroundView = selectedView;
    
    
    // 行のスクロール
    [_myCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredVertically animated:YES];
    return cell;
}



//セルタップ時処理
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    MyCollectionViewCell * cell = [collectionView cellForItemAtIndexPath:indexPath];
    
    if(cell.selected){
        cell.myImageView.image =[UIImage imageNamed:@"cell_Red_tap.png"];
    }else{
        cell.myImageView.image = [UIImage imageNamed:@"cell_Red.png"];
    }
    
}

@end
