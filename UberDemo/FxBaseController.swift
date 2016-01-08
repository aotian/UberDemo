//
//  FxBaseController.swift
//  UberDemo
//
//  Created by 江祎 on 15/12/20.
//  Copyright © 2015年 jiangyi. All rights reserved.
//

import UIKit

class FxBaseController: UIViewController {

    var activity:FxActivity?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    private func showActivityInView(view:UIView)-> FxActivity{
        let activity = FxActivityIndicator(view: view)
        activity.frame = view.bounds
        view.addSubview(activity)
        activity.labelText = ""
        return activity
    }
    func showIndicator(tipMessage:String?,autoHide:Bool,afterDelay:Bool){
        if activity == nil{
            activity = showActivityInView(self.view)
        }
        if tipMessage != nil{
            activity?.labelText = tipMessage
            
            activity?.show(false)
        }
        if autoHide && activity?.alpha >= 1.0{
            if afterDelay{
                activity?.hide(true, afterDelay: 1.0)
            }else{
                activity?.hide(true)
            }
        }
    }
    
    func hideIndicator(){
        activity?.hide(true)
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
