//
//  SelectCountryPage.swift
//  UberDemo
// 
//  Created by 江祎 on 15/12/27.
//  Copyright © 2015年 jiangyi. All rights reserved.
//

import UIKit

class SelectCountryPage: FxBasePage,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableView:UITableView!
    
    var countrys:[CountryInfo]?
    var headers:[String]?
    var dictDatas:[String:AnyObject]?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setNavigationItem("取消", selector: "doBack", isRight: false)
        initCountry()
        initDatas()
        //创建重用的单元格
        
        self.tableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "CellID")
        
        self.tableView.reloadData()
    }
    
    func initCountry(){
        let arrCodes = NSLocale.ISOCountryCodes()
        let locale:NSLocale = NSLocale.currentLocale()
        var info:CountryInfo!
        
        countrys = []
        for code in arrCodes{
            info = CountryInfo()
            info.code = code
            info.name = locale.displayNameForKey(NSLocaleCountryCode, value: code)
            countrys?.append(info)
        }
        countrys?.sortInPlace({ (arg1:CountryInfo, arg2:CountryInfo) -> Bool in
            return arg1.name.localizedCaseInsensitiveCompare(arg2.name) == .OrderedAscending
        })
    }
    func initDatas(){
        var firstLetter:String!
        var datas:[CountryInfo]!
        headers = []
        datas = []
        dictDatas = [:]
        for country in countrys!{
            firstLetter = FxString.firstCharactor(country.name)
            if !((headers!.contains(firstLetter))) {
                if datas.count
                    > 0{
                        dictDatas![(headers?.last!)!] = datas
                }
                headers?.append(firstLetter)
                datas = []
            }
            datas.append(country)
        }
        
        dictDatas![headers!.last!] = datas
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return headers!.count
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = headers![section]
        let datas = dictDatas![key] as! [CountryInfo]
        return datas.count
    }
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headers![section]
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identify = "CellID"
        let cell = tableView.dequeueReusableCellWithIdentifier(identify, forIndexPath: indexPath) as UITableViewCell
        let key = headers![indexPath.section]
        let datas = dictDatas![key] as! [CountryInfo]
        let country = datas[indexPath.row]
        cell.accessoryType = .None
        cell.textLabel?.text = country.name!
        
        return cell
    }
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        /*
        let chars: [CChar] = [99, 100, 101, 0]
        let str2: String = String.fromCString(chars)!
        // 输出：cde
        在Swift中，String是由独立编码的Unicode字符组成的，即Character。一个Character可能包括一个或多个字节。所以将String字符串转换成C语言的char *时，数组元素的个数与String字符的个数不一定相同(即在Swift中，与str.characters.count计算出来的值不一定相等)。这一点需要注意。另外还需要注意的就是将CChar数组转换为String时，数组最后一个元素应当为字符串结束标志符，即0。
        */
//        var indexs:[String] = []
//        var char:[CChar] = [0,0]
//        for i in 65..<91{
//            
//            char[0] = CChar(i)
//            indexs.append(String.fromCString(char)!)
//        }
//        indexs.append("#")
        
        return headers
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let cell:UITableViewCell? = self.tableView.cellForRowAtIndexPath(indexPath)
        cell?.accessoryView = UIImageView(image: UIImage(named: "Back.png"))
        doBack()
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
