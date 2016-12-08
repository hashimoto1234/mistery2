//
//  peopleInformation.h
//  MiSTERY
//
//  Created by 橋本直樹 on 2016/12/04.
//  Copyright © 2016年 橋本直樹. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface peopleInformation : NSObject

@property (nonatomic, strong) NSString * name;

@property (nonatomic) NSString * age;

@property (nonatomic, strong) NSString * from;

//今やってること
@property (nonatomic, strong) NSString * mystory;

//今までやったこと
@property (nonatomic, strong) NSString * history;

//これからしたいこと
@property (nonatomic, strong) NSString * mystery;

//今やってること
@property (nonatomic, strong) NSString * mystoryInfo;

//今までやったこと
@property (nonatomic, strong) NSString * historyInfo;

//これからしたいこと
@property (nonatomic, strong) NSString * mysteryInfo;


//基本情報
@property (nonatomic, strong) NSString * basicInfo;

//写真のファイル名
@property (nonatomic, strong) NSString * image;

@end
