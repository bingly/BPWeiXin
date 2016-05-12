//
//  BPTimeLineCellModel.h
//  BPWeiXin
//
//  Created by bingcai on 16/5/12.
//  Copyright © 2016年 bingcai. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BPTimeLIneCellLikeModel, BPTimeLIneCellCommentItemModel;

@interface BPTimeLineCellModel : NSObject

@property (nonatomic, copy) NSString *iconName;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *msgContent;
@property (nonatomic, strong) NSArray *picNamesArray;

@property (nonatomic, assign, getter=isLiked) BOOL liked;

@property (nonatomic, strong) NSArray<BPTimeLIneCellLikeModel *> *likeItemsArray;
@property (nonatomic, strong) NSArray<BPTimeLIneCellCommentItemModel *> *commentItemsArray;

@property (nonatomic, assign) BOOL isOpening;

@property (nonatomic, assign, readonly) BOOL shouldShowMoreButton;

- (NSArray *)createModelsWithCount:(NSInteger)count;

@end


@interface BPTimeLIneCellLikeModel : NSObject

@property (nonatomic, copy) NSString *useName;
@property (nonatomic, copy) NSString *userId;

@end

@interface BPTimeLIneCellCommentItemModel : NSObject

@property (nonatomic, copy) NSString *commentString;

@property (nonatomic, copy) NSString *firstUserName;
@property (nonatomic, copy) NSString *firstUserId;

@property (nonatomic, copy) NSString *secondUserName;
@property (nonatomic, copy) NSString *secondUserId;

@end
