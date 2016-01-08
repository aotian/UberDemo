//
//  AddPayPage.swift
//  UberDemo
//
//  Created by 江祎 on 15/12/27.
//  Copyright © 2015年 jiangyi. All rights reserved.
//

import UIKit

class AddPayPage: FxBasePage,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var datas:[PayInfo]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "添加付款方式"
        setNavigationItem("Back.png", selector: "doBack", isRight: false)
        setNavigationItem("验证手机", selector: "doRight", isRight: true)
        initDatas()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "reUseID")
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func doRight() {
        let page = VerifyPhonePage()
        let text1 = page.view.viewWithTag(1) as! UITextField
        text1.becomeFirstResponder()
        let navPage = UINavigationController(rootViewController: page)
        self.presentViewController(navPage, animated: true, completion: nil)
    }
    
    func initDatas(){
        var data:PayInfo?
        let dict:[String:String] = ["百度钱包":"BaiDuWallet.png","银联":"YinLian.png","支付宝":"AliPay.png","国际信用卡":"CreditCard.png"]
        datas = []
        for (key,value) in dict{
            data = PayInfo()
            data?.name = key
            data?.icon = value
            datas?.append(data!)
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas!.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("reUseID") as UITableViewCell!
        
        cell?.textLabel?.text = datas![indexPath.row].name
        cell?.imageView?.image = UIImage(named: datas![indexPath.row].icon!)
        return cell!
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let page = YinLianPage()
        self.navigationController?.pushViewController(page, animated: true)
    }

}
