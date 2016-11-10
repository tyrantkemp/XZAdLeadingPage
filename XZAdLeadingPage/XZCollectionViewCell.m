//
//  XZCollectionViewCell.m
//  XZAdLeadingPage
//
//  Created by 肖准 on 09/11/2016.
//  Copyright © 2016 xiaozhun. All rights reserved.
//

#import "XZCollectionViewCell.h"
@implementation XZCollectionViewCell

-(instancetype)init{
    if([super init]){
        [self initsubviews];
       // [self layout];
    }
    return  self;
    
}
-(instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        [self initsubviews];
     //   [self layout];
    }
    return  self;
    
}
-(void)initsubviews{
    [self.contentView addSubview:self.imageView];
    [self.contentView addSubview:self.button];
    
}
-(void)layout{
    
    self.imageView.frame = [self.contentView bounds];
    
    //根据字体自动调整高宽
    [self.button sizeToFit];
    CGFloat margin = 10.0;
    CGFloat btnheight = self.button.bounds.size.height + 2*margin;
    CGFloat btnwidth = self.button.bounds.size.width + 2*margin;
    CGFloat btnX = (self.contentView.bounds.size.width - btnwidth)/2;
    CGFloat btnY = self.contentView.bounds.size.height - 100 - btnheight;
    self.button.frame = CGRectMake(btnX, btnY, btnwidth, btnheight);
    
    
    
}
//子视图的frame layout自动调整
-(void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.frame = [self.contentView bounds];
    //根据字体自动调整高宽
    [self.button sizeToFit];
    CGFloat margin = 10.0;
    CGFloat btnheight = self.button.bounds.size.height + 2*margin;
    CGFloat btnwidth = self.button.bounds.size.width + 2*margin;
    CGFloat btnX = (self.contentView.bounds.size.width - btnwidth)/2;
    CGFloat btnY = self.contentView.bounds.size.height - 100 - btnheight;
    self.button.frame = CGRectMake(btnX, btnY, btnwidth, btnheight);
    
}
-(UIImageView*)imageView{
    if(!_imageView){
        _imageView = [UIImageView new];
        _imageView.contentMode = UIViewContentModeScaleToFill;
        
    }
    return  _imageView;
}

-(UIButton*)button{
    if(!_button){
        UIButton* bt = [UIButton new ];
        bt.backgroundColor = [UIColor yellowColor];
        bt.layer.masksToBounds = YES;
        bt.layer.cornerRadius = 10.f;
        _button = bt;
    }
    return  _button;
}

@end
