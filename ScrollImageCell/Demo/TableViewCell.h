//
//  TableViewCell.h
//  ScrollImageCell
//
//  Created by Ryan on 2018/7/16.
//  Copyright © 2018年 Ryan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CellItem : NSObject

@property (strong, nonatomic) NSString *imageURL;
@property (strong, nonatomic) UIImage *image;
@property (assign, nonatomic) CGFloat imageWidth;
@property (assign, nonatomic) CGFloat imageHeight;

@end

@interface TableViewCell : UITableViewCell

- (void)setupWithItme:(CellItem *)item;

@end
