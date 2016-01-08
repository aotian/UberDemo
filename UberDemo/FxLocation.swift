//
//  FxLocation.swift
//  UberDemo
//
//  Created by 江祎 on 15/12/26.
//  Copyright © 2015年 jiangyi. All rights reserved.
//

import UIKit
import CoreLocation


class FxLocation: NSObject,CLLocationManagerDelegate {

    var manager:CLLocationManager?
    
    func startLocation(){
        if CLLocationManager.locationServicesEnabled(){
            manager = CLLocationManager()
            manager?.delegate = self
            //控制精度
            manager?.desiredAccuracy = kCLLocationAccuracyBest
            //控制定位服务更新频率，单位是米
            manager?.distanceFilter = 100
            manager?.startUpdatingLocation()
            manager?.requestAlwaysAuthorization()
        }
    }
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        FxLog(String(status))
    }
    
    func searchAddress(location:CLLocation){
        let corder = CLGeocoder()

        corder.reverseGeocodeLocation(location, completionHandler: {
            (marks:[CLPlacemark]?,error:NSError?) in
            if marks != nil{
                for mark in marks!{
                    FxLog(mark.name!)
                    
                }
            }
        })
    }
    
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        searchAddress(newLocation)
    }
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        searchAddress(locations[0])
        manager.stopUpdatingLocation()
    }
}
