//
//  HZBNetWorkStatusModel.h
//  XTNetworkType
//
//  Created by 安宁 on 2017/9/25.
//  Copyright © 2017年 安宁. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, HZBNetWorkStatus) {
    HZBNetWorkStatusNotReachable = 0,
    HZBNetWorkStatusUnknown = 1,
    HZBNetWorkStatusWWAN2G = 2,
    HZBNetWorkStatusWWAN3G = 3,
    HZBNetWorkStatusWWAN4G = 4,
    
    HZBNetWorkStatusWiFi = 9,
};

@interface HZBNetWorkStatusModel : NSObject

@property ( nonatomic , assign ) HZBNetWorkStatus netWorkStatus ;
@property ( nonatomic , copy ) NSString * netWorkStatusStr ;

@end
