//
//  HomeItemCell.h
//  JunePush
//
//  Created by June on 16/4/22.
//  Copyright © 2016年 June. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeItemCell : UICollectionViewCell
@property (nonatomic,strong) UIImageView *upperImgView;
@property (nonatomic,strong) UILabel *priceLabel;
@property (nonatomic,strong) NSDictionary *dataDic;
@end
