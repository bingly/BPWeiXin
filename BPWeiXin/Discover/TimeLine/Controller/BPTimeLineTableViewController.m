//
//  BPTimeLineTableViewController.m
//  BPWeiXin
//
//  Created by bingcai on 16/5/11.
//  Copyright © 2016年 bingcai. All rights reserved.
//

#import "BPTimeLineTableViewController.h"
#import "SDTimeLineTableHeaderView.h"
#import "SDTimeLineRefreshHeader.h"
#import "BPTimeLineCell.h"
#import "BPTimeLineCellModel.h"
#import "BPTimeLineRefreshFooter.h"
#import "SDTimeLineRefreshFooter.h"

#import "UITableView+SDAutoTableViewCellHeight.h"

NSString *const kTimeLineTableViewCellId = @"BPTimeLineCell";
static CGFloat textFieldH = 40;

@interface BPTimeLineTableViewController ()

@end

@implementation BPTimeLineTableViewController {

    SDTimeLineRefreshHeader *_refreshHeader;
    BPTimeLineRefreshFooter *_refreshFooter;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
   
//    [self.dataArray addObjectsFromArray:@[@"bing", @"pin", @"cai", @"wang", @"shu"]];
    BPTimeLineCellModel *model = [BPTimeLineCellModel new];
    NSArray *currentArr = [model createModelsWithCount:10];
    [self.dataArray addObjectsFromArray:currentArr];
    
//    __weak typeof(self) weakSelf = self;
//    __weak BPTimeLineCellModel *weakModel = model;
    
//    _SDRefreshFooter = [SDTimeLineRefreshFooter refreshFooterWithRefreshingText:@"_refreshFooter"];
//    [_SDRefreshFooter addToScrollView:self.tableView refreshOpration:nil];
    
    _refreshFooter = [BPTimeLineRefreshFooter refreshFooterWithRefreshingText:@"_refreshFooter"];
    [_refreshFooter addTOScrollView:self.tableView refreshOpration:nil];
    
//    _refreshFooter1 = [BPTimeLineRefreshFooter1 refreshFooterWithRefreshingText:@"_refreshFooter"];
//    [_refreshFooter1 addTOScrollView1:self.tableView];
    
//    _refreshFooter = [BPTimeLineRefreshFooter refreshFooterWithRefreshingText:@"正在加载数据..."];
//    __weak typeof(_refreshFooter) weakRefreshFooter = _refreshFooter;
//    [_refreshFooter addToScrollView:self.tableView refreshOpration:^{
//    
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [weakSelf.dataArray addObjectsFromArray:[weakModel createModelsWithCount:10]];
//            [weakSelf.tableView reloadData];
//            [weakRefreshFooter endRefreshing];
//        });
//    }];

    SDTimeLineTableHeaderView *headerView = [SDTimeLineTableHeaderView new];
    headerView.frame = CGRectMake(0, 0, 0, 260);
    self.tableView.tableHeaderView = headerView;
    
    [self.tableView registerClass:[BPTimeLineCell class] forCellReuseIdentifier:kTimeLineTableViewCellId];
}

- (void)viewDidAppear:(BOOL)animated {

    [super viewDidAppear:animated];
    
    if (!_refreshHeader.superview) {
        
        _refreshHeader = [SDTimeLineRefreshHeader refreshHeaderWithCenter:CGPointMake(40, 45)];
        _refreshHeader.scrollView = self.tableView;
        __weak typeof(_refreshHeader) weakHeader = _refreshHeader;
        __weak typeof(self) weakSelf = self;
        [_refreshHeader setRefreshingBlock:^{
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [weakSelf.dataArray removeAllObjects];
                [weakSelf.dataArray addObjectsFromArray:[[BPTimeLineCellModel new] createModelsWithCount:10]];
                [weakHeader endRefreshing];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [weakSelf.tableView reloadData];
                });
            });
        }];
        [self.tableView.superview addSubview:_refreshHeader];
    }
}

- (void)dealloc {
    
    [_refreshHeader removeFromSuperview];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

//    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kTimeLineTableViewCellId];
//    cell.textLabel.text = self.dataArray[indexPath.row];
    
    BPTimeLineCell *cell = [tableView dequeueReusableCellWithIdentifier:kTimeLineTableViewCellId];
    cell.model = self.dataArray[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    id model = self.dataArray[indexPath.row];
    return [self.tableView cellHeightForIndexPath:indexPath model:model keyPath:@"model" cellClass:[BPTimeLineCell class] contentViewWidth:[self cellContentViewWidth]];

}

- (CGFloat)cellContentViewWidth {

    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    return width;
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
