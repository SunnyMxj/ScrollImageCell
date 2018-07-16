//
//  UITableViewCell+ScrollImage.m
//  ScrollImageCell
//
//  Created by Ryan on 2018/7/16.
//  Copyright © 2018年 Ryan. All rights reserved.
//

#import "UITableViewCell+ScrollImage.h"
#import <objc/runtime.h>

static NSString *contentOffSetKeyPath = @"contentOffset";

@interface UITableViewCell ()

@property (nonatomic, weak) UIImageView *scrollImageView;
@property (nonatomic, weak) UIView *originView;

@end

@implementation UITableViewCell (ScrollImage)

- (void)setScrollImageView:(UIView *)view image:(id)image imageWidth:(CGFloat)width imageHeight:(CGFloat)height {
    if (!image || width <= 0 || height <= 0) {
        return;
    }
    if (self.originView) {
        return;
    }
    self.originView = view;
    self.originView.clipsToBounds = YES;
    
    CGFloat imageWidth = self.originView.width;
    CGFloat imageHeight = rintf(imageWidth * height / width);
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, imageWidth, imageHeight)];
    if ([image isKindOfClass:[UIImage class]]) {
        imageView.image = image;
    } else if ([image isKindOfClass:[NSString class]]){
        NSURL *url = [[NSURL alloc] initWithString:[(NSString *)image stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        [imageView sd_setImageWithURL:url];
    }
    [self.originView addSubview:imageView];
    self.scrollImageView = imageView;
}

- (void)willDisplay {
    if (self.scrollImageView) {
        [[self tableView] addObserver:self forKeyPath:contentOffSetKeyPath options:NSKeyValueObservingOptionNew context:nil];
    }
}


- (void)didEndDisplaying {
    if (self.scrollImageView) {
        @try {
            [[self tableView] removeObserver:self forKeyPath:contentOffSetKeyPath];
        }
        @catch (NSException * __unused exception) {
            
        }
    }
}

#pragma mark -- calculateFrame
- (void)didScrolledTableView:(UITableView *)tableView {
    CGFloat contentOffSetY = tableView.contentOffset.y;
    UIEdgeInsets inset = UIEdgeInsetsZero;
    if (@available(ios 11.0, *)) {
        inset = UIEdgeInsetsMake(tableView.adjustedContentInset.top - tableView.contentInset.top,
                                 tableView.adjustedContentInset.left - tableView.contentInset.left,
                                 tableView.adjustedContentInset.bottom - tableView.contentInset.bottom,
                                 tableView.adjustedContentInset.right - tableView.contentInset.right);
    }
    CGRect imageViewRect = [self.originView.superview convertRect:self.originView.frame toView:tableView];
    
    //两个临界点
    //顶部
    CGFloat topY = contentOffSetY + inset.top;
    //底部
    CGFloat bottomY = contentOffSetY + tableView.height - inset.bottom;
    if ((imageViewRect.origin.y + imageViewRect.size.height) >= bottomY) {
        self.scrollImageView.bottom = bottomY - imageViewRect.origin.y;
    } else if (imageViewRect.origin.y <= topY) {
//        self.scrollImageView.y = topY - imageViewRect.origin.y;
        self.scrollImageView.bottom = topY - imageViewRect.origin.y + self.scrollImageView.height;
    } else {
        //可滑动范围高度
        CGFloat scrollHeight = bottomY - topY;
        //图片高度
        CGFloat imageHeight = self.scrollImageView.height;
        //滑动位置占可滑动范围占比（底部到顶部，需要减掉图片高度）
        CGFloat rate = (bottomY - (imageViewRect.origin.y + imageViewRect.size.height)) / (scrollHeight - imageViewRect.size.height);
        //对应位置所需调整的高度
        CGFloat deltaHeight = (imageHeight - scrollHeight) * rate;
        self.scrollImageView.bottom = bottomY - imageViewRect.origin.y + deltaHeight;
    }
}

#pragma mark -- KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([object isKindOfClass:[UITableView class]] && [keyPath isEqualToString:contentOffSetKeyPath]) {
        [self didScrolledTableView:(UITableView *)object];
    }
}

#pragma mark -- property
- (UIImageView *)scrollImageView {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setScrollImageView:(UIImageView *)scrollImageView {
    objc_setAssociatedObject(self, @selector(scrollImageView), scrollImageView, OBJC_ASSOCIATION_ASSIGN);
}

- (UIView *)originView {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setOriginView:(UIView *)originView {
    objc_setAssociatedObject(self, @selector(originView), originView, OBJC_ASSOCIATION_ASSIGN);
}

#pragma mark -- hepler
- (UITableView *)tableView {
    UIResponder *tableView = self.nextResponder;
    while (![tableView isKindOfClass:[UITableView class]]) {
        tableView = tableView.nextResponder;
    }
    return (UITableView *)tableView;
}

@end
