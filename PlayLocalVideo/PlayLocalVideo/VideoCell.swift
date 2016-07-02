//
//  VideoCell.swift
//  PlayLocalVideo
//
//  Created by zhangjing on 16/7/2.
//  Copyright © 2016年 MrCieong. All rights reserved.
//

import UIKit

struct Video {
  var image: String
  var title: String
  var source: String
  
  
}

class VideoCell: UITableViewCell {
  
  var video: Video? {
    didSet {
      if let video = video {
        videoImageView.image = UIImage(imageLiteral: video.image)
        videoTitleLabel.text = video.title
        videoSourceLabel.text = video.source
      }
      
    }
  }
  
  
  @IBOutlet weak var videoImageView: UIImageView!
  @IBOutlet weak var videoTitleLabel: UILabel!
  @IBOutlet weak var videoSourceLabel: UILabel!
  
  override func prepareForReuse() {
    videoImageView.image = nil
    videoTitleLabel.text = "Untitle"
    videoSourceLabel.text = "unknown"
  }
  

}
