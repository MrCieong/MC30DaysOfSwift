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

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
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
      return headerView
    }
    return UICollectionReusableView()
  }
  
  override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath)
    return cell
    
  }
  
  override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 0
  }
  
}
