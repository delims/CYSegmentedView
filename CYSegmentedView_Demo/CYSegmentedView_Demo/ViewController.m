//
//  ViewController.m
//  CYSegmentedView_Demo
//
//  Created by delims on 2018/7/20.
//  Copyright © 2018年 com.delims. All rights reserved.
//

#import "ViewController.h"
#import "CYSegmentedView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CYSegmentedView *segment = [[CYSegmentedView alloc] init];
    segment.frame = CGRectMake(0, 50, [UIScreen mainScreen].bounds.size.width, 50);
    segment.itemNames = @[@"语文",@"物理",@"地理",@"历史",@"音乐",@"英语",@"生物",@"英语",@"生物"];
    segment.itemSelectedColor = [UIColor blueColor];
    segment.itemNormalColor = [UIColor greenColor];
    [self.view addSubview:segment];
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
