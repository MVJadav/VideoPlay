//
//  VideoPlayVC.swift
//  TestDemo
//
//  Created by JadavMac on 20/07/17.
//  Copyright © 2017 MV Jadav. All rights reserved.
//

/* NOTE:
 Necessary: import AVKit, import AVFoundation
 AVFoundation framework is needed even if you use AVPlayer
 URL : https://stackoverflow.com/questions/25932570/how-to-play-video-with-avplayerviewcontroller-avkit-in-swift
 */


import UIKit
import AVKit
import AVFoundation

class VideoPlayVC: UIViewController {

    @IBOutlet weak var IBPlayView           : UIView!
    @IBOutlet weak var IBbtnPlay            : UIButton!
    @IBOutlet weak var IBplayBourd          : UIView!
    @IBOutlet weak var IBPlayBtnView        : UIView!
    
    var player = AVPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func clickOnAVPlayerController(_ sender: Any) {
        self.IBPlayBtnView.isHidden = true
        self.IBplayBourd.isHidden = true
        self.AVPlayerViewControllerPlay()
    }
    
    @IBAction func clickOnAVPlayer(_ sender: Any) {
        self.IBPlayBtnView.isHidden = false
        self.IBplayBourd.isHidden = false
        self.AVPlayerOnly()
    }
    
    @IBAction func clickOnPauseStop(_ sender: Any) {
        
        if self.IBbtnPlay.isSelected {
            player.pause()
            self.IBbtnPlay.isSelected = false
            self.IBbtnPlay.setTitle("Play",for: .normal)
        }else {
            player.play()
            self.IBbtnPlay.isSelected = true
            self.IBbtnPlay.setTitle("Pause",for: .normal)
        }
        
    }
    
    
    func AVPlayerViewControllerPlay() {
        
        let videoURL1 = URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
        let playerController = AVPlayer(url: videoURL1!)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = playerController
        self.present(playerViewController, animated: true) {
            playerViewController.player!.play()
        }
    }
    
    func AVPlayerOnly() {
        let videoURL = URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
        player = AVPlayer(url: videoURL!)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.IBPlayView.bounds  //self.view.bounds
        //self.view.layer.addSublayer(playerLayer)
        self.IBPlayView.layer.addSublayer(playerLayer)
        player.play()
    }
}

//MARK: - Other Methods
extension VideoPlayVC {
    func setView() {
        self.title = "My List"
        self.navigationController?.navigationBar.isTranslucent = false
        self.IBbtnPlay.isSelected = true
        self.IBPlayBtnView.isHidden = true
        self.IBplayBourd.isHidden = true
    }
}
