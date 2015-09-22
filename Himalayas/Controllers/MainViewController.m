//
//  MainViewController.m
//  Himalayas
//
//  Created by qianfeng on 15/9/21.
//  Copyright (c) 2015年 姜奎. All rights reserved.
//

#import "MainViewController.h"
#import "RecommendViewController.h"
#import "ClassifyViewController.h"
#import "TeleviseViewController.h"
#import "TopListViewController.h"
#import "AnchorViewController.h"
#import "SearchViewController.h"
@interface MainViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>{
    UICollectionView*_collection;
    
}

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)createView{
    [self createNavigationRightBtn];
    [self createTopBar];
    [self createCollection];
    
    
   
}
-(void)createNavigationRightBtn{
    UIButton*btn=[Factory creatButton_WithFrame:CGRectMake(0, 0, 44, 44) target:self sel:@selector(searchClick:) tag:1 image:@"bar_btn_icon_search@2x" title:nil];
    [self addItemsWithCustomViews:@[btn] isLeft:NO];
}
-(void)searchClick:(UIButton*)btn{
    SearchViewController*svc=[[SearchViewController alloc]init];
    [self.navigationController pushViewController:svc animated:YES];
}

-(void)createTopBar{
    NSArray*ary=@[@"推荐",@"分类",@"直播",@"榜单",@"主播"];
    for (int i=0; i<ary.count; i++) {
        UIButton*btn=[Factory createButton_WithTitle:ary[i] frame:CGRectMake(ScreenWidth/5*i, 64, ScreenWidth/5, 30) target:self selector:@selector(scollectionAction:)];
        btn.tag=100+i;
        [btn setImage:[UIImage imageNamed:@""] forState:(UIControlStateHighlighted)];
        [self.view addSubview:btn];
    }
}
-(void)scollectionAction:(UIButton*)btn{
    [_collection setContentOffset:CGPointMake(ScreenWidth*(btn.tag-100), 0) animated:YES];

}

#pragma mark--UIScollViewDelegate

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

}
-(void)createCollection{
    self.automaticallyAdjustsScrollViewInsets = NO;
//    self.tabBarController.tabBar.hidden=YES;
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    //设置cell 的大小
    layout.itemSize = CGSizeMake(ScreenSize.width, ScreenSize.height-94-49);
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    
    _collection = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 94, ScreenSize.width, ScreenSize.height-94-49) collectionViewLayout:layout];
    _collection.dataSource = self;
    _collection.delegate = self;
    //按页滚动
    _collection.pagingEnabled = YES;
    
    [_collection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    [self.view addSubview:_collection];

}

#pragma mark--<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 5;
    
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell*cell=nil;
    switch (indexPath.row) {
        case 0:
        {
            cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
            RecommendViewController*rvc=[[RecommendViewController alloc]initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height-49-94)];
            rvc.view.backgroundColor=[UIColor redColor];
            [cell addSubview:rvc.view];
        }
            break;
        case 1:
        {
            cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
            ClassifyViewController*cvc=[[ClassifyViewController alloc]initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height-49-94)];
            [cell addSubview:cvc.view];
        }
            break;
        case 2:
        {
            cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
            TeleviseViewController*tvc=[[TeleviseViewController alloc]initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height-49-94)];
            
            [cell addSubview:tvc.view];
        }
            break;
        case 3:
        {
            cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
            TopListViewController*top=[[TopListViewController alloc]initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height-49-94)];
            
            [cell addSubview:top.view];
        }
            break;
        default:
            
            cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
            AnchorViewController*avc=[[AnchorViewController alloc]initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height-49-94)];
            
            [cell addSubview:avc.view];
            break;
    }
    return cell;
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
