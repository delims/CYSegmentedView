# CYSegmentedView

这个一个类似UISegmentedControl的UI控件


## 获取
- CocoaPods

$ pod 'CYSegmentedView', '~> 1.0.1'

- 手动添加

将 `CYSegmentedView` 文件夹中的 `CYSegmentedView.h` `CYSegmentedView.m` 拖入工程中即可

## 使用

- 代码创建

```
CYSegmentedView *segment = [[CYSegmentedView alloc] init];
segment.frame = CGRectMake(0, 50, [UIScreen mainScreen].bounds.size.width, 50);
segment.itemNames = @[@"语文",@"物理",@"地理",@"历史",@"音乐",@"英语",@"生物",@"英语",@"生物"];
segment.itemSelectedColor = [UIColor blueColor];
segment.itemNormalColor = [UIColor greenColor];
[self.view addSubview:segment];
```

- storyboard

 storyboard 中的 `UIScrollView`的 `Class` 类型选择该 **`CYSegmentedView`** 即可。
 
## 效果
 
 点击按钮的时候的效果
 
 ![效果图](https://delims.github.io/static/cocoapods/images/segmented.gif)
 
 
 
