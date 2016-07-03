//
//  ViewController.swift
//  DeletingAnd Rearranging
//
//  Created by zhangjing on 16/7/3.
//  Copyright © 2016年 MrCieong. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

  var data = ["Milk", "Apples", "Eggs", "Ham"]
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  @IBAction func clickEditButtonItem(sender: UIBarButtonItem) {
    if sender.title == "Edit" {
      sender.title = "Done"
      tableView.editing = true
    } else {
      sender.title = "Edit"
      tableView.editing = false
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

// MARK: - UITableViewDataSource UITableViewDelegate
extension ViewController {
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
    cell.textLabel?.text = data[indexPath.row]
    return cell
    
  }
  
  override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    return true
  }
  
  override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
    let food = data[sourceIndexPath.row]
    data.removeAtIndex(sourceIndexPath.row)
    data.insert(food, atIndex: destinationIndexPath.row)
    tableView.reloadData()
    
  }
  
  override func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
    return .Delete
  }
  
  override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
      data.removeAtIndex(indexPath.row)
      tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }
  }
}