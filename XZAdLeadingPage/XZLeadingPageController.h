//
//  XZLeadingPageController.h
//  XZAdLeadingPage
//
//  Created by 肖准 on 09/11/2016.
//  Copyright © 2016 xiaozhun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XZCollectionViewCell.h"

@interface XZLeadingPageController : UIViewController
@property(nonatomic,readonly)UIPageControl* pageController;

typedef void(^XZLeadingPageSetCellHandler)(XZCollectionViewCell*cell , NSIndexPath* index);
typedef void(^XZLeadingPageSetFinishHandler)(UIButton* finishBtn);

/**
 *  启动页的初始化
 *
 *  @param count         启动页数目
 *  @param cellHandler   cell属性设置
 *  @param finishHandler 点击进入
 *
 *  @return return value description
 */
-(instancetype)initWithPagesCount:(NSInteger)count setCellHandler:(XZLeadingPageSetCellHandler)cellHandler setFinishHandler:(XZLeadingPageSetFinishHandler)finishHandler;

@end
