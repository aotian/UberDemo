//
//  UserCenterPage.swift
//  UberDemo
//
//  Created by 江祎 on 16/1/4.
//  Copyright © 2016年 jiangyi. All rights reserved.
//

import UIKit

class UserCenterPage: FxBasePage {
    
    var owner:FxBasePage?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func doSetting(sender: UIButton) {
        let own = self.owner as! HomePage
        own.doShowSetting()
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
