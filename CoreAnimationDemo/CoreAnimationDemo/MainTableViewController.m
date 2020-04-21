//
//  MainTableViewController.m
//  CoreAnimationDemo
//
//  Created by 谷琪 on 2020/4/21.
//  Copyright © 2020 谷琪. All rights reserved.
//

#import "MainTableViewController.h"
#import "Case0ViewController.h"
#import "Case1ViewController.h"

static NSString * _Nonnull const CELLID = @"CellID";

@interface MainTableViewController ()

@property (nonatomic, strong) NSArray * demoNameList;

@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:CELLID];
    self.demoNameList = @[@"Case 0: Providing a Layer’s Contents and Adjusting a Layer’s Visual Style",
                          @"Case 1: "];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.demoNameList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELLID forIndexPath:indexPath];
    cell.textLabel.text = [self.demoNameList objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    switch (indexPath.row) {
        case 0:
        {
            Case0ViewController *vc = [[Case0ViewController alloc] init];
            [self.navigationController pushViewController:vc animated:true];
            break;
        }
        case 1:
        {
            Case1ViewController *vc = [[Case1ViewController alloc] init];
            [self.navigationController pushViewController:vc animated:true];
            break;
        }
        default: break;
    }
}

@end
