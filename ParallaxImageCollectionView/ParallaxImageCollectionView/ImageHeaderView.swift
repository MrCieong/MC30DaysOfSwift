//
//  ImageHeaderView.swift
//  ParallaxImageCollectionView
//
//  Created by zhangjing on 16/7/21.
//  Copyright © 2016年 MrCieong. All rights reserved.
//

import UIKit

class ImageHeaderView: UICollectionReusableView {
        
  @IBOutlet weak var imageView: UIImageView!
  
  var image: UIImage? {
    willSet {
      imageView.alpha = 0.5
    }
    
    didSet {
      UIView.animateWithDuration(1) {
        self.imageView.image = self.image
        self.imageView.alpha = 1
      }
    }
  }
  
}
