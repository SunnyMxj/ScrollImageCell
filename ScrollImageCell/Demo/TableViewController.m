//
//  TableViewController.m
//  ScrollImageCell
//
//  Created by Ryan on 2018/7/16.
//  Copyright © 2018年 Ryan. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"
#import "UITableViewCell+ScrollImage.h"

@interface TableViewController ()

@property (strong, nonatomic) CellItem *item;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[TableViewCell class] forCellReuseIdentifier:@"scrollImageReuseIdentifier"];
    [self.tableView registerClass:[TableViewCell class] forCellReuseIdentifier:@"reuseIdentifier"];
    _item = [CellItem new];
    BOOL isLong = YES;
    if (isLong) {
        //长图
        _item.imageURL = @"https://ojpoc641y.qnssl.com/20180629_200_1530234173235.jpg?imageslim|imageView2/1/w/420/h/747";//长图
        _item.imageWidth = 420;
        _item.imageHeight = 746;
    } else {
        //横图（测试逻辑用）
        NSString *path = [[NSBundle mainBundle]pathForResource:@"demo" ofType:@"jpg"];
        _item.image = [UIImage imageWithContentsOfFile:path];
        _item.imageWidth = 750;
        _item.imageHeight = 474;
    }
    
//    self.tableView.contentInset = UIEdgeInsetsMake(100, 0, 200, 0);
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
//    self.tableView.height = 500;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 5) {
        TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"scrollImageReuseIdentifier" forIndexPath:indexPath];
        [cell setupWithItme:_item];
        return cell;
    }
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    [cell setupWithItme:nil];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return (2*kMargin + 160);
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
#warning TODO HowToUse #2
    [cell willDisplay];
}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath*)indexPath {
#warning TODO HowToUse #3
    [cell didEndDisplaying];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
