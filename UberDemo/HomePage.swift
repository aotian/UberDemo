//
//  HomePage.swift
//  UberDemo
//  home
//  Created by 江祎 on 16/1/4.
//  Copyright © 2016年 jiangyi. All rights reserved.
//

import UIKit

class HomePage: FxBasePage,BMKMapViewDelegate,BMKLocationServiceDelegate {
    
    var leftView:UIView?
    var backControl:UIControl!
    var showingLeft:Bool!
    var centerPage:UserCenterPage?
    //地图相关
    var mapView:BMKMapView?
    var locService:BMKLocationService?
    var userCoordinary:CLLocationCoordinate2D?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addBaiduMap()
        startLocation()
        addBackControl()
        setNavigationItem("Left", selector: Selector("doShowLeft"), isRight: false)
        
       
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        showingLeft = false
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        mapView?.delegate = self
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        self.addLeftView()
        self.addUserCenterView()
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillAppear(animated)
        mapView?.delegate = self
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
