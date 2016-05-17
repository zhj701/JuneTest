//
//  ViewController.m
//  JunePush
//
//  Created by June on 16/4/19.
//  Copyright © 2016年 June. All rights reserved.
//

#import "ViewController.h"
#import "RegisterVC.h"
#import "LoginVC.h"

@interface ViewController ()<ConnectionDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *view = [UIView new];
    [self.view addSubview:view];
    
    UIButton *btn = [UIButton new];
    btn.layer.borderWidth = 1.0f;
    btn.layer.borderColor = [UIColor blackColor].CGColor;
    [btn setTitle:@"登录" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickLogin) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];

    UIButton *btn2 = [UIButton new];
    btn2.layer.borderWidth = 1.0f;
    btn2.layer.borderColor = [UIColor blackColor].CGColor;
    [btn2 setTitle:@"注册" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(clickSignUp) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    WS(ws);
    [btn makeConstraints:^(MASConstraintMaker *make){
        make.top.left.width.equalTo(view);
        make.height.equalTo(40);
    }];
    
    [btn2 makeConstraints:^(MASConstraintMaker *make){
        make.left.width.equalTo(view);
        make.top.equalTo(btn.bottom).equalTo(10);
        make.height.equalTo(btn);
    }];
    
    [view makeConstraints:^(MASConstraintMaker *make){
        make.center.equalTo(ws.view);
        make.width.equalTo(SCREEN_WIDTH - 100);
        make.height.equalTo(40 * 2 + 20);
    }];
}

#pragma mark - Methods
- (void)clickLogin{
    LoginVC *vc = [LoginVC new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)clickSignUp{
    RegisterVC *vc = [RegisterVC new];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
