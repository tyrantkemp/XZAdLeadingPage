//
//  XZLeadingPageController.m
//  XZAdLeadingPage
//
//  Created by 肖准 on 09/11/2016.
//  Copyright © 2016 xiaozhun. All rights reserved.
//

#import "XZLeadingPageController.h"


static NSString* const cellId = @"colleciton.cell";

@interface XZLeadingPageController ()<UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate>{
    NSInteger _count;
}
@property(nonatomic,copy)XZLeadingPageSetCellHandler cellHandler;
@property(nonatomic,copy)XZLeadingPageSetFinishHandler finishHandler;

@property(nonatomic,strong)UICollectionView* collectionView;
@property(nonatomic,strong)UIPageControl* pageController;

@end

@implementation XZLeadingPageController


-(instancetype)initWithPagesCount:(NSInteger)count setCellHandler:(XZLeadingPageSetCellHandler)cellHandler setFinishHandler:(XZLeadingPageSetFinishHandler)finishHandler{
    self = [super init];
    if(self){
        _count = count;
        _cellHandler = [cellHandler copy];
        _finishHandler = [finishHandler copy];
        
        //懒加载
        [self.view addSubview:self.collectionView];
        [self.view addSubview:self.pageController];
        //注册cell
        [self.collectionView registerClass:[XZCollectionViewCell class] forCellWithReuseIdentifier:cellId];
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
}
#pragma mark - collection delegate 

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return  _count;
}
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    XZCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    if(!cell){
        cell = [XZCollectionViewCell new];
    }
    
    if(indexPath.row == _count-1){
        cell.button.hidden = NO;
        [cell.button addTarget:self action:@selector(finishBtnPress:) forControlEvents:UIControlEventTouchUpInside];
    }else {
        cell.button.hidden = YES;
        
    }
    //通过block设置cell属性
    if(_cellHandler){
        _cellHandler(cell,indexPath);
    }
    return  cell;

}
-(void)finishBtnPress:(UIButton*)btn{
    if(_finishHandler){
        _finishHandler(btn);
    }
}

#pragma mark - scrollview delegate 
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    //页数向上取整
    NSInteger currentpage = scrollView.contentOffset.x/scrollView.bounds.size.width+0.5;
    if(self.pageController.currentPage!= currentpage){
        self.pageController.currentPage = currentpage;
    }
}


#pragma mark - getters
-(UICollectionView*)collectionView{
    if(!_collectionView)
    {
        UICollectionViewFlowLayout * layout = [UICollectionViewFlowLayout new];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.itemSize = self.view.bounds.size;
        layout.minimumLineSpacing = 0.0;
        layout.minimumInteritemSpacing = 0.0;
        
        UICollectionView* colview = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
        
        
        colview.bounces = NO;
        colview.pagingEnabled = YES;
        colview.showsHorizontalScrollIndicator = NO;
        colview.delegate = self;
        colview.dataSource= self;
        _collectionView = colview;
        
        
    }
    return  _collectionView;
    
}
-(UIPageControl*)pageController{
    
    if(!_pageController){
        UIPageControl* pagectl = [UIPageControl new];
        pagectl.numberOfPages = _count;
        pagectl.currentPage = 0;
        CGSize pageSize = [pagectl sizeForNumberOfPages:_count];
        
        CGFloat pageX = (self.view.bounds.size.width - pageSize.width)/2;
        CGFloat pageY = (self.view.bounds.size.height - pageSize.height - 50.0);
        pagectl.frame = CGRectMake(pageX, pageY, pageSize.width, pageSize.height);
        _pageController = pagectl;
    }
    return  _pageController;
    
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
