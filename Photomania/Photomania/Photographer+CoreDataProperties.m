//
//  Photographer+CoreDataProperties.m
//  Photomania
//
//  Created by 谷琪 on 2020/4/9.
//  Copyright © 2020 谷琪. All rights reserved.
//
//

#import "Photographer+CoreDataProperties.h"

@implementation Photographer (CoreDataProperties)

+ (NSFetchRequest<Photographer *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Photographer"];
}

@dynamic name;
@dynamic photos;

@end
