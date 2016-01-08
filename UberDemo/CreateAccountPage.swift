//
//  CreateAccountPage.swift
//  UberDemo
//
//  Created by 江祎 on 15/12/27.
//  Copyright © 2015年 jiangyi. All rights reserved.
//

import UIKit

class CreateAccountPage: FxBasePage {

    @IBOutlet weak var backView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "创建账户"
        setNavigationItem("下一步", selector: "doRight", isRight: true)
        setNavigationItem("取消", selector: "doBack", isRight: false)
        
        backView.layer.masksToBounds = true
        backView.layer.cornerRadius = 5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    override func doRight() {
        let page = UserInfoPage()
        self.navigationController?.pushViewController(page, animated: true)
    }

    @IBAction func doSelectCountry(sender: UIButton) {
        let page = SelectCountryPage()
        page.title = "选择国家"
        
        let navPage = UINavigationController(rootViewController: page)
        self.presentViewController(navPage, animated: true, completion: nil)
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
