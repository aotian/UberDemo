//
//  HomePage.swift
//  UberDemo
//  home
//  Created by 江祎 on 16/1/4.
//  Copyright © 2016年 jiangyi. All rights reserved.
//

import UIKit

class HomePage: FxBasePage {
    
    var leftView:UIView?
    var backControl:UIControl!
    var showingLeft:Bool!
    var userCenterPage:UserCenterPage?

    override func viewDidLoad() {
        super.viewDidLoad()
        //添加backcontrol
        addBackControl()
        setNavigationItem("Left", selector: Selector("doShowLeft"), isRight: false)

        // Do any additional setup after loading the view.
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        showingLeft = false
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.addLeftView()
        self.addUserCenterView()
    }
    func doShowLeft(){
        if showingLeft!{
            showCenterPanel()
        }else{
            showLeftPanel()
        }
    }
    
    func showLeftPanel(){
        showingLeft = true
        showCenterView(leftView!, offset: -2, shadow: true)
        UIView.animateWithDuration(1.0, delay: 0, options: .BeginFromCurrentState, animations: {
            var frame = self.leftView?.frame
            frame?.origin.x = 0
            self.leftView?.frame = frame!
            
            frame = self.navigationController?.navigationBar.frame
            frame?.origin.x = (frame?.size.width)! - PanWidth
            self.navigationController?.navigationBar.frame = frame!
            }) { (finished:Bool) -> Void in
                if finished{
                    self.navigationController!.view.bringSubviewToFront(self.backControl)
                    self.navigationController!.view.bringSubviewToFront(self.leftView!)
                }
        }
    }
    func showCenterPanel(){
        showingLeft = false
        UIView.animateWithDuration(1.0, delay: 0, options: .BeginFromCurrentState, animations: {
            var frame = self.leftView?.frame
            frame?.origin.x = -frame!.size.width
            self.leftView?.frame = frame!
            frame = self.navigationController?.navigationBar.frame
            frame?.origin.x = 0
            self.navigationController?.navigationBar.frame = frame!
            }) { (finished:Bool) -> Void in
                if finished{
                    self.navigationController!.view.sendSubviewToBack(self.backControl)
                    self.showCenterView(self.leftView!, offset: 0, shadow: false)
                }
        }
    }
    func showCenterView(view:UIView,offset:CGFloat,shadow:Bool){
        if shadow{
            view.layer.shadowColor = UIColor.blackColor().CGColor
            view.layer.shadowOpacity = 0.2
            view.layer.shadowOffset = CGSizeMake(offset, offset)
        }else{
            view.layer.cornerRadius = 0.0
            view.layer.shadowOpacity = 0.0
            view.layer.shadowOffset = CGSizeMake(offset, offset)
        }
    }
    func addBackControl(){
        if backControl == nil{
            let frame = self.navigationController!.view.bounds
            backControl = UIControl(frame: frame)
            backControl.backgroundColor = UIColor.blackColor()
            backControl.alpha = 0.5
            backControl.addTarget(self, action: Selector("doTapCenter:"), forControlEvents: .TouchUpInside)
            self.navigationController!.view.addSubview(backControl)
            self.navigationController!.view.sendSubviewToBack(backControl)
        }
    }
    
    func addLeftView(){
        if leftView == nil{
            var frame:CGRect = self.navigationController!.view.bounds
            frame.origin.x = -frame.size.width + PanWidth
            frame.size.width -= PanWidth
            
            leftView = UIView(frame: frame)
            print(frame)
            leftView?.backgroundColor = UIColor.blackColor()
            self.navigationController?.view.addSubview(leftView!)
        }
    }
    
    func addUserCenterView(){
        userCenterPage = UserCenterPage()
        userCenterPage!.view.frame = leftView!.bounds
        leftView?.addSubview((userCenterPage?.view)!)
    }
    func doTapCenter(sender:UIButton){
        if showingLeft!{
            showCenterPanel()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
