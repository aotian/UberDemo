//
//  FxGlobal.swift
//  UberDemo
//
//  Created by 江祎 on 15/12/20.
//  Copyright © 2015年 jiangyi. All rights reserved.
//

import Foundation
import UIKit

func isSystemiOS8() -> Bool{
    
    let device = UIDevice.currentDevice()
    let systemVer = device.systemVersion as NSString
    
    if (systemVer.floatValue - iOS8 < -0.001){
        return true
    }
    return false
    
    
}
