//
//  LJTimeManagerLoginVC.m
//  LJTimeManagerLoginVC
//
//  Created by 刘瑾 on 16/9/27.
//  Copyright © 2016年 刘瑾. All rights reserved.
//

#import "LJTimeManagerLoginVC.h"
#import "LJDynamicShowHeaderView.h"
#import "LJTimeManagerLoginView.h"

@class LJTimeManagerLoginView;
@class LJDynamicShowHeaderView;


@interface LJTimeManagerLoginVC ()

@property (nonatomic) UIImageView *contentView;
@property (nonatomic) UIColor *viewColor;

@property (nonatomic) LJDynamicShowHeaderView *loginHead;

@property (nonatomic) LJTimeManagerLoginView *loginView;

@property (nonatomic) CGSize viewSize;

@end

@implementation LJTimeManagerLoginVC

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.loginView endEditing:YES];
    
}

-(void )loginSuccess{
    
    NSLog(@"登录成功");
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.viewSize = self.view.frame.size;
    
    [self loginView];
    [self loginHead];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.view bringSubviewToFront:self.loginHead];
}

#pragma mark - Lazy

- (UIImageView *)contentView {
    if(_contentView == nil) {
        _contentView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 40, self.viewSize.width - 10 *2, (self.viewSize.height - 30 * 2))];
        [self.view addSubview:_contentView];
        
        LJSetViewCornerRadius(10, _contentView.layer);
        _contentView.backgroundColor = self.viewColor;
        _contentView.userInteractionEnabled = YES;
    }
    return _contentView;
}

- (LJDynamicShowHeaderView *)loginHead {
	if(_loginHead == nil) {
        CGSize size = self.contentView.frame.size;
		_loginHead = [[LJDynamicShowHeaderView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height / 2)];
        [self.contentView addSubview:_loginHead];
        
        _loginHead.backgroundColor = [UIColor clearColor];
        
	}
	return _loginHead;
}

- (LJTimeManagerLoginView *)loginView {
    if(_loginView == nil) {
        int div = 8;
        CGSize size = self.loginHead.frame.size;
        CGFloat left = size.width / div;
        CGFloat top = size.height;
        CGFloat width = left * (div - 2);
        
        _loginView = [[LJTimeManagerLoginView alloc] initWithFrame:CGRectMake(left, top, width, 200)];
        
        [self.contentView addSubview:_loginView];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginSuccess) name:LJ_LOGIN_SUCCESS object:nil];
    }
    return _loginView;
}

- (UIColor *)viewColor {
	if(_viewColor == nil) {
		_viewColor = [UIColor colorWithRed:RGB_FLOAT(247) green:RGB_FLOAT(112) blue:RGB_FLOAT(123) alpha:1.0];
	}
	return _viewColor;
}



@end
