//
//  CYSegmentedView.h
//  
//
//  Created by delims on 15/11/9.
//  Copyright © 2015年 delims. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ItemClickBlock)(NSInteger index);

@class CYSegmentedView;

@protocol CYSegmentedViewDelegate <NSObject>

- (void)segmentedView:(CYSegmentedView* _Nullable)segmentedView didClickAtIndex:(NSInteger)index;

@end

@interface CYSegmentedView : UIScrollView

@property (nonnull,nonatomic,strong) NSArray<NSString*> * itemNames;
@property (nullable,nonatomic,strong) UIFont *itemNameFont;


@property (nullable,nonatomic,strong) UIColor* vernierColor;
@property (nullable,nonatomic,strong) UIColor* itemSelectedColor;
@property (nullable,nonatomic,strong) UIColor* itemNormalColor;
@property (nullable,nonatomic,copy) ItemClickBlock itemClickBlock;

@property (nonatomic,assign) NSInteger selectedIndex;
@property (nonatomic,assign) CGFloat   itemWidth;
@property (nonatomic,assign) CGFloat   vernierVerticalSpaceToBottom;
@property (nonatomic,assign) CGFloat   vernierHeight;
@property (nonatomic,assign) CGFloat   vernierWidth;
@property (nonatomic,assign) BOOL      centerSelectedItem;

@property (nullable,nonatomic,weak) id <CYSegmentedViewDelegate> segmentedDelegate;

@end


