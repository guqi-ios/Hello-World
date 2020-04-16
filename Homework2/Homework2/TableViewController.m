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
//    [self fakeFetchMicroblogs];
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

- (void)fakeFetchMicroblogs
{
    [self.refreshControl beginRefreshing];
    NSArray *JSONArray = @[
        @{@"created_at" : @"Fri Dec 31 13:34:19 +0800 2010", @"text" : @"text1text1text1text1text1text1text1text1text1text1text1text1text1text1text1text1text1text1text1text1text1text1text1text1text1text1text1text1text1", @"user" : @{@"name" : @"name1",@"profile_image_url" : @"https://tvax2.sinaimg.cn/crop.0.0.512.512.50/656de1aely8gds0ji7q1pj20e80e8t8o.jpg?KID=imgbed,tva&Expires=1586764714&ssig=svPW6gvGdA"}},
        @{@"created_at" : @"Fri Dec 31 13:34:19 +0800 2010", @"text" : @"text2text2text2text2text2text2text2text2text2text2text2text2text2text2text2text2text2text2text2text2text2text2text2text2text2text2text2text2text2text2text2text2text2text2text2text2text2text2text2text2text2text2text2text2text2text2text2text2text2text2text2text2text2text2text2text2text2text2text2text2text2text2text2text2text2text2", @"user" : @{@"name" : @"name2",@"profile_image_url" : @"https://tvax2.sinaimg.cn/crop.0.0.512.512.50/7f8eae87ly8gaehbgzz0yj20e80e83z4.jpg?KID=imgbed,tva&Expires=1586764714&ssig=yH9u1TABfA"}}
    ];
    NSArray *microblogs = [MTLJSONAdapter modelsOfClass:Microblog.class fromJSONArray:JSONArray error:NULL];
    self.microblogs = microblogs;
    [self.refreshControl endRefreshing];
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
