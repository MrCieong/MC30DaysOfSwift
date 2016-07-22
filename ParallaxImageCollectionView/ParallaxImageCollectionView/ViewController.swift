//
//  ViewController.swift
//  ParallaxImageCollectionView
//
//  Created by zhangjing on 16/7/21.
//  Copyright © 2016年 MrCieong. All rights reserved.
//

import UIKit

let kImageHeaderViewAspectRatio: CGFloat = 275.0 / 375.0

class ViewController: UICollectionViewController {
  
  var images = [UIImage(imageLiteral: "lighter"), UIImage(imageLiteral: "lost-places"), UIImage(imageLiteral: "seagull"), UIImage(imageLiteral: "water-lily")]
  
  var currentImage: UIImage! {
    didSet {
      collectionView?.reloadData()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    currentImage = images[0]
    // Do any additional setup after loading the view, typically from a nib.
    let layout = collectionView?.collectionViewLayout as! ParallaxLayout
    let itemWidth = (view.bounds.width - (10 * 4)) / 3
    layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

let kHeaderViewIdentifier = "ImageHeaderView"

// MARK: - data source
extension ViewController {
  
  override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
    if kind == UICollectionElementKindSectionHeader {
      let headerView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier:kHeaderViewIdentifier , forIndexPath: indexPath) as! ImageHeaderView
      headerView.image = currentImage
      return headerView
    } else {
      let footerView = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionFooter, withReuseIdentifier: "FooterView", forIndexPath: indexPath)
      return footerView
      
    }
  
  }
  
  override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ImageCell", forIndexPath: indexPath) as! ImageCell
    cell.imageView.image = images[indexPath.item]
    return cell
    
  }
  
  override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return images.count
  }
  
  override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    currentImage = images[indexPath.item]
  }
  
}
