# ScrollImageCell
cell中滚动图片的实现，使图片具有背景图效果<br>
## 实现效果
![](https://github.com/SunnyMxj/ScrollImageCell/blob/master/scrollImageCell.gif)

## 如何使用
1.将文件UITableViewCell+ScrollImage拖入项目中

2.在需要实现的cell中设置图片信息<br>
- (void)setScrollImageView:(UIView *)view image:(id)image imageWidth:(CGFloat)width imageHeight:(CGFloat)height;

3.在tableViewDelegate中实现对应的方法
- (void)willDisplay;
- (void)didEndDisplaying;

注：由于产品需求，未考虑cell复用问题，如有需要，设置图片信息方法稍作调整即可。
