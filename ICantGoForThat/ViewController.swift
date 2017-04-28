//
//  ViewController.swift
//  ICantGoForThat
//
//  Created by Tieshow Daniels on 4/27/17.
//  Copyright © 2017 Ty Daniels. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    lazy var redButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.red
        button.layer.cornerRadius = 100
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    fileprivate func setupView() {
        
        view.backgroundColor = UIColor.lightGray
        
        redButton.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        redButton.center = view.center
        redButton.setTitle("#ICan'tGoForThat", for: .normal)
        redButton.addTarget(self, action: #selector(playSound), for: .touchUpInside)
        view.addSubview(redButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate var player: AVAudioPlayer?
    
    @objc fileprivate func playSound() {
        let url = Bundle.main.url(forResource: "CantGoForThat", withExtension: "mp3")!
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            
            player.prepareToPlay()
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }


}

