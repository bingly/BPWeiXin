//
//  BPTimeLineRefreshFooter1.m
//  BPWeiXin
//
//  Created by bingcai on 16/5/13.
//  Copyright © 2016年 bingcai. All rights reserved.
//

#import "BPTimeLineRefreshFooter.h"

@implementation BPTimeLineRefreshFooter

+ (instancetype)refreshFooterWithRefreshingText:(NSString *)text {

    BPTimeLineRefreshFooter *footer = [BPTimeLineRefreshFooter new];
    return footer;
}

- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        nil;
    }
    return self;
}

- (void)addTOScrollView:(UIScrollView *)scrollView refreshOpration:(void (^)())refresh {

    self.scrollView = scrollView;
    self.refreshBlock = refresh;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {

    NSLog(@"observeValueForKeyPath");
}

@end
