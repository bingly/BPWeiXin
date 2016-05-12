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

NSString *const kTimeLineTableViewCellId = @"BPTimeLineCell";
static CGFloat textFieldH = 40;

@interface BPTimeLineTableViewController ()

@end

@implementation BPTimeLineTableViewController {

    SDTimeLineRefreshHeader *_refreshHeader;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
   
    [self.dataArray addObjectsFromArray:@[@"bing", @"pin", @"cai", @"wang", @"shu"]];
    
//    __weak typeof(self) weakSelf = self;

    SDTimeLineTableHeaderView *headerView = [SDTimeLineTableHeaderView new];
    headerView.frame = CGRectMake(0, 0, 0, 260);
    self.tableView.tableHeaderView = headerView;
    
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
                [weakSelf.dataArray addObjectsFromArray:@[@"a",@"b",@"c",@"d",@"e"]];
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

    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kTimeLineTableViewCellId];
    cell.textLabel.text = self.dataArray[indexPath.row];
    
    return cell;
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
