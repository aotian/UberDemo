//
//  GuidePage.swift
//  UberDemo
//
//  Created by 江祎 on 15/12/20.
//  Copyright © 2015年 jiangyi. All rights reserved.
//

import UIKit
import AVFoundation

class GuidePage: FxBasePage {

    @IBOutlet weak var BackImageView: UIImageView!
    @IBOutlet weak var BackView: UIView!
    
    var player:AVPlayer!
    var playerItem:AVPlayerItem!
    var location:FxLocation!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
     //   initPlayVideo()
     //   doAnimation()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //定义一个播放动画的函数
    func doAnimation(){
        var images:[UIImage] = []
        var image:UIImage?
        var imageName:String?
        
        for var index = 0;index <= 67;index++ {
            imageName = "logo-" + String(format: "%03d", index)
            image = UIImage(named: imageName!)
            images.insert(image!, atIndex: index)
        }
        BackImageView.animationImages = images
        BackImageView.animationRepeatCount = 1
        BackImageView.animationDuration = 5
        
        BackImageView.startAnimating()
        UIView.animateWithDuration(0.7, delay:5, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.BackView.alpha = 0.7
            self.player!.play()
            },completion: {
                finished in
                print("Animation End")
        })
    }
    
    func initPlayVideo(){
        let path = NSBundle.mainBundle().pathForResource("welcome_video", ofType: "mp4")
        let url = NSURL.fileURLWithPath(path!)
        
        playerItem = AVPlayerItem(URL: url)
        player = AVPlayer(playerItem: playerItem)
        
        let playerLayer = AVPlayerLayer(player: player)
        
        playerLayer.frame = BackView.bounds
        playerLayer.videoGravity = AVLayerVideoGravityResize
        BackView.layer.insertSublayer(playerLayer, atIndex: 0)
        BackView.alpha = 0.0
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "didFinishVideo:", name: AVPlayerItemDidPlayToEndTimeNotification, object: playerItem)
        
      
    }
    func didFinishVideo(sender:NSNotification){
        let item = sender.object as! AVPlayerItem
        item.seekToTime(kCMTimeZero)
        player.play()
    }

    @IBAction func doLogin(){
        location = FxLocation()
        location.startLocation()
    }
    @IBAction func doRegister(){
        let page = CreateAccountPage()
        let navPage = UINavigationController(rootViewController: page)
        self.presentViewController(navPage, animated: true, completion: nil)
    }

}
