//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
    @IBAction func hardnessSelector(_ sender: UIButton) {
        timer.invalidate()      //To Restart Timer on every Click
        
        let hardness = sender.currentTitle!
        titleLabel.text = hardness
        totalTime = eggTimes[hardness]!
        progressBar.progress = 0.0
        secondsPassed = 0
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil ,repeats: true)
    }
    
    @objc func updateTimer(){
        if secondsPassed < totalTime{
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            
        }
        else{
            timer.invalidate()
            titleLabel.text = "Done!!"
        }
    }
    
}
