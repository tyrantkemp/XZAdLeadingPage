//
//  AppDelegate.m
//  XZAdLeadingPage
//
//  Created by 肖准 on 09/11/2016.
//  Copyright © 2016 xiaozhun. All rights reserved.
//

#import "AppDelegate.h"
#import "XZLeadingPageController.h"
#import "XZMainBarViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"Launched"];
    //主业务界面
    XZMainBarViewController * mainctl = [XZMainBarViewController new];

  
    XZLeadingPageController * xzctl = [[XZLeadingPageController alloc]initWithPagesCount:5 setCellHandler:^(XZCollectionViewCell *cell, NSIndexPath *index) {
        NSString* imagename = [NSString stringWithFormat:@"wangyiyun%ld",(long)index.row];
        cell.imageView.image = [UIImage imageNamed:imagename];
        
        [cell.button setTitle:@"立即体验" forState:UIControlStateNormal];
        [cell.button setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        
        
        
    } setFinishHandler:^(UIButton *finishBtn) {
        NSLog(@"点击完成按钮%@",[finishBtn class]);
        self.window.rootViewController = mainctl;

    }];
    
    
    
    xzctl.pageController.currentPageIndicatorTintColor = [UIColor purpleColor];
    xzctl.pageController.pageIndicatorTintColor = [UIColor orangeColor];
    
    
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyWindow];
    
    //判断是否是第一次启动
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"Launched"]){
        //第一次启动
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"Launched"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        self.window.rootViewController = xzctl;

    }else {
        self.window.rootViewController = mainctl;

        
    }
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
