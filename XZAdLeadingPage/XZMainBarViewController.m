//
//  XZMainBarViewController.m
//  XZAdLeadingPage
//
//  Created by 肖准 on 10/11/2016.
//  Copyright © 2016 xiaozhun. All rights reserved.
//

#import "XZMainBarViewController.h"

@interface XZMainBarViewController ()

@end

@implementation XZMainBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.viewControllers = @[[UIViewController new ],[UIViewController new ],[UIViewController new ],[UIViewController new ]];
    NSArray* titles = @[@"微信",@"通讯录",@"发现",@"我"];
    
    [self.tabBar.items enumerateObjectsUsingBlock:^(UITabBarItem * _Nonnull item, NSUInteger idx, BOOL * _Nonnull stop) {
        [item setTitle:titles[idx]];
        
    }];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
