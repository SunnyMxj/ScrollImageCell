//
//  TableViewCell.m
//  ScrollImageCell
//
//  Created by Ryan on 2018/7/16.
//  Copyright © 2018年 Ryan. All rights reserved.
//

#import "TableViewCell.h"

#import "UITableViewCell+ScrollImage.h"

@implementation CellItem
@end

@interface TableViewCell ()

@property (strong, nonatomic) UIView *demoView;

@end

@implementation TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _demoView = [[UIView alloc] initWithFrame:CGRectMake(kMargin, kMargin, kScreenWidth - 2*kMargin, 160)];
        [self.contentView addSubview:_demoView];
    }
    return self;
}

- (void)setupWithItme:(CellItem *)item {
    if (!item) {
        _demoView.backgroundColor = kRandomColor;
    } else {
#warning TODO HowToUse #1
        //TODO here
        [self setScrollImageView:_demoView image:item.imageURL?:item.image imageWidth:item.imageWidth imageHeight:item.imageHeight];
    }
}

@end
