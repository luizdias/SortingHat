//
//  ViewController.swift
//  SortingHat
//
//  Created by f6476359 on 24/02/19.
//  Copyright © 2019 Luiz Fernando Dias. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class ViewController: UIViewController {

    let avQueuePlayer:AVQueuePlayer = AVQueuePlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        theHous.text = ""
        ViewController.initSession()
        self.playBGSong()
//        do {
//            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [.mixWithOthers, .allowAirPlay])
//            print("Playback OK")
//            try AVAudioSession.sharedInstance().setActive(true)
//            print("Session is Active")
//        } catch {
//            print(error)
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBOutlet weak var theHous: UILabel!
    @IBAction func sortingHatAction(_ sender: UIButton) {
        theHous.text = "Atenção... 🤫"
        _ = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(self.updateName), userInfo: nil, repeats: false)
    }
    
    @objc func updateName(){
        let sortedName = sort()
        theHous.text = sortedName
    }
    
    func sort() -> String {
        let names = ["Grifinória", "Sonserina", "Corvinal", "Lufa-Lufa"]
//        let randomHouseName =
        
        if let randomHouseName = names.randomElement() {
            return randomHouseName;
        } else{
            return "opa! 😄"
        }
    }
    
    func playBGSong() {
        let assetUrl = Bundle.main.url(forResource: "theme", withExtension: "mp3")
        let avSongItem = AVPlayerItem(url: assetUrl!)
        self.avQueuePlayer.insert(avSongItem, after: nil)
        self.play()
        
    }
    
    func play() {
        avQueuePlayer.play()
    }
    
    class func initSession() {
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.duckOthers)
            let _ = try AVAudioSession.sharedInstance().setActive(true)
        } catch let error as NSError {
            print("an error occurred when audio session category.\n \(error)")
        }
    }
        
}

