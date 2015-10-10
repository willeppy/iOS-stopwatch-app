//
//  ViewController.swift
//  Stopwatch
//
//  Created by Will Epperson on 10/7/15.
//  Copyright © 2015 Epperson Apps. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var numLabel: UILabel!
    var timer = NSTimer()
    var timeCount = 0;
    var hasBegun:Bool = false;
    
    func increment() {
        timeCount++
        numLabel.text = "\(timeCount) s"
    }
    
    // reset timer
    @IBAction func reset(sender: AnyObject) {
        timer.invalidate() // essentially breaks timer / stops it
        timeCount = 0
        hasBegun = false
        numLabel.text = "0 sec"
    }
    
    // play timer
    @IBAction func play(sender: AnyObject) {
        
        if !hasBegun {
            
            // timer is set equal to NSTimer object (NS from Jobs's NextStep company)
            // @param 1 : wait time, 1 means wait 1 sec, 2 means wait 2 secs between calls
            // @param 2 : target object (?)
            // @param 3 : selector is method to be called every 1 second
            // @param 4 : userInfo is not used here
            // @param 5 : repeats means repeat action
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("increment"), userInfo: nil, repeats: true)
            
            hasBegun = true
        }
    }
    
    // pause timer
    @IBAction func pause(sender: AnyObject) {
        timer.invalidate() // essentially breaks timer / stops it
        hasBegun = false
    }
    
    
    // X-Code auto generated methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
