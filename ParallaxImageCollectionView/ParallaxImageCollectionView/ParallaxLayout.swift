//
//  ParallaxLayout.swift
//  ParallaxImageCollectionView
//
//  Created by zhangjing on 16/7/21.
//  Copyright © 2016年 MrCieong. All rights reserved.
//

import UIKit

class ParallaxLayout: UICollectionViewFlowLayout {

  override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    let layoutAttributes = super.layoutAttributesForElementsInRect(rect)
    let offsetY = collectionView!.contentOffset.y
    if offsetY <= 0 {
      for attributes in layoutAttributes! {
        if attributes.representedElementKind == UICollectionElementKindSectionHeader && attributes.indexPath.section == 0 {
          let headerWidth = (collectionView?.bounds.width)!
          
          let headerHight: CGFloat = headerWidth * kImageHeaderViewAspectRatio
          let scale = (headerHight - offsetY) / headerHight
          attributes.frame = CGRect(x: (1 - scale) * headerWidth / 2.0, y: offsetY, width: scale * headerWidth, height: headerHight - offsetY)
          
        }
      }
    }
    return layoutAttributes
  }
  
  override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
    return true
  }
  
}
