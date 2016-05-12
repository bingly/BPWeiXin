//
//  BPDiscoverTableViewController.m
//  BPWeiXin
//
//  Created by bingcai on 16/5/11.
//  Copyright © 2016年 bingcai. All rights reserved.
//

#import "BPDiscoverTableViewController.h"
#import "BPTimeLineTableViewController.h"

@implementation BPDiscoverTableViewController

- (instancetype)init {

    return [[UIStoryboard storyboardWithName:@"BPDiscoverTableViewController" bundle:nil] instantiateInitialViewController];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 5;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.section != 0) {
        return;
    }
    
    BPTimeLineTableViewController *controller = [[BPTimeLineTableViewController alloc] init];
    controller.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:controller animated:YES];
}


@end
