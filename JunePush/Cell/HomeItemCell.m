//
//  HomeItemCell.m
//  JunePush
//
//  Created by June on 16/4/22.
//  Copyright © 2016年 June. All rights reserved.
//

#import "HomeItemCell.h"

@implementation HomeItemCell{
    UIView *aView;
}

- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initViews];
    }
    return self;
}

- (void)initViews{
    aView = [UIView new];
    [self.contentView addSubview:aView];

    WS(ws);
    [aView makeConstraints:^(MASConstraintMaker *make){
        make.center.equalTo(ws.contentView);
    }];
    
    _upperImgView = [UIImageView new];
    _upperImgView.backgroundColor = [UIColor redColor];
    [aView addSubview:_upperImgView];
    
    [_upperImgView makeConstraints:^(MASConstraintMaker *make){
        make.top.left.equalTo(aView);
        make.width.equalTo(SCREEN_WIDTH - 100);
        make.height.equalTo(200);
    }];
    
    _priceLabel = [UILabel new];
    _priceLabel.backgroundColor = [UIColor redColor];
    _priceLabel.text = @"adfad";
    [aView addSubview:_priceLabel];
    
    [_priceLabel makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(_upperImgView.bottom).offset(10);
        make.width.left.equalTo(aView);
        make.height.greaterThanOrEqualTo(10);
    }];

    [aView updateConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(_upperImgView);
        make.width.equalTo(_upperImgView);
        make.bottom.equalTo(_priceLabel);
    }];

    
}

@end
