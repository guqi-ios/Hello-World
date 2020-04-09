//
//  JustPostedFlickrPhotosTVC.m
//  Shutterbug
//
//  Created by 谷琪 on 2020/4/9.
//  Copyright © 2020 谷琪. All rights reserved.
//

#import "JustPostedFlickrPhotosTVC.h"
#import "FlickrFetcher.h"


@interface JustPostedFlickrPhotosTVC ()

@end

@implementation JustPostedFlickrPhotosTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchPhotos];
}

- (IBAction)fetchPhotos
{
    [self.refreshControl beginRefreshing];
    NSURL *url = [FlickrFetcher URLforRecentGeoreferencedPhotos];
    dispatch_queue_t fetchQ = dispatch_queue_create("flikcr", NULL);
    dispatch_async(fetchQ, ^{
            NSData *jsonResults = [NSData dataWithContentsOfURL:url];
            NSDictionary *propertyListResults = [NSJSONSerialization JSONObjectWithData:jsonResults options:0 error:NULL]; // **
        //    NSLog(@"Flickr result = %@", propertyListResults);
            NSArray *photos = [propertyListResults valueForKeyPath:FLICKR_RESULTS_PHOTOS];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.refreshControl endRefreshing];
            self.photos = photos;
        });
    });
}


@end
