//
//  VerifyPhonePage.swift
//  UberDemo
//
//  Created by 江祎 on 16/1/2.
//  Copyright © 2016年 jiangyi. All rights reserved.
//

import UIKit

class VerifyPhonePage: FxBasePage {
    @IBOutlet weak var Number1: UITextField!
    @IBOutlet weak var Number2: UITextField!
    @IBOutlet weak var Number3: UITextField!
    @IBOutlet weak var Number4: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "确认手机"
        setNavigationItem("Close.png", selector: "doBack", isRight: false)
    }

    @IBAction func doValueChanged(sender: UITextField) {
        let tag = sender.tag
        if sender.text!.isEmpty{
            if tag>1 {
                let preField = self.view.viewWithTag(tag-1) as! UITextField
                preField.becomeFirstResponder()
            }
        }else{
            if tag+1 <= 4{
                let nextField = self.view.viewWithTag(tag+1) as! UITextField
                nextField.becomeFirstResponder()
            }
        }
        if tag == 4{
            sender.resignFirstResponder()
            doVerify()
        }
        
    }
    func doVerify(){
        self.showIndicator("验证中", autoHide: true, afterDelay: true)
        self.performSelector(Selector("doShowHomePage"), withObject: nil, afterDelay: 1.0)
    }
    override func doBack() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func doShowHomePage(){
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        app.showHomePage()
    }


}
