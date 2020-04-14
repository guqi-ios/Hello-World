//
//  GetMicroblogsAPI.m
//  Homework2
//
//  Created by 谷琪 on 2020/4/13.
//  Copyright © 2020 谷琪. All rights reserved.
//

#import "GetMicroblogsAPI.h"
#import "MicroblogAPIKey.h"

@implementation GetMicroblogsAPI

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodGET;
}

- (id)requestUrl
{
    return @"/2/statuses/public_timeline.json";
}

- (id)requestArgument {
    return @{
        @"access_token": MicroblogAPIKey
    };
}

@end
