//
//  WorkTableViewCell.swift
//  Artistry
//
//  Created by zhangjing on 16/7/7.
//  Copyright © 2016年 RayWenderlich. All rights reserved.
//

import UIKit

class WorkTableViewCell: UITableViewCell {

  @IBOutlet weak var moreInfoTextView: UITextView!
  @IBOutlet weak var workTitleLabel: UILabel!
  @IBOutlet weak var workImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
