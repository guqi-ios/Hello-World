//
//  PhotographersCDTVC.h
//  Photomania
//
//  Created by 谷琪 on 2020/4/9.
//  Copyright © 2020 谷琪. All rights reserved.
//

#import "CoreDataTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface PhotographersCDTVC : CoreDataTableViewController

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@end

NS_ASSUME_NONNULL_END
