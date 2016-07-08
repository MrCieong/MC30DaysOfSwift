//
//  SecondViewController.swift
//  SwipeToDimissKeyboard
//
//  Created by zhangjing on 16/7/8.
//  Copyright © 2016年 MrCieong. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
  var showText: String?
  
  @IBOutlet weak var showDataLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
      self.showDataLabel.text = showText
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
