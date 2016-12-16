//
//  DropDownView.m
//  MiSTERY
//
//  Created by 橋本直樹 on 2016/12/13.
//  Copyright © 2016年 橋本直樹. All rights reserved.
//

#import "DropDownView.h"



@implementation DropDownView

-(id)init{
    
    _industryArray = @[@"IT",@"コンサル",@"教育",@"広告",@"アパレル",@"出版",@"不動産",@"映像",@"人材",@"小売",@"医療",@"旅行",@"ゲーム",@"美容",@"メーカー",@"サービス",@"金融",@"NPO",@"商社",@"士業"];
    
    return self;
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _industryArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.textLabel.text = _industryArray[indexPath.row];
    
    return cell;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
