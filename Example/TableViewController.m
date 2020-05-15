//
//  TableViewController.m
//  JXExtension
//
//  Created by Jeason on 12/7/2018.
//  Copyright © 2018年 Jeason.Lee. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"StopScroll";
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
//    [self.tableView setJx_scrollStopBlock:^{
//        NSLog(@"⚠️滑动停止了");
//    }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:50 inSection:0] atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    });
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"Delegate 实现 (scrollViewDidEndDecelerating:)");
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    NSLog(@"Delegate 实现 (scrollViewDidEndDragging:willDecelerate:)");
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    NSLog(@"Delegate 实现 (scrollViewDidEndScrollingAnimation:)");
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    cell.textLabel.text = @(indexPath.row).stringValue;
    return cell;
}

@end
