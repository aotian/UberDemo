//
//  FxPayPlugin.hpp
//  UberDemo
//
//  Created by 江祎 on 16/1/2.
//  Copyright © 2016年 jiangyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UPPayPluginDelegate.h"

@interface FxPayPlugin : NSObject

+ (BOOL)startPayFx:(NSString*)tn mode:(NSString*)mode viewController:(UIViewController*)viewController delegate:(id<UPPayPluginDelegate>)delegate;

@end