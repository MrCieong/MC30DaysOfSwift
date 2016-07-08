//
//  ViewController.swift
//  Jumpbar
//
//  Created by zhangjing on 16/7/4.
//  Copyright © 2016年 MrCieong. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    let timeZoneNames = NSTimeZone.knownTimeZoneNames()
    for timeZoneName in timeZoneNames {
      print(timeZoneName)
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

extension ViewController {
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 10
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 20
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
    
    return cell
  }
}