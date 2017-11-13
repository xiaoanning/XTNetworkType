//
//  ViewController.m
//  XTNetworkType
//
//  Created by 安宁 on 2017/9/22.
//  Copyright © 2017年 安宁. All rights reserved.
//

#import "ViewController.h"
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>
#import "HZBNetworkFromStatusBarUtil.h"
#import "HZBNetworkUtil.h"


@interface ViewController ()

{
    UILabel * tipsLabel ;
    
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [HZBNetworkUtil startObserveNetworkWithChangeCallback:^(HZBNetWorkStatusModel *netWorkStatusModel) {
        
    }];
    tipsLabel = [[UILabel alloc]initWithFrame:self.view.bounds];
    tipsLabel.numberOfLines = 0 ;
    [self.view addSubview:tipsLabel];
    
//    NSString * str = [self getNetworkType ];
//    NSString * str = [HZBNetworkFromStatusBarUtil getNetworkType];
    NSString * str = [[HZBNetworkUtil currentReachabilityStatus] netWorkStatusStr];
    
    tipsLabel.text = [NSString stringWithFormat:@"%@\n%@",tipsLabel.text,str];
    NSLog(@"%@",str);
}



//获取网络类型
- (NSString *)getNetworkType
{
    CTTelephonyNetworkInfo * networkStatus = [[CTTelephonyNetworkInfo alloc]init];  //创建一个CTTelephonyNetworkInfo对象
    NSString * currentStatus  = networkStatus.currentRadioAccessTechnology; //获取当前网络描述

    tipsLabel.text = [NSString stringWithFormat:@"%@\n%@",tipsLabel.text,currentStatus];

    NSLog(@"%@",currentStatus);
    if ([currentStatus isEqualToString:CTRadioAccessTechnologyGPRS]){
        //GPRS网络
        return @"2G";
    }
    if ([currentStatus isEqualToString:CTRadioAccessTechnologyEdge]){
        //2.75G的EDGE网络
        return @"2G";
    }
    if ([currentStatus isEqualToString:CTRadioAccessTechnologyWCDMA]){
        //3G WCDMA网络
        return @"3G";
    }
    if ([currentStatus isEqualToString:CTRadioAccessTechnologyHSDPA]){
        //3.5G网络
        return @"3G";
    }
    if ([currentStatus isEqualToString:CTRadioAccessTechnologyHSUPA]){
        //3.5G网络
        return @"3G";
    }
    if ([currentStatus isEqualToString:CTRadioAccessTechnologyCDMA1x]){
        //CDMA2G网络
        return @"2G";
    }
    if ([currentStatus isEqualToString:CTRadioAccessTechnologyCDMAEVDORev0]){
        //CDMA的EVDORev0(应该算3G吧?)
        return @"3G";
    }
    if ([currentStatus isEqualToString:CTRadioAccessTechnologyCDMAEVDORevA]){
        //CDMA的EVDORevA(应该也算3G吧?)
        return @"3G";
    }
    if ([currentStatus isEqualToString:CTRadioAccessTechnologyCDMAEVDORevB]){
        //CDMA的EVDORev0(应该还是算3G吧?)
        return @"3G";
    }
    if ([currentStatus isEqualToString:CTRadioAccessTechnologyeHRPD]){
        //HRPD网络
        return @"3G";
    }
    if ([currentStatus isEqualToString:CTRadioAccessTechnologyLTE]){
        //LTE4G网络
        return @"4G";
    }

    return @"wifi" ;
}


@end
