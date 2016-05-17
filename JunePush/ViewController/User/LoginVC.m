//
//  LoginVC.m
//  JunePush
//
//  Created by June on 16/4/21.
//  Copyright © 2016年 June. All rights reserved.
//

#import "LoginVC.h"
#import "HomePageVC.h"
@interface LoginVC ()

@end

@implementation LoginVC{
    NSArray *placeholderArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    placeholderArray = @[@"用户名/邮箱",@"密码"];
    WS(ws);
    
    UIView *lastView = nil;
    for (int i = 0; i < 2; i ++) {
        UIView *view = [self createView:i];
        [self.contentView addSubview:view];
        
        [view makeConstraints:^(MASConstraintMaker *make){
            make.width.equalTo(SCREEN_WIDTH - 40);
            make.height.equalTo(70);
            make.centerX.equalTo(ws.contentView);
            if (lastView) {
                make.top.equalTo(lastView.bottom).offset(20);
            }
            else{
                make.top.equalTo(ws.contentView).offset(100);
            }
        }];
        
        lastView = view;
    }
    
    
    [self.contentView updateConstraints:^(MASConstraintMaker *make){
        make.bottom.equalTo(lastView);
    }];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                             target:self
                             action:@selector(clickLogin)];
    self.navigationItem.rightBarButtonItem = item;
}

- (UIView *)createView:(int)tag{
    UIView *view = [UIView new];
    UILabel *label = [UILabel new];
    label.text = placeholderArray[tag];
    [view addSubview:label];
    
    UITextField *textField = [UITextField new];
    textField.layer.borderColor = [UIColor blueColor].CGColor;
    textField.layer.borderWidth = 1.0f;
    textField.tag = 100 + tag;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.autocorrectionType = UITextAutocorrectionTypeNo;
    textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [view addSubview:textField];
    
    [label makeConstraints:^(MASConstraintMaker *make){
        make.top.left.equalTo(view);
    }];
    
    [textField makeConstraints:^(MASConstraintMaker *make){
        make.right.width.left.bottom.equalTo(view);
        make.top.equalTo(label.bottom).equalTo(5);
    }];
    
    [view  makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(label);
        make.bottom.equalTo(textField);
    }];
    
    if (tag == 1) {
        textField.secureTextEntry = YES;
    }
    return view;
}

- (void)clickLogin{
    for (UIView *view in self.contentView.subviews) {
        for (UITextField *textFiled in view.subviews) {
            if ([textFiled isKindOfClass:[UITextField class]]) {
                if (textFiled.text.length == 0) {
                    Alert(@"输入不完整");
                    return;
                }
            }
        }
    }

    UITextField *userName = [(UITextField *)self.contentView viewWithTag:100];
    UITextField *password = [(UITextField *)self.contentView viewWithTag:101];
    NSDictionary *dic = @{@"userName":userName.text,@"password":password.text};
    [CustomURLRequest connectWithURL:LOGIN bodyDictionary:dic methods:POST delegate:self];

}

#pragma mark - ConnectionDelegate
- (void)onSuccess:(id)data andTask:(NSURLSessionDataTask *)task{
    [UserDefault saveUserDefault:@"userInfo" andValue:data[0]];
    HomePageVC *vc = [HomePageVC new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)onError:(NSString *)errorString{
    Alert(errorString);
}


@end
