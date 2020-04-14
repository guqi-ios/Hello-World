//
//  Microblog.m
//  Homework2
//
//  Created by 谷琪 on 2020/4/13.
//  Copyright © 2020 谷琪. All rights reserved.
//

#import "Microblog.h"
#import "MTLValueTransformer.h"

@implementation Microblog

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
        @"user": @"user",
        @"microblogText": @"text",
        @"createdAt": @"created_at"
    };
}

+ (NSDateFormatter *)dateFormatter
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"EEE MM dd HH:mm:ss ZZZ yyyy";
    return dateFormatter;
}

+ (NSValueTransformer *)createdAtJSONTransformer
{
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *dateString, BOOL *success, NSError *__autoreleasing *error) {
        return [self.dateFormatter dateFromString:dateString];
    } reverseBlock:^id(NSDate *date, BOOL *success, NSError *__autoreleasing *error) {
        return [self.dateFormatter stringFromDate:date];
    }];
}

@end
