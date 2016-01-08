//
//  FxPayPlugin.cpp
//  UberDemo
//
//  Created by 江祎 on 16/1/2.
//  Copyright © 2016年 jiangyi. All rights reserved.
//

#import "FxPayPlugin.h"
#import "UPPayPlugin.h"

@implementation  FxPayPlugin

+ (BOOL)startPayFx:(NSString *)tn mode:(NSString *)mode viewController:(UIViewController *)viewController delegate:(id<UPPayPluginDelegate>)delegate{
    return [UPPayPlugin startPay:tn mode:mode viewController:viewController delegate:delegate];
}

@end
