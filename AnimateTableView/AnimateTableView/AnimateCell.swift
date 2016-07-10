//
//  AnimateCell.swift
//  AnimateTableView
//
//  Created by zhangjing on 16/7/9.
//  Copyright © 2016年 MrCieong. All rights reserved.
//

import UIKit

class AnimateCell: UITableViewCell {
  let gradientLayer = CAGradientLayer()
  

  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    let color1 = UIColor(white: 1.0, alpha: 0.2).CGColor as CGColorRef
    let color2 = UIColor(white: 1.0, alpha: 0.1).CGColor as CGColorRef
    let color3 = UIColor.clearColor().CGColor as CGColorRef
    let color4 = UIColor(white: 0.0, alpha: 0.05).CGColor as CGColorRef
    gradientLayer.colors = [color1, color2, color3, color4]
    gradientLayer.frame = bounds
    gradientLayer.locations = [0.00, 0.04, 0.09, 1.0]
    contentView.layer.addSublayer(gradientLayer)
  }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
