//
//  ViewController.swift
//  TapOrHoldCounter
//
//  Created by zhangjing on 16/7/2.
//  Copyright © 2016年 MrCieong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var timer = NSTimer()
  var counter = 0 {
    didSet {
      counterLabel.text = "\(counter)"
    }
  }
  
  @IBOutlet weak var tapOrHoldButton: UIButton!
  
  @IBOutlet weak var counterLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tapOrHoldButton.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longPressHandler) ))
    
  }


  @IBAction func clickResetButton(sender: AnyObject) {
    timer.invalidate()
    counter = 0
  }
  
  func longPressHandler(sender: AnyObject) {
    if sender.state == UIGestureRecognizerState.Began {
      timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(ViewController.increment) , userInfo: 0, repeats: true)
    } else {
      timer.invalidate()
    }
    
  }
  
  @IBAction func tapButton(sender: UIButton) {
    
    increment()
  }
  
  
  func increment() {
    counter += 1
    
  }

}

