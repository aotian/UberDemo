//
//  UserInfoPage.swift
//  UberDemo
//
//  Created by 江祎 on 15/12/27.
//  Copyright © 2015年 jiangyi. All rights reserved.
//

import UIKit

class UserInfoPage: FxBasePage,UIImagePickerControllerDelegate,UINavigationControllerDelegate  {

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var backUserView: UIView!
    @IBOutlet weak var backView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        backUserView.layer.masksToBounds = true
        backUserView.layer.cornerRadius = 5
        backView.layer.masksToBounds = true
        backView.layer.cornerRadius = 5
        
        self.title = "建立基本资料"
        setNavigationItem("Back.png", selector: "doBack", isRight: false)
        setNavigationItem("下一步", selector: "doRight", isRight: true)
    }

    @IBAction func doSetAvatar(sender: UIButton) {
        let alert = UIAlertController(title: "", message: "", preferredStyle: UIAlertControllerStyle.ActionSheet)
        let page = UIImagePickerController()
        page.delegate = self
        let action1 = UIAlertAction(title: "从libary选择", style: UIAlertActionStyle.Default) { (action) -> Void in
            page.sourceType = .PhotoLibrary
            self.presentViewController(page, animated: true, completion: nil)
        }
        let action2 = UIAlertAction(title: "拍照", style: UIAlertActionStyle.Default) { (action) -> Void in
            page.sourceType = .Camera
            self.presentViewController(page, animated: true, completion: nil)
        }
        let action3 = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil)
        alert.addAction(action1)
        alert.addAction(action2)
        alert.addAction(action3)
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        avatar.image = image
        
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func doRight() {
        let page = AddPayPage()
        self.navigationController?.pushViewController(page, animated: true)
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
