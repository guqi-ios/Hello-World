//
//  Photo+Flickr.m
//  Photomania
//
//  Created by 谷琪 on 2020/4/9.
//  Copyright © 2020 谷琪. All rights reserved.
//

#import "Photo+Flickr.h"
//#import

@implementation Photo (Flickr)

+ (Photo *)photoWithFlickrInfo:(NSDictionary *)photoDictionary
        inManagedObjectContext:(NSManagedObjectContext *)context
{
    Photo *photo = nil;
    
//    NSString *unique =
//    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Photo"];
//    request.predicate = [NSPredicate predicateWithFormat:@"unique = %@", unique];
    
    return photo;
}

+ (void)loadPhotosFromFlickrArray:(NSArray *)photos // of Flickr NSDictionary
         intoManagedObjectContext:(NSManagedObjectContext *)context
{
    
}


@end
