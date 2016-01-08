//
//  FxDefine.swift
//  UberDemo
//
//  Created by 江祎 on 15/12/20.
//  Copyright © 2015年 jiangyi. All rights reserved.
//

import Foundation
import UIKit

// 常量 也就是oc中的宏
let LoadingTip = "加载中..."
let ScreenHeight = UIScreen.mainScreen().bounds.height
let iOS8:Float = 8.0
let PanWidth:CGFloat = 100

func FxLog(message:String,function:String = __FUNCTION__){
    #if DEBUG
        print("Log:\(message),\(function)")
    #elseif AppStore
        print("Log:\(message),\(function)")
    #else
    #endif

}

func isiPhone5()->Bool{
     #if os(iOS)
        FxLog("iOS")
    #else
    #endif
    if ScreenHeight == 568 {
        return true
    }
    
   
    return false
}
func isiPhone6()->Bool{
    #if os(iOS)
        FxLog("iOS")
    #else
    #endif
    if ScreenHeight == 667{
        return true
    }
    return false
}
func isiPhone6P()->Bool{
    if ScreenHeight == 736{
        return true
    }
    return false
}