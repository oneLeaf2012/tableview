//
//  ViewController.m
//  tableview
//
//  Created by shuzhenguo on 2017/6/11.
//  Copyright © 2017年 shuzhenguo. All rights reserved.
//

#import "ViewController.h"
#import "Common.h"
#import "RecommendTableViewCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,RecommendTableViewCellDelegate>
@property (nonatomic, strong) NSArray *dyDatas;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tableview.dataSource=self;
    
    self.tableview.delegate=self;
    
    
    
//    self.dyDatas=[NSArray arrayWithObjects:@"fvvf",@"weff",@"vdfv", nil];
    
    self.dyDatas=[NSArray arrayWithObjects:@"fvvf", nil];

//    self.dyDatas=[NSArray arrayWithObjects:@"fvvf", nil];

  }

#pragma mark - tableView数据源及代理



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
 
        return RECOMMEND_CELL_HEIGHT;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView             // Default is 1 if not implemented
{
    
    return  [self.dyDatas count];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    RecommendTableViewCell *cell = [RecommendTableViewCell cellWithTableView:tableView];
    cell.delegate = self;
    DYData *dyData = self.dyDatas[indexPath.section]
    ;
    cell.dyData = dyData;
    return cell;

}

#pragma mark - recommendTableViewCellDelegate

- (void)recommendTableViewCell:(RecommendTableViewCell *)cell didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"indexPath0000--%ld",(long)indexPath.row);
//    PlayerController *playerVc = [[PlayerController alloc] init];
//    playerVc.room = [self.dyDatas[indexPath.section] roomlist][indexPath.item];
//    [self presentViewController:playerVc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
