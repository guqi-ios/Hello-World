//
//  TableViewController.m
//  Homework2
//
//  Created by 谷琪 on 2020/4/10.
//  Copyright © 2020 谷琪. All rights reserved.
//

#import "TableViewController.h"
#import "MBFGetMicroblogsAPI.h"
#import "TableViewCell.h"
#import "SDWebImage.h"

static NSString *CellIdentifier = @"Cell";

@implementation TableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerClass:TableViewCell.class forCellReuseIdentifier:CellIdentifier];
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    self.refreshControl.tintColor = [UIColor blackColor];
    [self.refreshControl addTarget:self
                            action:@selector(fetchMicroblogs)
                  forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:self.refreshControl];
    
    [self fetchMicroblogs];
}

#pragma mark - Private Method

- (void)fetchMicroblogs
{
    [self.refreshControl beginRefreshing];
    MBFGetMicroblogsAPI *api = [[MBFGetMicroblogsAPI alloc] init];
    api.delegate = self;
    [api start];
}

- (void)requestFinished:(YTKBaseRequest *)request {
    dispatch_queue_t fetchQ = dispatch_queue_create("microblog", NULL);
    dispatch_async(fetchQ, ^{
        NSData *JSONData = request.responseData;
        NSDictionary *JSONDictionary = [NSJSONSerialization JSONObjectWithData:JSONData options:0 error:NULL];
        NSArray *JSONArray = JSONDictionary[@"statuses"];
        NSArray *microblogs = [MTLJSONAdapter modelsOfClass:Microblog.class fromJSONArray:JSONArray error:NULL];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.refreshControl endRefreshing];
            self.microblogs = microblogs;
        });
    });
}

- (void)requestFailed:(YTKBaseRequest *)request {
    [self.refreshControl endRefreshing];
    NSLog(@"%@", request.error);
    NSLog(@"failed");
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.microblogs count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    if (indexPath.row >= self.microblogs.count) {
       return cell;
    }
    Microblog *microblog = self.microblogs[indexPath.row];
    
    cell.userNameLabel.text = microblog.user.name;
    cell.createdAtLabel.text = [microblog.createdAt description];
    cell.microblogTextLabel.text = microblog.microblogText;
//    cell.userProfileImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:microblog.user.proflieImageURL]];
    [cell.userProfileImageView sd_setImageWithURL:microblog.user.proflieImageURL];
    
    return cell;
}

#pragma mark - Getter & Setter

- (void)setMicroblogs:(NSArray *)microblogs
{
    _microblogs = microblogs;
    [self.tableView reloadData];
}

@end
