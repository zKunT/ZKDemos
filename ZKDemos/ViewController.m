//
//  ViewController.m
//  ZKDemos
//
//  Created by zk on 2020/4/19.
//  Copyright © 2020 zk. All rights reserved.
//

#import "ViewController.h"
#import "HelloAvPlayerController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray * cellTitles;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *table = [[UITableView alloc] initWithFrame:self.view.bounds];
    table.delegate = self;
    table.dataSource = self;
    table.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:table];
    
    [self.cellTitles addObject:@"在线视频"];
    [self.cellTitles addObject:@"直播流播放"];
    [self.cellTitles addObject:@"GPUImage"];
}

#pragma mark - TableView DataSource And Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cellTitles.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.textLabel.text = self.cellTitles[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        HelloAvPlayerController *vc = [[HelloAvPlayerController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

#pragma mark - 懒加载
- (NSMutableArray *)cellTitles {
    if (!_cellTitles) {
        _cellTitles = [NSMutableArray array];
    }
    return _cellTitles;;
}

@end
