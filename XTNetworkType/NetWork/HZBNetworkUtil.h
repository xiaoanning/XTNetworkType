//
//  HZBNetworkUtil.h
//  XTNetworkType
//
//  Created by 安宁 on 2017/9/22.
//  Copyright © 2017年 安宁. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HZBNetWorkReachability.h"

#define  KKNetWorkStatusChangeCallback(netWorkStatusChangeCallback) void(^netWorkStatusChangeCallback)(HZBNetWorkStatusModel  * netWorkStatusModel)

@interface HZBNetworkUtil : NSObject

+(void)startObserveNetworkWithChangeCallback:(KKNetWorkStatusChangeCallback())netWorkStatusChangeCallback ;
+ (HZBNetWorkStatusModel *)currentReachabilityStatus ;

+(void)stopNotifier ;

@end
