//
//  YJPopoverContentController.m
//  YJPopoverDemo
//
//  Created by d-engine on 16/12/27.
//  Copyright © 2016年 yangjun. All rights reserved.
//

#import "YJPopoverContentController.h"

@interface YJPopoverContentController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *arrTitles;

@end

@implementation YJPopoverContentController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.arrTitles = @[@"全部", @"加精", @"我的提问"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    self.tableView.backgroundColor = self.view.backgroundColor;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
}

#pragma mark -- UITableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrTitles.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 35;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    cell.backgroundColor = [UIColor blackColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    UILabel *lblText = (UILabel *)[cell.contentView viewWithTag:3000];
    if (lblText == nil) {
        lblText = [[UILabel alloc] initWithFrame:cell.contentView.bounds];
        lblText.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        lblText.tag = 3000;
        lblText.textColor = [UIColor whiteColor];
        lblText.font = [UIFont systemFontOfSize:14];
        lblText.textAlignment = NSTextAlignmentCenter;
        [cell.contentView addSubview:lblText];
    }
    lblText.text = self.arrTitles[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"111");
}

@end
