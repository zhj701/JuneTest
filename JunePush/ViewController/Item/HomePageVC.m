//
//  HomePageVC.m
//  JunePush
//
//  Created by June on 16/4/22.
//  Copyright © 2016年 June. All rights reserved.
//

#import "HomePageVC.h"
#import "HomeItemCell.h"
#import <HealthKit/HealthKit.h>
@interface HomePageVC ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) HKHealthStore *healthStore;
@end

@implementation HomePageVC{
    UITextField *textFiled;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    UIBarButtonItem *item = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                             target:self
                             action:@selector(clickLogin)];
    self.navigationItem.rightBarButtonItem = item;

    // 1.方向
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    // 2.表格
    UICollectionView *collectView = [[UICollectionView alloc]
                                     initWithFrame:CGRectMake(0,
                                                              0,
                                                              SCREEN_WIDTH,
                                                              SCREEN_HEIGHT - 64)
                                     collectionViewLayout:flowLayout];
    collectView.delegate = self;
    collectView.dataSource = self;
    collectView.pagingEnabled = YES;
    [self.view addSubview:collectView];
    
    // 3.注册
    [collectView registerClass:[HomeItemCell class] forCellWithReuseIdentifier:@"cell"];
}

- (void)clickLogin{

}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 5;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * CellIdentifier = @"cell";
    HomeItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier
                                                                   forIndexPath:indexPath];
    return cell;
}

#pragma mark --UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT - 64);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

@end
