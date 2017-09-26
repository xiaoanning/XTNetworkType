//
//  NetWorkReachability.h
//  SECC01
//
//  Created by Harvey on 16/6/29.
//  Copyright © 2016年 Haley. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HZBNetWorkStatusModel.h"

extern NSString * kNetWorkReachabilityChangedNotification;

@interface HZBNetWorkReachability : NSObject

/*!
 * Use to check the reachability of a given host name.
 */
+ (instancetype)reachabilityWithHostName:(NSString *)hostName;

/*!
 * Use to check the reachability of a given IP address.
 */
+ (instancetype)reachabilityWithAddress:(const struct sockaddr *)hostAddress;

/*!
 * Checks whether the default route is available. Should be used by applications that do not connect to a particular host.
 */
+ (instancetype)reachabilityForInternetConnection;

- (BOOL)startNotifier;

- (void)stopNotifier;

- (HZBNetWorkStatusModel *)currentReachabilityStatus;

@end
