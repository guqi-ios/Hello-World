//
//  User.m
//  Homework2
//
//  Created by 谷琪 on 2020/4/13.
//  Copyright © 2020 谷琪. All rights reserved.
//

#import "User.h"
#import "MTLValueTransformer.h"
#import "NSValueTransformer+MTLPredefinedTransformerAdditions.h"

@implementation User

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
        @"name" : @"name",
        @"proflieImageURL" : @"profile_image_url"
    };
}

+ (NSValueTransformer *)proflieImageURLJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

@end
