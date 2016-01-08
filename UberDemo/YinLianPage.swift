//
//  YinLianPage.swift
//  UberDemo
//
//  Created by 江祎 on 16/1/2.
//  Copyright © 2016年 jiangyi. All rights reserved.
//

import UIKit

class YinLianPage: FxBasePage,UPPayPluginDelegate,NSURLConnectionDataDelegate {
    //请求返回的数组
    var responseData:NSMutableData?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func doPay(sender: UIButton) {
        let url = NSURL(string: YLTnURL)
        startPay(url!)
    }
    
    func startPay(url:NSURL){
        let urlRequest = NSURLRequest(URL: url)
        let connect = NSURLConnection(request: urlRequest, delegate: self)
        connect?.start()
    }
    
    func UPPayPluginResult(result: String!) {
        FxLog(result)
    }
    func connection(connection: NSURLConnection, didReceiveResponse response: NSURLResponse) {
        let urlResponse = response as! NSHTTPURLResponse
        
        if urlResponse.statusCode != 200{
            FxLog("error status code")
        }else{
            responseData = NSMutableData()
        }
    }
    func connection(connection: NSURLConnection, didReceiveData data: NSData) {
        responseData?.appendData(data)
    }
    func connectionDidFinishLoading(connection: NSURLConnection) {
        let result = String(data: responseData!, encoding: NSUTF8StringEncoding)
        if result != nil{
            FxPayPlugin.startPayFx(result, mode: "01", viewController: self, delegate: self)
        }
    }
    func connection(connection: NSURLConnection, didFailWithError error: NSError) {
        FxLog(error.localizedFailureReason!)
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
