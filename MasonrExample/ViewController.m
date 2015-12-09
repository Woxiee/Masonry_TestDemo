//
//  ViewController.m
//  MasonrExample
//
//  Created by Faker on 15/12/7.
//  Copyright © 2015年 Faker. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"


#import "YTKKeyValueStore.h"
//相对iphone6 屏幕比
#define KWidth_Scale    [UIScreen mainScreen].bounds.size.width/375.0f
#define KHeight_Scale     [UIScreen mainScreen].bounds.size.height/667
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    __weak typeof(& *self) weakSelf = self;
    UIView *sv = [UIView new];
    sv.backgroundColor = [UIColor redColor];
    [self.view addSubview:sv];
    
    UIView *view1 = [UIView new];
    view1.backgroundColor = [UIColor blackColor];
    [self.view addSubview:view1];
    
    UIView *view2 = [UIView new];
    view2.backgroundColor = [UIColor brownColor];
    [self.view addSubview:view2];
    
    UIView *view4 = [UIView new];
    view4.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:view4];


//    
//    int height = KHeight_Scale * 300;

    [sv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view).offset(20);
        make.left.equalTo(weakSelf.view).offset(10);
        make.right.equalTo (view2.mas_left).offset(-10);
         make.height.mas_equalTo(KHeight_Scale * 300);
        make.width.equalTo(view2);
    }];
    
    [view2 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view).offset(20);
        make.left.equalTo(sv.mas_right).with.offset(-10);
        make.right.equalTo(weakSelf.view).with.offset(-10);
        make.height.mas_equalTo(KHeight_Scale * 300);
        make.width.equalTo(view2);
        
    }];

    
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(sv.mas_bottom).offset(10);
        make.left.equalTo(weakSelf.view).offset(10);
        make.right.equalTo(weakSelf.view).offset(-10);
        make.bottom.equalTo (view4.mas_top).offset(-10);
    }];


    
    [view4 mas_makeConstraints:^(MASConstraintMaker *make) {

        make.height.mas_equalTo(20 * KHeight_Scale);
//        make.top.equalTo(view4.mas_bottom).offset(10);
        make.left.equalTo (weakSelf.view).offset(10);
        make.right.equalTo(weakSelf.view).offset( -10);
        make.bottom.equalTo(weakSelf.view.mas_bottom).offset( -10);
        
    }];

    /*
    UIView *sv1 = [UIView new];
    sv1.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:sv1];
    [sv1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(sv).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
    
    
    int padding1 = 10;
    UIView *sv2 = [UIView new];
    sv2.backgroundColor = [UIColor lightGrayColor];

    [sv addSubview:sv2];
    
    UIView *sv3 = [UIView new];
    sv3.backgroundColor = [UIColor lightGrayColor];
    [sv addSubview:sv3];
    [sv2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(sv.mas_centerY);
        make.left.equalTo(sv.mas_left).with.offset(padding1);
        make.right.equalTo(sv3.mas_left).with.offset(-padding1);
        make.height.mas_equalTo(@150);
        make.width.equalTo(sv3);
    }];
    
    [sv3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(sv.mas_centerY);
        make.left.equalTo(sv2.mas_right).with.offset(padding1);
        make.right.equalTo(sv.mas_right).with.offset(-padding1);
        make.height.mas_equalTo(@150);
//        make.width.equalTo(sv2);
    }];
   */
   
//    UIScrollView *scrollView = [UIScrollView new];
//    scrollView.backgroundColor = [UIColor whiteColor];
//    [sv addSubview:scrollView];
//    
//    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(sv).with.insets(UIEdgeInsetsMake(5, 5, 5, 5));
//    }];
//    
//    UIView *container = [UIView new];
//    [scrollView addSubview:container];
//    [container mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(scrollView);
//        make.width.equalTo(scrollView);
//    }];
//    int count = 10;
//    UIView *lastView = nil;
//    for (int i = 0; i <= count; i++) {
//        UIView *subv = [UIView new];
//        [container addSubview:subv];
//        subv.backgroundColor = [UIColor colorWithHue:( arc4random() % 256 / 256.0 )
//                                          saturation:( arc4random() % 128 / 256.0 ) + 0.5
//                                          brightness:( arc4random() % 128 / 256.0 ) + 0.5
//                                               alpha:1];
//        
//       [subv mas_makeConstraints:^(MASConstraintMaker *make) {
//           make.left.and.right.equalTo(container);
//           make.height.mas_equalTo(@(20*i));
//           
//           if ( lastView )
//           {
//               make.top.mas_equalTo(lastView.mas_bottom);
//           }
//           else
//           {
//               make.top.mas_equalTo(container.mas_top);
//           }
//           
//       }];
//         lastView = subv;
//        
//    }
//    
//    [container mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(lastView.mas_bottom);
//    }];
//    
    YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:@"test.db"];
    NSString *tableName = @"user_table";
    // 创建名为user_table的表，如果已存在，则忽略该操作
    [store createTableWithName:tableName];
    NSString *key = @"1";
    NSDictionary *user = @{@"id": @1, @"name": @"tangqiao", @"age": @30};

    
    [store putObject:user withId:key intoTable:tableName];
    
    NSString *key1 = @"2";
    
     NSDictionary *user1 = @{@"id": @2, @"name": @"wuekachao", @"age": @24};
    [store putObject:user1 withId:key1 intoTable:tableName];

    NSDictionary *dicrr = (NSDictionary *)[store getYTKKeyValueItemById:key fromTable:tableName];
    NSLog(@"dicrr = %@",dicrr);
    
    NSDictionary *dicrr1 = (NSDictionary *)[store getYTKKeyValueItemById:key1 fromTable:tableName];
    NSLog(@"dicrr1 = %@",dicrr1);
    
    
  }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
