//
//  HelloGpuImageController.m
//  ZKDemos
//
//  Created by zk on 2020/4/19.
//  Copyright © 2020 zk. All rights reserved.
//

#import "HelloGpuImageController.h"
#import "GpuImageRendController.h"

@interface HelloGpuImageController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSArray * filters;

@end

@implementation HelloGpuImageController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"FilterNames" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSArray *array = [string componentsSeparatedByString:@"\n"];
    
    NSMutableArray *final = [NSMutableArray array];
    for (NSString *one in array) {
        if (one.length) {
            NSString *two = [one substringToIndex:[one rangeOfString:@"//"].location];
            NSString *three = [two substringWithRange:NSMakeRange(9, two.length - 12)];
            NSString *four = [three stringByReplacingOccurrencesOfString:@" " withString:@""];
            NSString *n = [four substringToIndex:[four rangeOfString:@"."].location];
            [final addObject:n];
        }
    }
    self.filters = final;
    
    UITableView *table = [[UITableView alloc] initWithFrame:self.view.bounds];
    table.delegate = self;
    table.dataSource = self;
    table.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:table];
    
}

#pragma mark - TableView DataSource And Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.filters.count;
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
    
    cell.textLabel.text = self.filters[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    GpuImageRendController *vc = [[GpuImageRendController alloc] init];
    vc.filterName = self.filters[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
