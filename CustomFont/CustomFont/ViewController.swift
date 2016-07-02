//
//  ViewController.swift
//  CustomFont
//
//  Created by zhangjing on 16/7/2.
//  Copyright © 2016年 MrCieong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!
  let data = ["30 Days Swift", "这些字体特别适合打「奋斗」和「理想」", "谢谢「造字工房」，本案例不涉及商业使用", "使用到造字工房劲黑体，致黑体，童心体", "呵呵，再见🤗 See you next Project", "Mr Cieong"]
  
  let fontNames = ["MFTongXin_Noncommercial-Regular", "MFJinHei_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular"]
  var currentFontIndex = 0 {
    didSet {
      tableView.reloadData()
    }
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    for familyName in UIFont.familyNames() {
      for fontName in UIFont.fontNamesForFamilyName(familyName) {
        print(fontName)
      }
    }
  }

  @IBAction func changeFont(sender: AnyObject) {
    currentFontIndex = (currentFontIndex + 1) % 3
    
  }
}

extension ViewController: UITableViewDataSource {
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("FontCell")!
    cell.textLabel?.text = data[indexPath.row]
    cell.textLabel?.font = UIFont(name: fontNames[currentFontIndex], size: 32)
    return cell
  }
}

