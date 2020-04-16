//
//  TableViewController.h
//  Homework2
//
//  Created by 谷琪 on 2020/4/10.
//  Copyright © 2020 谷琪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Microblog.h"
#import "YTKRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface TableViewController : UITableViewController <YTKRequestDelegate>
@property (nonatomic, strong) NSArray<Microblog *> *microblogs;
@end

NS_ASSUME_NONNULL_END
