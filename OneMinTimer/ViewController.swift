//
//  ViewController.swift
//  OneMinTimer
//
//  Created by 中塩成海 on 2015/06/25.
//  Copyright (c) 2015年 Derushio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let TIMER_INTERVAL: Double = 0.1
    
    @IBOutlet weak var timerLabel: UILabel!
    
    private var timer: NSTimer?
    private var count: Int = 0
    
    private var min: Int = 2
    private var sec: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startTimer() {
        stopTimer()
        timer = NSTimer.scheduledTimerWithTimeInterval(TIMER_INTERVAL, target: self, selector: "onTick", userInfo: nil, repeats: true)
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func resetTimer() {
        stopTimer()
        min = 2
        sec = 0
        
        timerLabel.text = timeStringGenerate()
    }
    
    func timeStringGenerate() -> String {
        var secString: String = String(sec)
        if (sec < 10) {
            secString = "0" + secString
        }
        return (String(min) + ":" + secString)
    }
    
    func onTick() {
        count++
        if (count >= 10) {
            countDown()
            count = 0
        }
    }
    
    func countDown() {
        sec--
        if (sec < 0) {
            min--
            if (min < 0) {
                stopTimer()
            }
            sec = 59
        }
        
        timerLabel.text = timeStringGenerate()
    }
    
    @IBAction func onStartClick(sender: AnyObject) {
        startTimer()
    }
    
    @IBAction func onStopClick(sender: AnyObject) {
        stopTimer()
    }
    
    @IBAction func onResetClick(sender: AnyObject) {
        resetTimer()
    }
}

