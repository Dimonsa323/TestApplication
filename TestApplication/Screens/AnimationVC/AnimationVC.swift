//
//  AnimationVC.swift
//  TestApplication
//
//  Created by Дима Губеня on 04.01.2023.
//

import UIKit
import AVFoundation
import AVKit

class AnimationVC: UIViewController {
    
//    let videoURL = URL(string: "https://www.youtube.com/watch?v=yM_W6Hq5r6c")
//    let player = AVPlayer(url: videoURL!)
//    let playerViewController = AVPlayerViewController()
//    playerViewController.player = player
//    self.present(playerViewController, animated: true) {
//        playerViewController.player!.play()
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "Food", ofType: "mp4")!))
        let layer = AVPlayerLayer(player: player)
        layer.frame = view.bounds
        layer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(layer)
        
        player.volume = 0
        player.play()
        
    }
}
