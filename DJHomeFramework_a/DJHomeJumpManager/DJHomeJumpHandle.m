//
//  DJHomeJumpHandle.m
//  DJHomeFramework
//
//  Created by sogou on 16/5/31.
//  Copyright © 2016年 sogou. All rights reserved.
//

#import "DJHomeJumpHandle.h"
#import "DJMediator.h"
#import "HomeVC.h"


@interface DJHomeJumpHandle()<DJConnectorPrt>

@end
@implementation DJHomeJumpHandle



+ (void)load
{
    [DJMediator registerConnector:[self getInstance]];
}

+ (nonnull DJHomeJumpHandle *) getInstance
{
    static DJHomeJumpHandle *_sharedConnector = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedConnector = [[DJHomeJumpHandle alloc] init];
    });
    
    return _sharedConnector;
}


- (BOOL) canOpenURL:(nonnull NSURL *)url
{
    if ([url.host isEqualToString:@"home"]) {
        return YES;
    }
    return NO;
}

- (nullable UIViewController *) connectToOpenURL:(nonnull NSURL *)url params:(nullable NSDictionary *)params
{
    if ([url.host isEqualToString:@"homevc"]) {
        HomeVC * homevc = [[HomeVC alloc] init];
        return homevc;
    }
    return nil;
}

@end
