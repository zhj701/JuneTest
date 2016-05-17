//
//  BaseVC.m
//  JunePush
//
//  Created by June on 16/4/21.
//  Copyright © 2016年 June. All rights reserved.
//

#import "BaseVC.h"

@interface BaseVC ()

@end

@implementation BaseVC

- (void)viewDidLoad {
    [super viewDidLoad];

    WS(ws);
    // 1.scrollsv
    _sv = [UIScrollView new];
    [self.view addSubview:_sv];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self
                                                                         action:@selector(clickTap)];
    [_sv addGestureRecognizer:tap];
    
    [_sv makeConstraints:^(MASConstraintMaker *make){
        make.edges.equalTo(ws.view);
    }];
    
    // 2.设置contentView
    _contentView = [UIView new];
    [_sv addSubview:_contentView];
    
    [_contentView makeConstraints:^(MASConstraintMaker *make){
        make.edges.equalTo(_sv);
        make.width.equalTo(_sv);
    }];
}

#pragma mark - Btn
- (void)clickTap{
    [self.view endEditing:YES];
}

@end
