//
//  HZBNetworkFromStatusBarUtil.m
//  XTNetworkType
//
//  Created by 安宁 on 2017/11/6.
//  Copyright © 2017年 安宁. All rights reserved.
//

#import "HZBNetworkFromStatusBarUtil.h"

@implementation HZBNetworkFromStatusBarUtil

+ (NSString *)getNetworkType
{
    @try{
        
        UIApplication * app = [UIApplication sharedApplication];
        id statusBar = [app valueForKeyPath:@"statusBar"] ;
        id foregroundView ;
        
        if ([statusBar isKindOfClass:NSClassFromString(@"UIStatusBar_Modern")])
        {
            statusBar = [statusBar valueForKeyPath:@"statusBar"];
        }
        
        foregroundView = [statusBar valueForKeyPath:@"foregroundView"] ;
        
        NSArray * children = [foregroundView subviews];
        NSString * state = [[NSString alloc] init];
        int netType = 0;
        //获取到网络返回码
        for (id child in children)
        {
            if ([child isKindOfClass:NSClassFromString(@"UIStatusBarDataNetworkItemView")])
            {
                //获取到状态栏
                netType = [[child valueForKeyPath:@"dataNetworkType"]intValue];
                switch (netType)
                {
                    case 0:
                        //无网模式
                        state = @"无网络";
                        break;
                    case 1:
                        state = @"2G";
                        break;
                    case 2:
                        state = @"3G";
                        break;
                    case 3:
                        state = @"4G";
                        break;
                    case 5:
                        state = @"WIFI";
                        break;
                    default:
                        break;
                }
            }
        }
        
        return state;
        
    }@catch(NSException * exception)
    {
        NSLog(@"%s %@",__func__,exception);
        return @"error" ;
        
    }@finally{
        
    }
}

@end
