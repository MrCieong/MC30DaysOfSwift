//
//  ViewController.swift
//  PlayLocalVideo
//
//  Created by zhangjing on 16/7/2.
//  Copyright © 2016年 MrCieong. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UITableViewController {
  let videos = [Video(image: "videoScreenshot01", title: "Introduce 3DS Mario", source: "Youtube - 06:32"),
                Video(image: "videoScreenshot02", title: "Emoji Among Us", source: "Vimeo - 3:34"),
                Video(image: "videoScreenshot03", title: "Seals Documentary", source: "Vine - 00:06"),
                Video(image: "videoScreenshot04", title: "Adventure Time", source: "Youtube - 02:39"),
                Video(image: "videoScreenshot05", title: "Facebook HQ", source: "Facebook - 10:20"),
                Video(image: "videoScreenshot06", title: "Lijiang Lugu Lake", source: "Allen - 20:30")]
  
  var playView: AVPlayer {
    if let videoPath = NSBundle.mainBundle().pathForResource("emoji zone", ofType: "mp4") {
     let videoPathURL =  NSURL(fileURLWithPath: videoPath)
      return AVPlayer(URL: videoPathURL)
    }
    return AVPlayer()
    
  }
  
  lazy var playViewController = AVPlayerViewController()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.rowHeight = 220
  }

  @IBAction func clickPlayButton(sender: AnyObject) {
    playViewController.player = playView
    presentViewController(playViewController, animated: true) { 
      self.playViewController.player?.play()
    }
  }
  
}

// MARK: - UITableViewDataSource tips:在类头部连续打三个'/' 生成 MARK
extension ViewController {
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return videos.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("VideoCell", forIndexPath: indexPath) as! VideoCell
    cell.video = videos[indexPath.row]
    return cell
  }
}


