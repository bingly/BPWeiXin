//
//  BPTimeLineRefreshFooter1.h
//  BPWeiXin
//
//  Created by bingcai on 16/5/13.
//  Copyright © 2016年 bingcai. All rights reserved.
//

#import "SDBaseRefreshView.h"

@interface BPTimeLineRefreshFooter : SDBaseRefreshView

+ (instancetype)refreshFooterWithRefreshingText:(NSString *)text;

- (void)addTOScrollView:(UIScrollView *)scrollView refreshOpration:(void(^)())refresh;

@property (nonatomic, strong) UILabel *indicatorLabel;
@property (nonatomic, strong) UIActivityIndicatorView *indicator;

@property (nonatomic, copy) void (^refreshBlock)();

@end
