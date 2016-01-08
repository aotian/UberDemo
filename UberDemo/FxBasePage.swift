//
//  FxBasePage.swift
//  UberDemo
//
//  Created by 江祎 on 15/12/20.
//  Copyright © 2015年 jiangyi. All rights reserved.
//

import UIKit

class FxBasePage: FxBaseController{

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setNavigationItem(title:String,selector:Selector,isRight:Bool){
        var item:UIBarButtonItem!
        
        if title.hasSuffix("png"){
            item = UIBarButtonItem(image: UIImage(named: title), style: UIBarButtonItemStyle.Plain, target: self, action: selector)
        }else{
            item = UIBarButtonItem(title: title, style: UIBarButtonItemStyle.Plain, target: self, action: selector)
        }
        
        item.tintColor = UIColor.blackColor()
        
        if isRight{
            self.navigationItem.rightBarButtonItem = item
            
        }else{
            self.navigationItem.leftBarButtonItem = item
        }
    }
    func doRight(){
     FxLog("下一步")
    }
    func doBack(){
        self.dismissViewControllerAnimated(true, completion: nil)
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
