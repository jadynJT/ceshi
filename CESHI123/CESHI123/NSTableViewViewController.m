//
//  NSTableViewViewController.m
//  CESHI123
//
//  Created by ZJT on 2019/3/19.
//  Copyright © 2019年 jztw. All rights reserved.
//

#import "NSTableViewViewController.h"

@interface NSTableViewViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, assign) BOOL asss;

@end

@implementation NSTableViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initUI];
    self.asss = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initUI {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"identifier"];
    self.tableView.sectionHeaderHeight = 0.01;
    self.tableView.sectionFooterHeight = 12;
    
    NSLog(@"self.tableView = %f",self.tableView.sectionHeaderHeight);
    NSLog(@"self.tableView = %f",self.tableView.sectionFooterHeight);
}

- (NSInteger)rownNmber {
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self rownNmber];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (1 == section) {
        return 4;
    }
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (1 == indexPath.section && self.asss) {
//        return 0.0f;
//    }
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
//    if (1 == section && self.asss) {
//        return 0.01;
//    }
    
    return tableView.sectionFooterHeight;
}

//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
//    if (1 == section && self.asss) {
//        UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 1)];
//        
//        view.backgroundColor = [UIColor redColor];
//        
//        return view;
//    }
//    return nil;
//}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    if (1 == section && self.asss) {
//        UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 1)];
//        
//        view.backgroundColor = [UIColor redColor];
//        
//        return view;
//    }
//    return nil;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"identifier"];
        cell.textLabel.text = @"hello world";
//        cell.backgroundColor = [UIColor redColor];
        cell.textLabel.textColor = [UIColor redColor];
        
        if (indexPath.section == 1) {
//            cell.contentView.hidden = self.asss;
//            if (self.asss) {
//                cell.separatorInset = UIEdgeInsetsMake(0, cell.bounds.size.width, 0, 0);
//                cell.indentationWidth = -cell.bounds.size.width;
//                cell.indentationLevel = 1;
//                NSLog(@"xxxx");
//
//            }
        }
    }
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    UIEdgeInsets uiedge = UIEdgeInsetsMake(0, 15, 0, 15);
    if (indexPath.section == 1) {
        cell.preservesSuperviewLayoutMargins = NO;
        cell.layoutMargins = UIEdgeInsetsZero;
        cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, cell.bounds.size.width);
    }else {
        [cell setSeparatorInset:uiedge];
    }
}

@end
