//
//  Case2TableViewController.m
//  ExerciseDemo
//
//  Created by 谷琪 on 2020/4/16.
//  Copyright © 2020 谷琪. All rights reserved.
//

#import "Case2TableViewController.h"
#import "Case2TableViewCell.h"
#import "Case2Model.h"

@interface Case2TableViewController ()

@property (nonatomic, strong) NSArray<Case2Model *> *models;

@end

@implementation Case2TableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Case 2: UITableView";
    [self.tableView registerClass:Case2TableViewCell.class forCellReuseIdentifier:Case2CellID];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.models.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Case2TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Case2CellID forIndexPath:indexPath];
    if (!cell) {
        cell = [[Case2TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Case2CellID];
    }
    if (indexPath.row >= self.models.count) {
       return cell;
    }
    cell.model = self.models[indexPath.row];
    return cell;
}

#pragma mark - Getters & Setters

- (NSArray<Case2Model *> *)models
{
    if (!_models) {
        NSInteger count = 5;
        NSMutableArray *tmpModels = [[NSMutableArray alloc] initWithCapacity:count];
        for (int i = 0; i < count; i++) {
            Case2Model *model = [[Case2Model alloc] init];
            model.imageName = @"cardback";
            model.title = @"cardback";
            [tmpModels addObject:model];
        }
        _models = [[NSArray alloc] initWithArray:tmpModels];
    }
    return _models;
}

@end
