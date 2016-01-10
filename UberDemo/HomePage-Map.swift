//
//  HomePage-Map.swift
//  UberDemo
//
//  Created by 江祎 on 16/1/10.
//  Copyright © 2016年 jiangyi. All rights reserved.
//

import Foundation

class CarAnimationView:BMKAnnotationView {
    var imageView:UIImageView!
    
    override init!(annotation: BMKAnnotation!, reuseIdentifier: String!) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        self.bounds = CGRect(x: 0, y: 0, width: 32, height: 32)
        self.backgroundColor = UIColor.clearColor()
        imageView = UIImageView(image: UIImage(named: "map-taxi.png"))
        imageView.frame = self.bounds
        self.addSubview(imageView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomePage{
    func addBaiduMap(){
        mapView = BMKMapView(frame: self.view.bounds)
        self.view.addSubview(mapView!)
        mapView?.zoomLevel = 10
        startLocation()
    }
    
    func startLocation(){
        locService = BMKLocationService()
        
        locService?.delegate = self
        locService?.startUserLocationService()
        mapView?.showsUserLocation = true
     //   userCoordinary = CLLocationCoordinate2D(latitude: 44.111, longitude: 122.333)
        
 
    }
    func didUpdateBMKUserLocation(userLocation: BMKUserLocation!) {
        userCoordinary = userLocation.location.coordinate
        
        mapView?.updateLocationData(userLocation)
        addCars()
        self.startTimer()
        
    }
    func startTimer(){
        timer = NSTimer(timeInterval: 1.0, target: self, selector: Selector("updateCars"), userInfo: nil, repeats: true)
        timer?.fire()
    }
    
    func stopTimer(){
        timer?.invalidate()
    }
    
    func updateCars(){
        userCoordinary?.latitude += 0.02
        userCoordinary?.longitude += 0.02
        addCars()
    }
    
    func addCars(){
        mapView?.removeOverlays(mapView?.overlays)
        if point != nil{
            mapView?.removeAnnotation(point)
        }
        point = BMKPointAnnotation()
        point!.coordinate = CLLocationCoordinate2D(latitude: userCoordinary!.latitude+0.002, longitude: userCoordinary!.longitude+0.002)
        point!.title = "Cars"
        mapView?.addAnnotation(point)
    }
    func mapView(mapView: BMKMapView!, viewForAnnotation annotation: BMKAnnotation!) -> BMKAnnotationView! {
        let car = CarAnimationView(annotation:annotation,reuseIdentifier:"PID")
        car.draggable = false
        return car
    }
}