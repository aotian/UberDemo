//
//  FxURLDefine.swift
//  UberDemo
//
//  Created by 江祎 on 15/12/20.
//  Copyright © 2015年 jiangyi. All rights reserved.
//

import Foundation

func ServerAddress() -> String{
    var address = "http://10.0.1.18"
    
    #if AppStore
        address = "http://www.uber.com"
    #endif
    
    return address
}

let YLTnURL = "http://202.101.25.178:8080/sim/gettn"

