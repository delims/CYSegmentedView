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

@property (nonnull,nonatomic,strong) NSArray<NSString*> * itemNames; /**< 包含所有item的数组 */
@property (nullable,nonatomic,strong) UIFont *itemNameFont; /**< 文字颜色 */

@property (nullable,nonatomic,strong) UIColor* bottomLineColor;  /**< 底部横线的颜色 */
@property (nullable,nonatomic,strong) UIColor* vernierColor; /**< 游标颜色 */
@property (nullable,nonatomic,strong) UIColor* itemSelectedColor; /**< item选择状态下的文字颜色 */
@property (nullable,nonatomic,strong) UIColor* itemNormalColor; /**< item未选择状态下的文字颜色 */
@property (nullable,nonatomic,copy) ItemClickBlock itemClickBlock; /**< 点击item的回调 */

@property (nonatomic,assign) NSInteger selectedIndex; /**< 当前选中item的索引 */
@property (nonatomic,assign) CGFloat   itemWidth; /**< 一个item的宽度，如果self太小放不下所有item，默认是50pt,并可以滚动，否则item平分self的宽度 */
@property (nonatomic,assign) CGFloat   vernierVerticalSpaceToBottom;  /**< 游标到底部的距离 */
@property (nonatomic,assign) CGFloat   vernierHeight;      /**< 游标高度，默认是2pt */
@property (nonatomic,assign) CGFloat   vernierWidth;       /**< 游标宽度，默认等于 itemWidth */
@property (nonatomic,assign) BOOL      centerSelectedItem; /**< 是否自动居中选中的item, 默认是 YES */
@property (nonatomic,assign) BOOL      bottomLineHidden; /**< 是否隐藏底部横线，默认是YES */

@property (nullable,nonatomic,weak) id <CYSegmentedViewDelegate> segmentedDelegate; /**< 代理 */

@end


