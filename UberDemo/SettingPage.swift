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
        scrollView.addSubview(userBackView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
