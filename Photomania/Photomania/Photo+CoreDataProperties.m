//
//  Photo+CoreDataProperties.m
//  Photomania
//
//  Created by 谷琪 on 2020/4/9.
//  Copyright © 2020 谷琪. All rights reserved.
//
//

#import "Photo+CoreDataProperties.h"

@implementation Photo (CoreDataProperties)

+ (NSFetchRequest<Photo *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Photo"];
}

@dynamic title;
@dynamic subtitle;
@dynamic imageURL;
@dynamic unique;
@dynamic whoTook;

@end
