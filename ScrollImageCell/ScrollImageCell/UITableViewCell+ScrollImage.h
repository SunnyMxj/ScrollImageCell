//
//  UITableViewCell+ScrollImage.h
//  ScrollImageCell
//
//  Created by Ryan on 2018/7/16.
//  Copyright © 2018年 Ryan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (ScrollImage)

@property(nonatomic,assign) UIEdgeInsets adjustedInset API_DEPRECATED("Only use before iOS11 in some special cases", ios(7.0,11.0));

/**
 设置滑动图片信息

 @param view 展示滑动image的view
 @param image 图片，可传string类型(imageURL)或者image类型
 @param width 图片宽度
 @param height 图片高度
 */
- (void)setScrollImageView:(UIView *)view image:(id)image imageWidth:(CGFloat)width imageHeight:(CGFloat)height;


/**
 在tableViewDelegate的willDisplayCell方法调用
 */
- (void)willDisplay;


/**
 在tableViewDelegate的didEndDisplayingCell方法调用
 */
- (void)didEndDisplaying;

@end
