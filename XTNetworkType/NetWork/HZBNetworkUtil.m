//
//  HZBNetworkUtil.m
//  XTNetworkType
//
//  Created by 安宁 on 2017/9/22.
//  Copyright © 2017年 安宁. All rights reserved.
//

#import "HZBNetworkUtil.h"


@interface HZBNetworkUtil ()
{
    
    
}
@property ( nonatomic , strong ) HZBNetWorkReachability * hostReachability ;
@property ( nonatomic , copy ) KKNetWorkStatusChangeCallback(netWorkStatusChangeCallback) ;

@end

@implementation HZBNetworkUtil

static HZBNetworkUtil * _instance = nil;
static dispatch_once_t onceToken = 0 ;

+(instancetype) shareInstance
{
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:NULL] init] ;
    }) ;
    return _instance ;
}

+(id) allocWithZone:(struct _NSZone *)zone
{
    return [HZBNetworkUtil shareInstance] ;
}

-(id) copyWithZone:(struct _NSZone *)zone
{
    return [HZBNetworkUtil shareInstance] ;
}
-(id)mutableCopyWithZone:(NSZone *)zone
{
    return [HZBNetworkUtil shareInstance] ;
}
+(void)dealloc
{
    onceToken = 0 ;
    _instance = nil ;
}

+(void)startObserveNetworkWithChangeCallback:(KKNetWorkStatusChangeCallback())netWorkStatusChangeCallback
{
    HZBNetworkUtil * util = [HZBNetworkUtil shareInstance];
    [util setNetWorkStatusChangeCallback:netWorkStatusChangeCallback];
    
    [[NSNotificationCenter defaultCenter] addObserver:util selector:@selector(reachabilityChanged:) name:kNetWorkReachabilityChangedNotification object:nil];
    
    HZBNetWorkReachability * reachability = [HZBNetWorkReachability reachabilityWithHostName:@"www.apple.com"];
    util.hostReachability = reachability;
    [reachability startNotifier];

}

+(void)stopNotifier
{
    HZBNetworkUtil * util = [HZBNetworkUtil shareInstance] ;
    [util.hostReachability stopNotifier];
    
    [[NSNotificationCenter defaultCenter]removeObserver:util name:kNetWorkReachabilityChangedNotification object:nil];
    
    [HZBNetworkUtil dealloc];
}

+ (HZBNetWorkStatusModel *)currentReachabilityStatus
{
    return  [[[HZBNetworkUtil shareInstance] hostReachability ] currentReachabilityStatus];
    
}

- (void)reachabilityChanged:(NSNotification *)notification
{
    HZBNetWorkReachability *curReach = [notification object];
    HZBNetWorkStatusModel * netStatusModel = [curReach currentReachabilityStatus];
    
    if (_netWorkStatusChangeCallback)
    {
        _netWorkStatusChangeCallback(netStatusModel);
    }
}

@end
