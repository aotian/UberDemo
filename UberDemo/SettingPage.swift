//
//  SettingPage.swift
//  UberDemo
//
//  Created by 江祎 on 16/1/8.
//  Copyright © 2016年 jiangyi. All rights reserved.
//

import UIKit

class SettingPage: FxBasePage {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet var userBackView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationItem("Close.png", selector: "doBack", isRight: false)
        scrollView.contentSize = userBackView.bounds.size
        scrollView.contentOffset = CGPoint(x: 0, y: 50)
        scrollView.addSubview(userBackView)
        self.view.addSubview(scrollView)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
