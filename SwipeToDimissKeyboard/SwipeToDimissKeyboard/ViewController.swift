//
//  ViewController.swift
//  SwipeToDimissKeyboard
//
//  Created by zhangjing on 16/7/8.
//  Copyright © 2016年 MrCieong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var dataTextView: UITextView!
  override func viewDidLoad() {
    super.viewDidLoad()
    dataTextView.becomeFirstResponder()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    let secondVC = segue.destinationViewController as! SecondViewController
    secondVC.showText = self.dataTextView.text
  }
  
  @IBAction func swipToDismissKeyboard(sender: AnyObject) {
    view.endEditing(true)
  }

}

