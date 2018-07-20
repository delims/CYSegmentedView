//
//  CYSegmentedView.m
//
//
//  Created by delims on 15/11/9.
//  Copyright © 2015年 delims. All rights reserved.
//

#import "CYSegmentedView.h"

@interface CYSegmentedView ()

@property (nonatomic,strong) NSMutableArray *buttonItemArray;
@property (nonatomic,strong) CALayer *vernierLayer;

@end

@implementation CYSegmentedView

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (!self) return nil;
    [self commonInit];
    return self;
}
- (instancetype)init
{
    self = [super init];
    if (!self) return nil;
    [self commonInit];
    return self;
}

- (void)commonInit
{
    self.backgroundColor = [UIColor whiteColor];
    self.vernierHeight = 2;
    self.vernierVerticalSpaceToBottom = 3;
    self.vernierWidth = 45;
    self.itemWidth = 50;
    self.vernierColor = [UIColor blueColor];
    self.itemSelectedColor = [UIColor blueColor];
    self.itemNormalColor = [UIColor grayColor];
    self.bounces = NO;
    self.centerSelectedItem = YES;
    self.showsHorizontalScrollIndicator = NO;
    self.itemNameFont = [UIFont systemFontOfSize:14];
}

- (void)selectAtIndex:(NSInteger)index
{
    if (self.buttonItemArray.count <= index) return;
    UIButton *selectedButton = self.buttonItemArray[_selectedIndex];
    selectedButton.selected = NO;
    _selectedIndex = index;
    selectedButton = self.buttonItemArray[index];
    selectedButton.selected = YES;
    if (self.centerSelectedItem) {
        CGFloat x = CGRectGetMidX(selectedButton.frame);
        CGFloat offsetX = x - self.frame.size.width * 0.5;
        CGFloat maxOffset = self.contentSize.width - self.frame.size.width;
        if (offsetX < 0) offsetX = 0;
        if (offsetX > maxOffset) offsetX = maxOffset;
        [UIView animateWithDuration:0.3 animations:^{
            self.contentOffset = CGPointMake(offsetX, 0);
        }];
    }
    [self updateVernierFrameWithIndex:index];
    if (self.itemClickBlock) {
        self.itemClickBlock(index);
    }
    if (self.segmentedDelegate && [self.segmentedDelegate respondsToSelector:@selector(segmentedView:didClickAtIndex:)]) {
        [self.segmentedDelegate segmentedView:self didClickAtIndex:index];
    }
}

- (void)click:(UIButton*)sender
{
    [self selectAtIndex:sender.tag];
}

- (void)updateVernierFrameWithIndex:(NSInteger)index
{
    self.vernierLayer.frame = CGRectMake(index* _itemWidth , self.frame.size.height - _vernierHeight - _vernierVerticalSpaceToBottom ,_vernierWidth, _vernierHeight);
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.contentSize = CGSizeMake(_itemWidth * _itemNames.count, self.frame.size.height);
    for (int i = 0 ; i < self.buttonItemArray.count; i ++) {
        UIButton *button = self.buttonItemArray[i];
        button.frame = CGRectMake(_itemWidth * i, 0, self.itemWidth, self.frame.size.height);
        if (i == _selectedIndex) {
            [self updateVernierFrameWithIndex:i];
        }
    }
}

#pragma mark - getter
- (CALayer *)vernierLayer
{
    if (!_vernierLayer) {
        _vernierLayer = [CALayer new];
        _vernierLayer.backgroundColor = self.vernierColor.CGColor;
        [self.layer addSublayer:_vernierLayer];
    }
    return _vernierLayer;
}

- (NSMutableArray *)buttonItemArray
{
    if (!_buttonItemArray) {
        _buttonItemArray = [NSMutableArray array];
    }
    return _buttonItemArray;
}

#pragma mark - setter
- (void)setVernierColor:(UIColor *)vernierColor
{
    if ([vernierColor isKindOfClass:UIColor.class] == NO) return;
    _vernierColor = vernierColor;
    self.vernierLayer.backgroundColor = vernierColor.CGColor;
}

- (void)setSelectedIndex:(NSInteger)selectedIndex
{
    if (selectedIndex >= self.itemNames.count) return;
    if (_selectedIndex == selectedIndex) return;
    [self selectAtIndex:selectedIndex];
}

- (void)setItemNameFont:(UIFont *)itemNameFont
{
    _itemNameFont = itemNameFont;
    for (UIButton *button in self.buttonItemArray) {
        button.titleLabel.font = itemNameFont;
    }
}

- (void)setItemSelectedColor:(UIColor *)itemSelectedColor
{
    if ([itemSelectedColor isKindOfClass:UIColor.class] == NO) return;
    _itemSelectedColor = itemSelectedColor;
    for (UIButton *button in self.buttonItemArray) {
        [button setTitleColor:itemSelectedColor forState:UIControlStateSelected];
    }
}
- (void)setItemNormalColor:(UIColor *)itemNormalColor
{
    if ([itemNormalColor isKindOfClass:UIColor.class] == NO) return;
    _itemNormalColor = itemNormalColor;
    for (UIButton *button in self.buttonItemArray) {
        [button setTitleColor:itemNormalColor forState:UIControlStateNormal];
    }
}

- (void)setItemNames:(NSArray<NSString *> *)itemNames
{
    if (!itemNames) return;
    if ([itemNames isKindOfClass:[NSArray class]] == NO) return;
    if (itemNames.count) {
        _itemNames = itemNames.copy;
    }
    NSInteger count = _itemNames.count;
    for (int i = 0 ; i < count; i ++) {
        UIButton *button = nil;
        if (self.buttonItemArray.count > i) {
            button = self.buttonItemArray[i];
        } else {
            button = [UIButton new];
            [self.buttonItemArray addObject:button];
            [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button];
        }
        [button setTitle:_itemNames[i] forState:UIControlStateNormal];
        [button setTitleColor:_itemNormalColor forState:UIControlStateNormal];
        [button setTitleColor:_itemSelectedColor forState:UIControlStateSelected];
        button.backgroundColor = [UIColor clearColor];
        button.tag = i;
        [self addSubview:button];
    }
    while (self.buttonItemArray.count > count) {
        UIButton *button = self.buttonItemArray.lastObject;
        [button removeFromSuperview];
        [self.buttonItemArray removeLastObject];
    }
    [self setNeedsLayout];
    [self selectAtIndex:_selectedIndex];
}


@end


