//
//  AnimateTableViewController.swift
//  AnimateTableView
//
//  Created by zhangjing on 16/7/9.
//  Copyright © 2016年 MrCieong. All rights reserved.
//

import UIKit

class AnimateTableViewController: UITableViewController {
    var tableData = ["Personal Life", "Buddy Company", "#30 days Swift Project", "Body movement training", "AppKitchen Studio", "Project Read", "Others" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerClass(AnimateCell.self, forCellReuseIdentifier: "Cell")
        tableView.separatorStyle = .None
        UIApplication.sharedApplication().statusBarHidden = true
        tableView.backgroundColor = UIColor.blackColor()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        animateCell()
    }
    
    func animateCell() {
        self.tableView.reloadData()
        let cells = tableView.visibleCells;
        for cell in cells {
            cell.transform = CGAffineTransformMakeTranslation(0, view.bounds.size.height)
        }
        
        var index:Double = 0
        
        for cell in cells {
            UIView.animateWithDuration(1.5, delay: index * 0.05, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                cell.transform = CGAffineTransformMakeTranslation(0, 0)
                }, completion: nil)
            index += 1
        }
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }

  
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! AnimateCell
        cell.selectionStyle = .None
        cell.textLabel?.text = tableData[indexPath.row]
        cell.textLabel?.font = UIFont(name: "Avenir Next", size: 18)
        cell.textLabel?.textColor = UIColor.whiteColor()
        return cell
    }
 
    func colorforIndex(index: Int) -> UIColor {
        
        let itemCount = tableData.count - 1
        let color = (CGFloat(index) / CGFloat(itemCount)) * 0.6
        return UIColor(red: color, green: 0.0, blue: 1.0, alpha: 1.0)
        
    }
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = colorforIndex(indexPath.row)
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        animateCell()
    }
}
